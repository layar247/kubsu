FROM python:3.10-alpine AS builder
WORKDIR /app
COPY . .
RUN apk add --no-cache make gcc python3-dev musl-dev libffi-dev
RUN pip install --upgrade pip
RUN pip install uvicorn
RUN make install-dev

FROM python:3.10-alpine AS runtime
WORKDIR /app
COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app
RUN apk add --no-cache make libffi
ENV PATH="/usr/local/bin:${PATH}"
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]