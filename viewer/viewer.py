"""Consume RTMP streaming"""
import cv2

cap = cv2.VideoCapture("rtmp://rtmp-server/live/test")

while cap.isOpened():
    ret, frame = cap.read()
    if ret:
        print(frame.shape)
    else:
        break
cap.release()
