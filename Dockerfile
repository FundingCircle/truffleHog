FROM python:3-alpine

RUN apk update && apk upgrade
RUN apk add --no-cache bash git jq
WORKDIR /app/trufflehog/

COPY requirements.txt /app/trufflehog/requirements.txt
RUN pip install -r /app/trufflehog/requirements.txt
COPY . /app/trufflehog

RUN pip install /app/trufflehog

ENTRYPOINT ["/app/trufflehog/truffleHogger.sh"]
