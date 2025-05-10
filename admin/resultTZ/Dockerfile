FROM python:3.10-alpine AS runtime
WORKDIR /app
RUN apk add --no-cache make
COPY . .
RUN make install
EXPOSE 8000
CMD ["make", "run"]