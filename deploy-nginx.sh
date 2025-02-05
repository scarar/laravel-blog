#!/bin/bash

# Exit on error
set -e

echo "Starting deployment process..."

# Configuration
DEPLOY_PATH="/var/www/blog"
NGINX_USER="www-data"
NGINX_GROUP="www-data"
PHP_VERSION="8.2"  # Change this to match your PHP version

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or with sudo"
    exit 1
fi

echo "Creating deployment directory..."
mkdir -p $DEPLOY_PATH

echo "Copying files..."
cp -R . $DEPLOY_PATH/

echo "Setting correct permissions..."
chown -R $NGINX_USER:$NGINX_GROUP $DEPLOY_PATH
chmod -R 755 $DEPLOY_PATH
chmod -R 775 $DEPLOY_PATH/storage
chmod -R 775 $DEPLOY_PATH/bootstrap/cache

echo "Installing production dependencies..."
cd $DEPLOY_PATH
composer install --no-dev --optimize-autoloader
npm ci --production
npm run build

echo "Setting up environment file..."
if [ ! -f "$DEPLOY_PATH/.env" ]; then
    cp .env.production .env
    php artisan key:generate
fi

echo "Optimizing Laravel..."
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan storage:link

echo "Setting up NGINX configuration..."
cp nginx.conf /etc/nginx/sites-available/blog.conf
ln -sf /etc/nginx/sites-available/blog.conf /etc/nginx/sites-enabled/

echo "Testing NGINX configuration..."
nginx -t

echo "Restarting services..."
systemctl restart php$PHP_VERSION-fpm
systemctl reload nginx

echo "Clearing caches..."
php artisan cache:clear
php artisan config:clear
php artisan view:clear

echo "Running migrations..."
php artisan migrate --force

echo "Checking Laravel installation..."
php artisan --version

echo "Deployment completed successfully!"
echo "
Next steps:
1. Configure your domain in /etc/nginx/sites-available/blog.conf
2. Set up SSL with: certbot --nginx -d yourdomain.com
3. Check the logs at:
   - /var/log/nginx/blog-error.log
   - $DEPLOY_PATH/storage/logs/laravel.log
"