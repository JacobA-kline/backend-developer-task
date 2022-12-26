FROM python:3.8.16-slim

EXPOSE 5000

COPY ./app /app

WORKDIR /app

RUN pip install --upgrade pip && pip install -r requirments.txt

RUN python3 main.py



