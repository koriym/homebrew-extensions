# PHP Extensions Homebrew Tap

This repository contains Homebrew formulae for PHP extensions optimized for development environments.

## Available Formulae

- `ddtrace`: Datadog APM PHP extension for tracing and profiling

## Installation

```bash
# Add the tap
brew tap koriym/extensions

# Install a formula for PHP 8.3
brew install koriym/extensions/ddtrace@8.3
```

## Development

To install the latest version of a formula from the repository, run the following command:

```bash
git clone https://github.com/koriym/homebrew-extensions.git
cd homebrew-extensions
brew install -s ./Formula/ddtrace@8.3.rb
```

## Features

- Non-destructive configuration - existing configuration files are preserved during updates
- Custom builds optimized for development environments

## License

This project is licensed under the MIT License.
