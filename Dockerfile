FROM python:3.12-slim
RUN pip3 install flask
COPY app_flask.py /opt
WORKDIR /opt
EXPOSE 8080
CMD ["python","app_flask.py"]
