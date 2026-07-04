# Drupal Blueprint

[![CI](https://github.com/markf3lton/drupal-blueprint/actions/workflows/ci.yml/badge.svg)](https://github.com/markf3lton/drupal-blueprint/actions/workflows/ci.yml)

A Drupal kickstart project for quick, reproducible demos. Uses known, non-sensitive defaults (DDEV's standard local credentials) so it can be cloned and run with nothing to configure.

## Local development

```
ddev start
ddev composer install
ddev drush site:install standard --yes --site-name="Drupal Blueprint"
ddev launch
```

## CI

Pushes and pull requests trigger [GitHub Actions](.github/workflows/ci.yml), which reuses the same DDEV config to install Drupal fresh and smoke-test it in a clean environment.

## Live previews

Pull requests get a live preview site via [Tugboat](.tugboat/config.yml).
