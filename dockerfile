# Use an official PHP base image
FROM php:7.4-cli

# Set the working directory in the container
WORKDIR /app

# Copy the composer.json and composer.lock files
COPY composer.json composer.lock /app/

# Install dependencies using composer
RUN apt-get update && \
    apt-get install -y git && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install

# Copy the rest of the application code
COPY . /app

# Expose the port your PHP server listens on (if applicable)
EXPOSE 80

# Command to run your PHP server (adjust as needed)
CMD ["php", "-S", "0.0.0.0:80", "-t", "public/"]
