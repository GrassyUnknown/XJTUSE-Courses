import sys, socket, time, threading, struct, selectors


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
class Frpclient():
    def __init__(self, serverhost,serverport, targethost,targetport):
        self.targethost=targethost
        self.targetport=targetport
        self.serverhost=serverhost
        self.serverport=serverport
        self.server_fd = socket.create_connection((self.serverhost,self.serverport))
        self.server_fd.sendall(struct.pack('i', 1)) 
        self.server_fd.setblocking(False)
        sel.register(self.server_fd,selectors.EVENT_READ,self.handle_controller_data)

        self.workConnPool = []
        threading.Thread(target=self.maitainConPool).start()
        threading.Thread(target=self.heartbeat).start()

    def heartbeat(self):
        print("启动tcp连接保持")
        while True:
            if self.server_fd is not None:
                self.server_fd.send(struct.pack('i', 1))
            time.sleep(9)

    def maitainConPool(self):
        print("启动tcp连接池")
        pool_size = 0
        while True:
            if len(self.workConnPool)<pool_size:
                print(1)
                workConn = socket.create_connection((self.serverhost,self.serverport))
                targetConn = socket.create_connection((self.targethost, self.targetport))
                join(targetConn,workConn)
                self.workConnPool.append(workConn)

    def handle_controller_data(self,server_fd, mask):
        try:
            data= server_fd.recv(4)
            if data:
                cmd = struct.unpack('i',data)[0]
                print('收到控制报文:',cmd)
                if cmd ==2: 
                    if len(self.workConnPool)>0:
                        workConn = self.workConnPool.pop()
                    else:
                        targetConn = socket.create_connection((self.targethost, self.targetport))
                        workConn = socket.create_connection((self.serverhost,self.serverport))
                        join(targetConn,workConn)
                    workConn.sendall(struct.pack('i',2))
                    print("建立工作tcp")
        except IOError:  
            pass

    def run(self):
        print('FRP已启动')
        while True:
            events = sel.select()
            for key, mask in events:
                callback = key.data
                callback(key.fileobj, mask)


if __name__ == '__main__':
    
    remothost = input("请输入服务端的ip地址:")
    remoteport = int(input("请输入服务端的端口:"))
    targethost = input("请输入服务主机的ip地址:")
    targetport = int(input("请输入服务主机的端口:"))

    print('正在启动FRP...')
    frpclient = Frpclient(remothost,remoteport, targethost,targetport)
    frpclient.run()

    print('FRP已关闭')
    
