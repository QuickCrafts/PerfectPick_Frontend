# Use the official Flutter SDK as a builder stage
FROM ubuntu:latest AS builder

# Install dependencies
RUN apt-get update -y && apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="$PATH:/usr/local/flutter/bin"

# Add Flutter to system PATH and enable web
RUN flutter precache
RUN flutter config --enable-web

# Copy the source code into the Docker image and build the web app
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web

# Use Nginx to serve the Flutter web app
FROM nginx:alpine

# Copy the built app to the Nginx server
COPY --from=builder /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
