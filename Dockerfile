FROM python:3-alpine

RUN apk add --no-cache --upgrade bash git jq

WORKDIR /app/trufflehog/

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

RUN pip install .

ENTRYPOINT ["/app/trufflehog/truffleHogger.sh"]
