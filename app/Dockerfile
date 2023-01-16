FROM python:3.7-alpine as build-stage

COPY . /app

WORKDIR /app

RUN python3 -m venv venv && . venv/bin/activate

RUN pip install --upgrade pip && pip install -r requirements.txt


FROM python:3.7-alpine

COPY --from=build-stage /app /app

WORKDIR /app

EXPOSE 5000

CMD ["python3", "main.py"]



