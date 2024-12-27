FROM python:3.9-alpine as build

COPY . /app

WORKDIR /app

RUN python3 -m venv venv
RUN . venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

FROM python:3.9-alpine

COPY --from=build /app /app

WORKDIR /app

EXPOSE 8080

CMD ["sh", "-c", ". venv/bin/activate && python3 main.py"]
