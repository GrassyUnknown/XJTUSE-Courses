# server端代码
import os
import socket
import sys
from threading import Thread
import time
import signal

IP = "127.0.0.1"
MESSAGE_PORT = 8989
AUDIO_PORT = 8990


class Server:
    def __init__(self):
        self.mess_record = ""
        self.server = socket.socket()
        self.server.bind((IP, MESSAGE_PORT))
        self.server.listen(5)
        self.clients = []
        self.clients_name_ip = {}
        self.user_credentials = {"guo": "si", "si": "si"}
        self.get_conn()

    def authenticate(self, client):
        mode = client.recv(1024).decode()
        print(mode)
        if mode == "0":
            username = client.recv(1024).decode()
            password = client.recv(1024).decode()
            if username in self.user_credentials:
                client.send("注册失败，已存在该用户名".encode())
                client.close()
                return None
            else:
                self.user_credentials[username] = password
                client.send("注册并登录成功".encode())
                return username
        username = client.recv(1024).decode()
        print(username)
        password = client.recv(1024).decode()
        print(password)
        print(mode, username, password)
        if (
            username in self.user_credentials
            and self.user_credentials[username] == password
        ):
            client.send("登录成功".encode())
            return username
        else:
            client.send("登录失败，请重新连接并尝试".encode())
            client.close()
            return None

    # 监听客户端链接
    def get_conn(self):
        while True:
            client, address = self.server.accept()
            print(address)
            username = self.authenticate(client)
            is_login = client.recv(1024).decode()
            if username and "成功" in is_login:
                print(f"{username} ({address}) 已连接")
                self.clients.append(client)
                self.clients_name_ip[address] = username
                Thread(target=self.get_msg, args=(client, username, address)).start()

    # 进行所有客户端消息的处理
    def get_msg(self, client, username, address):
        # 消息接收处理逻辑
        address = client.getpeername()
        username = self.clients_name_ip[address]
        # time.sleep(2)
        with open("./mess_record.txt", "r") as f:
            self.mess_record = f.read()
        self.mess_record = " \n" + self.mess_record
        client.send(self.mess_record.encode())
        while True:
            try:
                header = client.recv(1024).decode()  # 接收消息头
                print(header)
                if header == "\n":
                    continue
                if header.startswith("file:"):
                    filename, filesize = header[5:].split(":")
                    filesize = int(filesize)
                    with open(f"./files/{filename}", "wb") as f:
                        bytes_recvd = 0
                        while bytes_recvd < filesize:
                            chunk = client.recv(min(filesize - bytes_recvd, 1024))
                            if not chunk:
                                break
                            f.write(chunk)
                            bytes_recvd += len(chunk)
                    print("bytes_recvd:", bytes_recvd)
                    file_announcement = f"file:{filename}:{filesize}"
                    print(file_announcement)
                    for c in self.clients:
                        c.send(
                            f"{username} {time.strftime('%X')}\n发送了文件:{filename}，大小：{filesize}\n".encode()
                        )
                        with open("./mess_record.txt", "a") as f:
                            f.write(
                                f"{username} {time.strftime('%X')}\n发送了文件:{filename}，大小：{filesize}\n"
                            )
                        if c != client:
                            print("send file")
                            time.sleep(0.1)
                            c.send(file_announcement.encode())
                            time.sleep(0.1)
                            with open(f"./files/{filename}", "rb") as f:
                                bytes_send = 0
                                while bytes_send < filesize:
                                    bytes_read = f.read(
                                        min(filesize - bytes_send, 1024)
                                    )
                                    if not bytes_read:
                                        break
                                    c.send(bytes_read)
                                    bytes_send += len(bytes_read)
                                    print(bytes_send)
                elif header.startswith("audio:"):
                    audio_mode = header.split(":")[-1]
                    if audio_mode == "start":
                        self.audioing = 1
                        self.audio = Thread(target=self.handle_audio).start()
                    else:
                        self.audioing = 0
                elif header.startswith("download:"):
                    time.sleep(0.1)
                    files = os.listdir("./files")
                    files_list = "filelist:文件列表:\n" + "\n".join(
                        f"{i}:{file}" for i, file in enumerate(files)
                    )
                    client.send(files_list.encode())
                    file_idx = int(client.recv(1024).decode())

                    off_filename = files[file_idx]
                    try:
                        with open(f"./files/{off_filename}", "rb") as f:
                            if f:
                                print("成功打开:", off_filename)
                            filesize = os.stat(f"./files/{off_filename}").st_size
                            print(f"file:{off_filename}:{filesize}")
                            client.send(f"file:{off_filename}:{filesize}".encode())
                            time.sleep(0.1)
                            bytes_send = 0
                            while bytes_send < filesize:
                                bytes_read = f.read(min(filesize - bytes_send, 1024))
                                if not bytes_read:
                                    break
                                client.send(bytes_read)
                                bytes_send += len(bytes_read)
                                print(bytes_send)
                        print(f"{off_filename} has been sent.")
                    except FileNotFoundError:
                        client.send("error:File not found".encode())

                elif header.upper() == "Q":
                    self.close_client(client, address)
                    break
                else:
                    print(header)
                    for c in self.clients:
                        c.send(f"{username} {time.strftime('%X')}\n{header}\n".encode())
                    with open("./mess_record.txt", "a") as f:
                        f.write(f"{username} {time.strftime('%X')}\n{header}\n")

            except Exception as e:
                self.close_client(client, address)
                break

    # 关闭资源
    def close_client(self, client, address):
        self.clients.remove(client)
        client.close()

        print(self.clients_name_ip[address] + "已经离开")
        for c in self.clients:
            c.send((self.clients_name_ip[address] + "已经离开").encode())


if __name__ == "__main__":
    Server()
