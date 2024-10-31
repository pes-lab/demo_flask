FROM vulhub/flask:1.1.1
WORKDIR /app
ADD templates /app
COPY app_flask.py /app
EXPOSE 8080
CMD ["python","app_flask.py"]