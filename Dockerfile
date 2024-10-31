FROM vulhub/flask:1.1.1
WORKDIR /app
COPY ./* /app
EXPOSE 8080
CMD ["python","app_flask.py"]