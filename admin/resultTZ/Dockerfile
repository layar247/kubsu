# Stage 1
FROM python:3.10-alpine AS builder
WORKDIR /app
COPY . .

RUN apk add --no-cache make gcc musl-dev
RUN make install-dev  # Устанавливаем и runtime, и test зависимости

# Stage 2
FROM python:3.10-alpine AS runtime
WORKDIR /app

COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /app /app

RUN apk add --no-cache make
RUN make install

EXPOSE 8000
CMD ["make", "run"]