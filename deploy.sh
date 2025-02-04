#!/bin/bash

# Exit on error
set -e

echo "Starting deployment process..."

# Pull latest changes
echo "Pulling latest changes..."
git pull origin main

# Install dependencies
echo "Installing dependencies..."
composer install --optimize-autoloader --no-dev

# Clear all caches
echo "Clearing caches..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Maintenance mode
echo "Enabling maintenance mode..."
php artisan down

# Run database migrations
echo "Running database migrations..."
php artisan migrate --force

# Optimize
echo "Optimizing application..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Set proper permissions
echo "Setting proper permissions..."
chmod -R 755 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache

# Clear opcache
echo "Clearing PHP opcache..."
echo '<?php opcache_reset(); ?>' > /tmp/opcache_reset.php
php /tmp/opcache_reset.php
rm /tmp/opcache_reset.php

# Disable maintenance mode
echo "Disabling maintenance mode..."
php artisan up

echo "Deployment completed successfully!"