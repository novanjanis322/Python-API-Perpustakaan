FROM python:3.11

WORKDIR /app
COPY app.py .
RUN   pip install flask_mysqldb flask
COPY . .
CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0", "--port=50"]

