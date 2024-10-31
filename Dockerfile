FROM vulhub/flask:1.1.1
COPY app_flask.py /opt
WORKDIR /opt
EXPOSE 8080
CMD ["python","app_flask.py"]