FROM python:3.10-alpine AS builder
WORKDIR /app
COPY . .
RUN apk add --no-cache make
RUN pip install --upgrade pip
RUN pip install uvicorn
RUN make install-dev

FROM python:3.10-alpine AS runtime
WORKDIR /app
COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app
RUN apk add --no-cache libpq
ENV PATH="/usr/local/bin:${PATH}"
EXPOSE 60080
CMD ["make", "run"]