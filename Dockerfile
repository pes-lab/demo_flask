FROM vulhub/flask:1.1.1
COPY app_flask.py /app
COPY templates/ /app
WORKDIR /app
EXPOSE 8080
CMD ["python","app_flask.py"]