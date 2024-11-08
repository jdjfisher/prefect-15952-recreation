FROM python:3.9-slim

RUN pip install --upgrade pip
RUN pip install prefect==3.1.0

COPY flow.py .

# RUN prefect config set PREFECT_LOGGING_LEVEL=DEBUG
RUN prefect config set PREFECT_API_URL=http://server:4200/api

# Increase race condition odds
RUN prefect config set PREFECT_WORKER_QUERY_SECONDS=1  

CMD [ "prefect", "worker", "start", "--pool", "my-work-pool", "--limit", "1" ]
