# Menggunakan Alpine Linux yang ringan
FROM alpine:latest

# Install curl untuk download ngrok
RUN apk add --no-cache curl

# Download dan install Ngrok
RUN curl -s https://equinox.io | tar xz -C /usr/local/bin

# Jalankan ngrok secara dinamis menggunakan variabel dari Railway
# Default port ke 80 jika variabel PORT tidak ada
CMD ["sh", "-c", "ngrok http ${PORT:-80} --authtoken ${NGROK_AUTHTOKEN} --log stdout"]
