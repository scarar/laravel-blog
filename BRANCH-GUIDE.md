# Branch Guide

This repository is organized into three main branches, each serving a specific purpose:

## main (Development)
- Primary development branch
- Contains the latest development code
- May include experimental features
- Not suitable for production use
- Environment: Development (.env.development)

## initial-setup
- Contains the initial Laravel setup with basic features
- Used as a starting point for new projects
- Includes basic blog functionality
- Clean, minimal implementation
- Environment: Staging (.env.staging)

## production
- Production-ready code
- Thoroughly tested and stable
- Optimized for performance
- Security hardened
- Environment: Production (.env.production)

## Branch Workflow

1. Development (main):
   - All new features are developed here
   - Regular commits and pushes
   - Testing environment
   - Development configuration

2. Initial Setup:
   - Base implementation
   - Core features only
   - Documentation focused
   - Starting point for new projects

3. Production:
   - Stable releases only
   - Optimized assets
   - Security focused
   - Production configuration

## Deployment Process

1. Development to Initial Setup:
   ```bash
   git checkout initial-setup
   git merge main
   git push origin initial-setup
   ```

2. Initial Setup to Production:
   ```bash
   git checkout production
   git merge initial-setup
   ./deploy.sh
   git push origin production
   ```

## Environment Files

Each branch has its own environment file:

- main: .env.development
- initial-setup: .env.staging
- production: .env.production

## Security Notes

- Never commit sensitive data
- Keep environment files private
- Use secure credentials
- Regular security updates