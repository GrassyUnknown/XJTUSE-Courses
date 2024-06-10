import socket, time, threading, struct, selectors


def tcp_transfer(conn_receiver, conn_sender):
    while True:
        try:
            data = conn_receiver.recv(10240)
        except Exception as e:
            print('Failed to receive data:', e)
            break
        if not data:
            print('No data received.')
            break
        try:
            conn_sender.sendall(data)
        except Exception:
            print('Failed sending data.', e)
            break
    conn_receiver.close()
    conn_sender.close()
    return


def join(connA, connB):
    threading.Thread(target=tcp_transfer, args=(connA, connB)).start()
    threading.Thread(target=tcp_transfer, args=(connB, connA)).start()
    return

sel = selectors.DefaultSelector()
class Frpserver(threading.Thread):
    def __init__(self, port, targetport):
        threading.Thread.__init__(self)
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.bind(('0.0.0.0', port))

        self.sock.setblocking(False)
        self.sock.listen(100)
        sel.register(self.sock,selectors.EVENT_READ,self.accept_connection)

        frp_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        frp_sock.bind(('0.0.0.0', targetport))
        frp_sock.setblocking(False)
        frp_sock.listen(100)
        sel.register(frp_sock,selectors.EVENT_READ,self.accept_frp_connection)


        self.frp_cmd_conn =None
        self.userConns = []


    def heartbeat(self):
        while True:
            if self.frp_cmd_conn is not None:
                self.frp_cmd_conn.send(struct.pack('i', 1))
            time.sleep(9)

    # 收到用户tcp
    def accept_connection(self,sock, mask):
        userConn, addr = self.sock.accept()
        userConn.setblocking(True)
        self.userConns.append(userConn)
        print('收到用户请求')
        if self.frp_cmd_conn is None:
            print('不存在tcp控制连接')
            return
        try:
            self.frp_cmd_conn.send(struct.pack('i',2)) #建立新的tcp
        except IOError as err: 
            print(err)
            pass



    def accept_frp_connection(self,sock, mask):
        frp_conn, addr = sock.accept()
        frp_conn.setblocking(False)
        sel.register(frp_conn, selectors.EVENT_READ, self.handle_controller_data)

    def handle_controller_data(self,frp_conn, mask):
        try:
            data = frp_conn.recv(4) 
            if data:
                cmd = struct.unpack('i',data)[0]
                print("收到控制报文；",cmd)
                if cmd ==2: 
                    sel.unregister(frp_conn)
                    userConn = self.userConns.pop()
                    frp_conn.setblocking(True)
                    join(userConn,frp_conn)
                elif cmd ==1 and self.frp_cmd_conn!=frp_conn: 
                    self.frp_cmd_conn = frp_conn
                    threading.Thread(target=self.heartbeat).start()
        except IOError as err:  
            pass


    def run(self):
        while True:
            events = sel.select()
            for key, mask in events:
                callback = key.data
                callback(key.fileobj, mask)


if __name__ == '__main__':

    frpport = int(input('请输入frp连接端口:'))
    userport = int(input('请输入用户访问端口:'))


    print('正在启动FRP服务端...')
    Frpserver(userport, frpport).start()
    print('FRP服务端启动成功')
