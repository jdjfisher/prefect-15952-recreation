FROM python:3.9-slim

RUN pip install --upgrade pip
RUN pip install prefect==3.1.0

COPY flow.py .
COPY setup_deployment .

# RUN prefect config set PREFECT_LOGGING_LEVEL=DEBUG
RUN prefect config set PREFECT_API_URL=http://server:4200/api

CMD [ "./setup_deployment" ]