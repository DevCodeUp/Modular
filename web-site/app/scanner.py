from flask import Flask, render_template, Response
from tensorflow.keras.models import load_model
import numpy as np
import cv2
import os

app = Flask(__name__)

# Manejo de errores al cargar el modelo
model_path = os.path.join('static', 'modelos', 'AICC9_96_43.h5')
try:
    model = load_model(model_path)
except Exception as e:
    print(f"Error loading model: {e}")

def preprocess_frame(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    resized = cv2.resize(gray, (200, 200))
    normalized = resized / 255.0
    return np.expand_dims(normalized, axis=(0, -1))

def generate_frames():
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        print("Error: Unable to access the camera.")
        return

    while True:
        success, frame = cap.read()
        if not success:
            break
        else:
            preprocessed_frame = preprocess_frame(frame)
            prediction = model.predict(preprocessed_frame)[0][0]
            label = "Bueno" if prediction > 0.5 else "Defectuoso"
            color = (0, 255, 0) if label == "Bueno" else (0, 0, 255)

            cv2.putText(frame, label, (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, color, 2, cv2.LINE_AA)
            ret, buffer = cv2.imencode('.jpg', frame)
            frame = buffer.tobytes()

            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/video_feed')
def video_feed():
    return Response(generate_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == '__main__':
    app.run(debug=True)