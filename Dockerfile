FROM python:3.10

ARG WORKDIR=/pj

WORKDIR ${WORKDIR}

RUN apt update && apt upgrade -y

RUN pip install --requirement requirements.txt

COPY ./apps/app.py app.py
COPY ./apps apps
COPY settings.py settings.py

ENTRYPOINT ["python", "-m", "flask", "run"]