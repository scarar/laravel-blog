# NGINX Deployment Guide for Laravel Blog

This guide explains how to deploy the Laravel blog using NGINX. Follow these steps carefully to ensure a secure and optimized deployment.

## Prerequisites

- NGINX installed
- PHP 8.2+ with FPM
- MySQL/MariaDB
- Composer
- Node.js & NPM
- SSL certificate (recommended)

## Server Requirements

```bash
# Install required packages
sudo apt update
sudo apt install -y nginx php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl
```

## Directory Structure

The deployment script will set up the following structure:
```
/var/www/blog/
├── public/         # NGINX root directory
├── storage/        # Needs write permissions
├── bootstrap/      # Needs write permissions
└── ...            # Other Laravel files
```

## Deployment Steps

1. **Prepare the Server**
   ```bash
   # Create deployment directory
   sudo mkdir -p /var/www/blog
   sudo chown -R www-data:www-data /var/www/blog
   ```

2. **Deploy the Application**
   ```bash
   # Run deployment script
   sudo ./deploy-nginx.sh
   ```

3. **Configure Domain**
   - Edit /etc/nginx/sites-available/blog.conf
   - Replace yourdomain.com with your actual domain

4. **Set Up SSL (Recommended)**
   ```bash
   sudo apt install certbot python3-certbot-nginx
   sudo certbot --nginx -d yourdomain.com
   ```

## Configuration Files

1. **NGINX Configuration** (nginx.conf)
   - Server block configuration
   - PHP-FPM settings
   - Security headers
   - Caching rules

2. **Deployment Script** (deploy-nginx.sh)
   - Automated deployment process
   - Permission settings
   - Laravel optimization
   - Service restart

## Security Measures

1. **File Permissions**
   - Public directory: 755
   - Storage & cache: 775
   - .env file: 644

2. **Access Control**
   - Blocked sensitive files
   - Protected system directories
   - Secure headers enabled

3. **SSL/TLS**
   - HTTPS enforcement
   - Modern cipher suites
   - HSTS enabled

## Performance Optimizations

1. **NGINX Level**
   - Gzip compression
   - Static file caching
   - FastCGI caching
   - Worker optimization

2. **Laravel Level**
   - Route caching
   - Config caching
   - View caching
   - Composer optimization

## Monitoring

1. **Log Locations**
   ```
   /var/log/nginx/blog-access.log  # Access logs
   /var/log/nginx/blog-error.log   # Error logs
   /var/www/blog/storage/logs/     # Laravel logs
   ```

2. **Health Checks**
   ```bash
   # Check NGINX status
   sudo systemctl status nginx

   # Check PHP-FPM status
   sudo systemctl status php8.2-fpm

   # Test NGINX config
   sudo nginx -t
   ```

## Common Issues

1. **502 Bad Gateway**
   - Check PHP-FPM is running
   - Verify socket path in NGINX config
   - Check PHP-FPM error logs

2. **Permission Errors**
   ```bash
   # Fix storage permissions
   sudo chown -R www-data:www-data /var/www/blog/storage
   sudo chmod -R 775 /var/www/blog/storage
   ```

3. **Asset Loading**
   - Run php artisan storage:link
   - Check public directory permissions
   - Verify asset compilation

## Maintenance

1. **Regular Updates**
   ```bash
   # Update application
   cd /var/www/blog
   git pull
   sudo ./deploy-nginx.sh
   ```

2. **Backup Strategy**
   ```bash
   # Database backup
   mysqldump -u user -p blog > backup.sql

   # File backup
   tar -czf blog_backup.tar.gz /var/www/blog
   ```

3. **Log Rotation**
   - Configure logrotate
   - Monitor disk space
   - Archive old logs

## Support

For deployment issues:
1. Check the logs
2. Verify configurations
3. Test in staging first
4. Contact support if needed

## License

This deployment configuration is part of the Laravel blog project, licensed under the MIT license.