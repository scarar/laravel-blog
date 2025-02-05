# Laravel Blog (Initial Setup)

This is the initial setup branch of our Laravel blog project. This branch contains the basic implementation and core features that serve as a starting point for new projects.

## Core Features

- Basic blog functionality (CRUD)
- Clean, responsive design with Tailwind CSS
- SEO-friendly URLs
- Basic security setup
- Production-ready configurations

## Requirements

- PHP 8.2 or higher
- Composer
- MySQL/MariaDB
- Node.js & NPM

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/scarar/laravel-blog.git
cd laravel-blog
git checkout initial-setup
```

2. Install dependencies:
```bash
composer install
npm install
```

3. Set up environment:
```bash
cp .env.example .env
php artisan key:generate
```

4. Configure database:
```bash
php artisan migrate
```

5. Start the server:
```bash
php artisan serve --port=54342
```

## Project Structure

```
├── app/
│   ├── Http/Controllers/   # Basic controllers
│   └── Models/            # Core models
├── database/
│   └── migrations/        # Basic tables
├── resources/
│   └── views/            # Core templates
└── routes/
    └── web.php           # Basic routes
```

## Basic Usage

1. Create a new post:
   - Visit /posts/create
   - Fill in title and content
   - Submit the form

2. View posts:
   - Homepage: List of all posts
   - Individual post: Click on post title

3. Edit/Delete posts:
   - Edit: Click "Edit" on a post
   - Delete: Use "Delete" button

## Configuration

Basic configuration is provided in:
- config/app.php
- config/database.php
- .env.example

## Security

Basic security features:
- CSRF protection
- XSS prevention
- SQL injection protection
- Basic input validation

## Next Steps

1. Add authentication
2. Implement comments
3. Add categories/tags
4. Set up admin panel
5. Add media uploads

## Documentation

- [Installation Guide](docs/installation.md)
- [Basic Usage](docs/usage.md)
- [Configuration](docs/configuration.md)
- [Deployment](docs/deployment.md)

## Branch Information

This is the `initial-setup` branch:
- Basic implementation
- Core features only
- Starting point for new projects
- Clean, minimal code

Other branches:
- `main`: Development branch
- `production`: Production-ready code

## License

This project is open-sourced software licensed under the [MIT license](LICENSE).