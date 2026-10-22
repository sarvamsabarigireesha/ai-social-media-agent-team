FROM python:3.12-slim

WORKDIR /app
COPY . /app

EXPOSE 7860
ENV PORT=7860

CMD ["python3", "server.py"]
