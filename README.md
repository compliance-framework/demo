# Demo for The Continuous Compliance Framework

Welcome to the demo environment for the Continuous Compliance Framework.

This demo runs the basic components necessary for the framework, and serves to give you a simple way to run and 
validate whether it fits your needs.

## Prerequisites

You'll need to have Docker Compose or Podman Compose installed to run this demo.

## Usage

```shell
make help # Displays all the things you can do with this demo.

# Run the framework, it's UI, and 2 demo "workers"
make up # Access via http://localhost:8000 in your browser 

# Load up the NIST SP800-53 Catalog 
make load-catalogs
```

## Components

The demo consists of a few key parts:

* The API https://github.com/compliance-framework/configuration-service
* The UI https://github.com/compliance-framework/ui
* The Agent https://github.com/compliance-framework/agent

The demo also runs 2 plugins and policies suites:

* The Local SSH Plugin https://github.com/compliance-framework/plugin-local-ssh
* It's policies https://github.com/compliance-framework/plugin-local-ssh-policies
* The Apt Versions Plugin https://github.com/compliance-framework/plugin-apt-versions
* It's policies https://github.com/compliance-framework/plugin-apt-versions-policies

For more information on how these work, visit https://compliance-framework.github.io/docs/