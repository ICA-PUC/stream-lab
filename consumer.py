import cv2

cap = cv2.VideoCapture("rtmp://172.18.0.3/live/test")
while cap.isOpened():
    ret, frame = cap.read()
    if ret:
        print(frame.shape)
    else:
        break
cap.release()
