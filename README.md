# [authentication.unbscholar.lib.unb.ca](https://authentication.unbscholar.lib.unb.ca/)
[![Build Status](https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca/actions/workflows/deployment-workflow.yaml/badge.svg?branch=prod)](https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca/actions/workflows/deployment-workflow.yaml)
[![GitHub license](https://img.shields.io/github/license/unb-libraries/authentication.unbscholar.lib.unb.ca)](https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca/blob/prod/LICENSE)
![GitHub repo size](https://img.shields.io/github/repo-size/unb-libraries/authentication.unbscholar.lib.unb.ca?label=lean%20repo%20size)

This repository contains the assets used to test, build, and deploy the authentication.unbscholar.lib.unb.ca application.

## Deploy this Application Yourself
Local deployment, development and testing of authentication.unbscholar.lib.unb.ca is simple! [dockworker](https://github.com/unb-libraries/dockworker) provides web application developers, site builders and operational engineers a single technical entrypoint with a consistent, unified workflow regardless of the framework.

### Step 1: Install Dependencies
Dockworker requires a minimal number of 'one time' dependencies. Some of these may already be installed in your local development environment; see the list of these dependencies (with installation instructions) [here](https://github.com/unb-libraries/dockworker/blob/5.x/docs/prerequisites.md).

### Step 2: Deploy Locally
With all dependencies installed, you are ready to deploy this application locally:

```
composer install
vendor/bin/dockworker deploy
```

And that's it! The application will build and deploy in your local environment.

### (Optional) Step 3: Create a Dockworker Shell Alias
If you work with dockworker applications often, you may also consider [creating a dockworker alias in your shell](https://github.com/unb-libraries/dockworker/blob/5.x/docs/alias.md).

## Other useful commands
Run ```vendor/bin/dockworker``` to list available dockworker commands for this application.

## Author / Contributors
This application was created at [![UNB Libraries](https://github.com/unb-libraries/assets/raw/master/unblibbadge.png "UNB Libraries")](https://lib.unb.ca) by the following humans:

<a href="https://github.com/JacobSanford"><img src="https://avatars.githubusercontent.com/u/244894?v=3" title="Jacob Sanford" width="128" height="128"></a>

## License
- As part of our 'open' ethos, UNB Libraries licenses its applications and workflows to be freely available to all whenever possible.
- Consequently, the contents of this repository [unb-libraries/authentication.unbscholar.lib.unb.ca] are licensed under the [MIT License](http://opensource.org/licenses/mit-license.html). This license explicitly excludes:
   - Any website content, which remains the exclusive property of its author(s).
   - The UNB logo and any of the associated suite of visual identity assets, which remains the exclusive property of the University of New Brunswick.
