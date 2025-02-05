# Laravel Blog (Production)

This is the production branch of our Laravel blog project. This branch contains the stable, optimized, and production-ready code.

## Production Features

- Optimized performance
- Security hardening
- Production configurations
- Error handling and logging
- Monitoring setup
- Backup solutions

## Server Requirements

- PHP 8.2 or higher
- Nginx/Apache
- MySQL/MariaDB
- Redis (optional)
- SSL certificate
- Composer
- Node.js & NPM

## Deployment

1. Clone the production branch:
```bash
git clone -b production https://github.com/scarar/laravel-blog.git
cd laravel-blog
```

2. Install production dependencies:
```bash
composer install --no-dev --optimize-autoloader
npm ci --production
```

3. Set up environment:
```bash
cp .env.production .env
php artisan key:generate
```

4. Optimize application:
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

5. Run migrations:
```bash
php artisan migrate --force
```

## Production Configuration

1. Web Server:
   - Use nginx.conf for NGINX
   - Enable required modules
   - Configure SSL

2. PHP:
   - Optimize OPcache
   - Configure FPM
   - Set memory limits

3. Database:
   - Configure connections
   - Set up replication
   - Regular backups

## Security Measures

- HTTPS enforced
- Headers configured
- File permissions set
- Firewall rules
- Rate limiting
- DDoS protection

## Monitoring

1. Log Locations:
   ```
   /var/log/nginx/blog-access.log  # Access logs
   /var/log/nginx/blog-error.log   # Error logs
   /var/www/blog/storage/logs/     # Laravel logs
   ```

2. Health Checks:
   ```bash
   # Check NGINX status
   sudo systemctl status nginx

   # Check PHP-FPM status
   sudo systemctl status php8.2-fpm

   # Test NGINX config
   sudo nginx -t
   ```

## Maintenance

1. Regular Tasks:
   - Log rotation
   - Cache clearing
   - Session cleanup
   - Temp file cleanup

2. Updates:
   - Security patches
   - Dependency updates
   - System updates

## Performance

- Asset optimization
- Database indexing
- Cache configuration
- Queue workers
- Load balancing

## Branch Information

This is the `production` branch:
- Stable releases only
- Thoroughly tested
- Performance optimized
- Security hardened

Other branches:
- `main`: Development
- `initial-setup`: Base implementation

## Documentation

- [Deployment Guide](docs/deployment.md)
- [Server Setup](docs/server.md)
- [Monitoring](docs/monitoring.md)
- [Backup](docs/backup.md)
- [Emergency](docs/emergency.md)

## Support

For production support:
- Email: support@yourdomain.com
- Emergency: +1-XXX-XXX-XXXX

## License

This project is open-sourced software licensed under the [MIT license](LICENSE).