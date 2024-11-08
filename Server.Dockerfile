FROM python:3.9

RUN pip install --upgrade pip
RUN pip install prefect==3.1.0

# RUN prefect config set PREFECT_LOGGING_LEVEL=DEBUG

RUN prefect config set PREFECT_API_DATABASE_CONNECTION_URL="postgresql+asyncpg://postgres:secret@postgres:5432/prefect"

EXPOSE 4200

CMD [ "prefect", "server", "start", "--host", "0.0.0.0"]
