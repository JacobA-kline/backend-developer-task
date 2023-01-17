FROM python:3.7-alpine as build

COPY . /app

WORKDIR /app

RUN python3 -m venv venv
RUN . venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

FROM python:3.7-alpine

COPY --from=build /app /app

WORKDIR /app

EXPOSE 5000

CMD ["sh", "-c", ". venv/bin/activate && python3 main.py"]
