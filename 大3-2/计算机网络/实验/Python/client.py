# client端代码
import shutil, os
import time
from PyQt5 import QtGui
from PyQt5.QtGui import QFont
from PyQt5.QtWidgets import *
import sys
import socket
from threading import Thread
from PyQt5.QtCore import pyqtSignal

IP = "127.0.0.1"
MESSAGE_PORT = 8989
AUDIO_PORT = 8990


class LoginDialog(QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("登录/注册")
        self.setGeometry(700, 400, 300, 200)

        layout = QGridLayout()

        # 添加选择按钮
        self.mode_combo = QComboBox()
        self.mode_combo.addItem("登录", 1)
        self.mode_combo.addItem("注册", 0)
        layout.addWidget(QLabel("选择模式:"), 0, 0)
        layout.addWidget(self.mode_combo, 0, 1)

        # 用户名和密码输入
        self.username = QLineEdit()
        self.password = QLineEdit()
        self.password.setEchoMode(QLineEdit.Password)
        layout.addWidget(QLabel("用户名:"), 1, 0)
        layout.addWidget(self.username, 1, 1)
        layout.addWidget(QLabel("密码:"), 2, 0)
        layout.addWidget(self.password, 2, 1)

        # 登录按钮
        login_button = QPushButton("确定")
        login_button.clicked.connect(self.accept)
        layout.addWidget(login_button, 3, 1)

        self.setLayout(layout)

    def get_credentials(self):
        return self.mode_combo.currentData(), self.username.text(), self.password.text()


class Client(QWidget):
    update_text_signal = pyqtSignal(str)
    file_received_signal = pyqtSignal(str, int)

    def __init__(self):
        QWidget.__init__(self)
        self.is_his = 0
        self.block = 0
        self.offtransing = 0
        self.update_text_signal.connect(self.update_text)
        self.file_received_signal.connect(self.prompt_save_file)
        self.setGeometry(600, 300, 1000, 1000)
        self.setWindowTitle("聊天室")
        palette = QtGui.QPalette()
        bg = QtGui.QPixmap("./bg.png")
        palette.setBrush(self.backgroundRole(), QtGui.QBrush(bg))
        self.setPalette(palette)
        self.add_ui()
        
        # 与服务器链接
        self.client = socket.socket()
        self.client.connect((IP, MESSAGE_PORT))
        # 调用线程
        self.is_login = self.handle_login()
        self.work_thread()  # 设置界面组件

    def handle_login(self):
        dialog = LoginDialog()
        if dialog.exec_() == QDialog.Accepted:
            mode, username, password = dialog.get_credentials()
            print(mode, username, password)
            self.client.send(str(mode).encode())
            time.sleep(0.1)
            self.client.send(username.encode())
            time.sleep(0.1)
            self.client.send(password.encode())
            time.sleep(0.1)
            response = self.client.recv(1024).decode()
            print(response)
            if "失败" in response:
                QMessageBox.warning(self, "登录失败", response)
                exit()
            QMessageBox.information(
                self, "成功", "登录成功!" if mode == 1 else "注册并登录成功!"
            )
            return True
        return False

    def add_ui(self):
        self.content = QTextBrowser(self)
        self.content.setGeometry(100, 75, 800, 600)
        self.content.setStyleSheet(
            "QTextBrowser {border: 2px solid #4CAF50; border-radius: 10px;}"
        )

        # 单行文本
        self.message = QLineEdit(self)
        self.message.setPlaceholderText("请输入发送内容")
        self.message.setGeometry(70, 750, 850, 100)
        self.message.setStyleSheet(
            "QLineEdit {border: 2px solid #4CAF50; border-radius: 10px;}"
        )
        self.message.returnPressed.connect(self.send_msg)  # 连接回车键

        # 发送按钮
        self.button = QPushButton("发送", self)
        self.button.setFont(QFont("微软雅黑", 10, QFont.Bold))
        self.button.setGeometry(750, 900, 150, 75)
        self.button.setStyleSheet(
            "QPushButton {background-color: #4CAF50; color: white; border-radius: 10px;}"
        )
        self.button.clicked.connect(self.send_msg)  # 连接按钮点击事件

        # 发送文件
        self.send_file_button = QPushButton("发送文件", self)
        self.send_file_button.setFont(QFont("微软雅黑", 10, QFont.Bold))
        self.send_file_button.setGeometry(550, 900, 150, 75)
        self.send_file_button.setStyleSheet(
            "QPushButton {background-color: #4CAF50; color: white; border-radius: 10px;}"
        )
        self.send_file_button.clicked.connect(self.send_file)

        # 退出按钮
        self.send_quit = QPushButton("结束会话", self)
        self.send_quit.setFont(QFont("微软雅黑", 10, QFont.Bold))
        self.send_quit.setGeometry(350, 900, 150, 75)
        self.send_quit.setStyleSheet(
            "QPushButton {background-color: #4CAF50; color: white; border-radius: 10px;}"
        )
        self.send_quit.clicked.connect(self.quit)

        # 离线文件
        self.send_off_file = QPushButton("离线文件", self)
        self.send_off_file.setFont(QFont("微软雅黑", 10, QFont.Bold))
        self.send_off_file.setGeometry(150, 900, 150, 75)
        self.send_off_file.setStyleSheet(
            "QPushButton {background-color: #4CAF50; color: white; border-radius: 10px;}"
        )
        self.send_off_file.clicked.connect(self.download_off_files)

    def quit(self):
        self.client.send("Q".encode())
        self.client.close()
        self.destroy()
        exit()

    def send_file(self):
        fname = QFileDialog.getOpenFileName(self, "Open file", "C:\\Users\\24040\\Desktop\\test\\homework\\network")
        if fname[0]:
            filesize = os.path.getsize(fname[0])
            header = f"file:{os.path.basename(fname[0])}:{filesize}"
            print(header)
            self.client.send(header.encode())
            time.sleep(0.1)
            with open(fname[0], "rb") as f:
                while True:
                    bytes_read = f.read(1024)
                    if not bytes_read:
                        break
                    self.client.send(bytes_read)

    def download_off_files(self):
        print(self.offtransing)
        self.client.send("download:".encode())

    def send_msg(self):
        msg = self.message.text()
        self.client.send((msg + "\n").encode())
        if msg.upper() == "Q":
            self.client.close()
            self.destroy()
            exit()
        self.message.clear()

    # 接受消息
    def recv_msg(self):
        while True:
            data = self.client.recv(4096).decode()
            print("data:", data)
            if data.startswith("file:"):
                _, filename, filesize = data.split(":")
                filesize = int(filesize)
                self.block = 1
                self.file_received_signal.emit(filename, filesize)
                while self.block:
                    time.sleep(1)
            elif data.startswith("filelist:"):
                file_list = ":".join(data.split(":")[1:])
                self.content.append(file_list + "\n" + "请选择离线下载的文件序号!")
                self.content.moveCursor(self.content.textCursor().End)
            else:
                self.update_text_signal.emit(data)

    def update_text(self, text):
        self.content.append(text)
        # print(self.is_his)
        if self.is_his == 0:
            self.content.append("以上是历史消息!\n")
            self.is_his += 1
        self.content.moveCursor(self.content.textCursor().End)

    def prompt_save_file(self, filename, filesize):
        self.block = 1
        with open(f"./tmp/{filename}", "wb") as f:
            bytes_recvd = 0
            flag = True
            while bytes_recvd < filesize:
                chunk = self.client.recv(min(filesize - bytes_recvd, 1024))
                if not chunk:
                    self.content.append("文件传输出错，已中断传输！")
                    self.content.moveCursor(self.content.textCursor().End)
                    flag = False
                    break
                f.write(chunk)
                bytes_recvd += len(chunk)
                print(bytes_recvd)
        reply = QMessageBox.question(
            self,
            "接收文件",
            f"您想保存文件 {filename} ({filesize} bytes) 吗?",
            QMessageBox.Yes | QMessageBox.No,
            QMessageBox.No,
        )

        if reply == QMessageBox.Yes:
            path, _ = QFileDialog.getSaveFileName(self, "Save File", filename)
            shutil.move(f"./tmp/{filename}", path)
            if flag:
                self.content.append(f"文件： {filename} 已被成功接收并保存至 {path}！")
                self.content.moveCursor(self.content.textCursor().End)

        else:
            os.remove(f"./tmp/{filename}")
            self.content.append("用户取消了文件保存操作。")
            self.content.moveCursor(self.content.textCursor().End)
        self.block = 0

    def btn_send(self):
        self.button.clicked.connect(self.send_msg)

        # 匿名类，线程处理,发送是一个线程，接受是一个线程

    def work_thread(self):
        if self.is_login:
            self.client.send("登陆成功".encode())
            Thread(target=self.btn_send).start()
            Thread(target=self.recv_msg).start()
        else:
            self.client.send("登陆失败".encode())
            exit()


if __name__ == "__main__":
    Q = QApplication(sys.argv)
    client = Client()
    client.show()
    sys.exit(Q.exec())
