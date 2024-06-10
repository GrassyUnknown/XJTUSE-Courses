import socket
import time
import threading

IP = "127.0.0.1"
MESSAGE_PORT = 8989

class Server:
    def __init__(self):
        self.user_credentials = {"guo": "si", "si": "si"}
        self.server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.server.bind((IP, MESSAGE_PORT))

    def handle_client(self, data, address):
        mode, username, password = data.split(',')

        username = username.strip()
        password = password.strip()
        mode = mode.strip()

        if mode == "0":
            if username in self.user_credentials:
                self.server.sendto("注册失败，已存在该用户名".encode(), address)
            else:
                self.user_credentials[username] = password
                self.server.sendto("注册并登录成功".encode(), address)
        else:
            if username in self.user_credentials and self.user_credentials[username] == password:
                self.server.sendto("登录成功".encode(), address)
            else:
                self.server.sendto("登录失败，请重新连接并尝试".encode(), address)

    def start(self):
        print("服务器启动...")
        while True:
            data, address = self.server.recvfrom(1024)
            mode = data.decode()
            print(f"Mode: {mode}")
            username, _ = self.server.recvfrom(1024)
            username = username.decode()
            print(f"Username: {username}")
            password, _ = self.server.recvfrom(1024)
            password = password.decode()
            print(f"Password: {password}")
            full_data = f"{mode},{username},{password}"
            threading.Thread(target=self.handle_client, args=(full_data, address)).start()

if __name__ == "__main__":
    server = Server()
    server.start()