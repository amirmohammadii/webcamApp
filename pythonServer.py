import os
import socket
import cv2
import numpy
import base64
import glob
import sys
import time
import threading
from datetime import datetime

class MyServer:

    def __init__(self, ip, port):
        self.IP = ip
        self.PORT = port
        self.socketOpen()
        self.receiveThread = threading.Thread(target=self.receiveImages)
        self.receiveThread.start()

    def socketClose(self):
        self.sock.close()
        print(u'Server socket is close -> IP: ' + self.IP + '$$$ PORT: ' + str(self.PORT) )

    def socketOpen(self):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR,1)
        self.sock.bind((self.IP, self.PORT))
        self.sock.listen(1)
        print(u'Server socket is open ->  IP: ' + self.IP + ' $$$ PORT: ' + str(self.PORT) )
        self.conn, self.addr = self.sock.accept()
        print(u'Server socket is connected with client -> IP: ' + self.IP + '$$$ PORT: ' + str(self.PORT) )

    def receiveImages(self):

        try:
            while True:
                length = self.recvall(self.conn, 64)
                length1 = length.decode('utf-8')
                stringData = self.recvall(self.conn, int(length1))
                stime = self.recvall(self.conn, 64)
                print('send time: ' + stime.decode('utf-8'))
                data = numpy.frombuffer(base64.b64decode(stringData), numpy.uint8)
                decimg = cv2.imdecode(data, 1)
                cv2.imshow("image", decimg)
                cv2.waitKey(1)
        except Exception as e:
            print(e)
            self.socketClose()
            cv2.destroyAllWindows()
            self.socketOpen()
            self.receiveThread = threading.Thread(target=self.receiveImages)
            self.receiveThread.start()

    def recvall(self, sock, count):
        buf = b''
        while count:
            newbuf = sock.recv(count)
            if not newbuf: return None
            buf += newbuf
            count -= len(newbuf)
        return buf

def main():
    server = MyServer('localhost', 54321)

if __name__ == "__main__":
    main()
