# Laravel Blog

A simple, elegant blog built with Laravel 11.x and styled with Tailwind CSS.

## Features

- Clean, responsive design
- Full CRUD operations for blog posts
- SEO-friendly URLs using slugs
- Markdown support for post content
- Post timestamps and "time ago" dates
- Validation for post creation and updates

## Requirements

- PHP 8.2 or higher
- Composer
- MySQL/MariaDB
- Node.js & NPM (for asset compilation)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/laravel-blog.git
cd laravel-blog
```

2. Install PHP dependencies:
```bash
composer install
```

3. Copy the example environment file:
```bash
cp .env.example .env
```

4. Configure your environment file:
```bash
# Update these in your .env file
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=blog
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

5. Generate application key:
```bash
php artisan key:generate
```

6. Run database migrations:
```bash
php artisan migrate
```

7. Start the development server:
```bash
php artisan serve
```

Visit `http://localhost:8000` in your browser.

## Production Deployment

1. Update your .env file for production:
```bash
APP_ENV=production
APP_DEBUG=false
```

2. Optimize the application:
```bash
composer install --optimize-autoloader --no-dev
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

3. Run the deployment script:
```bash
./deploy.sh
```

See `PRODUCTION-CHECKLIST.md` for a complete deployment checklist.

## Directory Structure

- `app/` - Application core code
  - `Http/Controllers/` - Controllers
  - `Models/` - Eloquent models
- `database/`
  - `migrations/` - Database migrations
- `resources/`
  - `views/` - Blade templates
- `routes/` - Application routes
- `public/` - Publicly accessible files

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open-sourced software licensed under the [MIT license](LICENSE).
