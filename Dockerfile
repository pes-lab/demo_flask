FROM python:3.12-slim
COPY app_flask.py /opt
WORKDIR /opt
EXPOSE 8080
CMD ["python","app_flask.py"]
