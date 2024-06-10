import os
import time
from PyQt5.QtGui import QFont
from PyQt5.QtWidgets import *
import sys
import socket
from threading import Thread

IP = "127.0.0.1"
MESSAGE_PORT = 8989


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
    def __init__(self):
        super().__init__()
        self.setGeometry(600, 300, 800, 600)
        self.setWindowTitle("客户端")
        
        self.client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        
        self.handle_login()

    def handle_login(self):
        dialog = LoginDialog()
        if dialog.exec_() == QDialog.Accepted:
            mode, username, password = dialog.get_credentials()
            print(f"Mode: {mode}, Username: {username}, Password: {password}")
            self.client.sendto(f"{mode}".encode(), (IP, MESSAGE_PORT))
            time.sleep(0.1)
            self.client.sendto(username.encode(), (IP, MESSAGE_PORT))
            time.sleep(0.1)
            self.client.sendto(password.encode(), (IP, MESSAGE_PORT))
            time.sleep(0.1)
            response, _ = self.client.recvfrom(1024)
            response = response.decode()
            print(response)
            if "失败" in response:
                QMessageBox.warning(self, "登录失败", response)
                exit()
            QMessageBox.information(
                self, "成功", "登录成功!" if mode == 1 else "注册并登录成功!"
            )
            return True
        return False


if __name__ == "__main__":
    app = QApplication(sys.argv)
    client = Client()
    client.show()
    sys.exit(app.exec_())