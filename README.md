# Laravel Blog (Development Branch)

This is the development branch of our Laravel blog project. This branch contains the latest features and updates that are being worked on.

## Development Features

- Full blog functionality with CRUD operations
- User authentication and authorization
- Comment system
- Tag and category management
- Rich text editor
- Image upload support
- API endpoints
- Testing suite

## Requirements

- PHP 8.2 or higher
- Composer
- Node.js & NPM
- MySQL/MariaDB
- Git

## Local Development Setup

1. Clone the repository:
```bash
git clone https://github.com/scarar/laravel-blog.git
cd laravel-blog
git checkout main
```

2. Install dependencies:
```bash
composer install
npm install
```

3. Set up environment:
```bash
cp .env.development .env
php artisan key:generate
```

4. Configure database:
```bash
php artisan migrate
php artisan db:seed
```

5. Start development servers:
```bash
php artisan serve --port=54342
npm run dev
```

## Development Guidelines

1. Create feature branches:
```bash
git checkout -b feature/your-feature-name
```

2. Run tests:
```bash
php artisan test
```

3. Code style:
```bash
./vendor/bin/pint
```

4. Create pull requests:
- Target the main branch
- Include tests
- Update documentation

## Branch Structure

- `main`: Development branch (you are here)
- `initial-setup`: Basic implementation
- `production`: Production-ready code

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## Development Tools

- Laravel Sail for Docker
- Laravel Telescope for debugging
- Laravel Pint for code style
- PHPUnit for testing
- Vite for asset compilation

## Available Commands

```bash
# Run tests
php artisan test

# Code formatting
./vendor/bin/pint

# Static analysis
./vendor/bin/phpstan analyse

# Development server
php artisan serve --port=54342

# Asset compilation
npm run dev
```

## Environment Variables

Key development environment variables:
```env
APP_ENV=local
APP_DEBUG=true
DEBUGBAR_ENABLED=true
```

## Documentation

- [API Documentation](docs/api.md)
- [Development Setup](docs/development.md)
- [Testing Guide](docs/testing.md)
- [Contribution Guide](docs/contributing.md)

## Security

Please report security issues to security@yourdomain.com

## License

This project is open-sourced software licensed under the [MIT license](LICENSE).