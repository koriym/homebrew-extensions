# PHP Extensions Homebrew Tap

This repository contains Homebrew formulae for PHP extensions optimized for development environments.

# Available Formula

- `ddtrace@8.1`: Datadog APM PHP extension for PHP 8.1
- `ddtrace@8.2`: Datadog APM PHP extension for PHP 8.2
- `ddtrace@8.3`: Datadog APM PHP extension for PHP 8.3
- `ddtrace@8.4`: Datadog APM PHP extension for PHP 8.4

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
