FROM vulhub/flask:1.1.1
RUN mkdir /app/templates
COPY app_flask.py /app
COPY templates /app/templates
WORKDIR /app
EXPOSE 8080
CMD ["python","app_flask.py"]