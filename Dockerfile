FROM python:3.12

WORKDIR /app

COPY requirements.txt .

ARG WELCOME_MESSAGE

ENV WELCOME_MESSAGE=$WELCOME_MESSAGE

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

COPY . .

CMD ["python", "app.py"]
