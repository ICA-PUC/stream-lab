"""Consume RTMP streaming"""
import sys
import cv2

stream_ip = sys.argv[1]

cap = cv2.VideoCapture(f"rtmp://{stream_ip}/live/test")

while cap.isOpened():
    ret, frame = cap.read()
    if ret:
        print(frame.shape)
    else:
        break
cap.release()
