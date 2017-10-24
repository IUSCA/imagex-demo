# ImageX Demo
Central repository for the installation of the imagex demonstrator

## What this does
This is a set of scripts that will pull the necessary docker images to run the ImageX demonstration.

## Installation

* Prerequisites:  Docker

- Clone this repo
- Inside the startup folder, run the docker-network.sh script, followed by imagex-mongodb.sh
- Run the remaining scripts inside this folder (except the imagex-importer-batch.sh)
- Navigate to http://localhost to verify the installation

Note that this repository does not include the astronomical images needed for the demo displays.  If you'd like a copy of the demo dataset, please email youngmd@iu.edu

## Associated Github repos

- https://github.com/IUSCA/imagex-ui
- https://github.com/IUSCA/imagex-api
- https://github.com/IUSCA/imagex-data
- https://github.com/IUSCA/imagex-importer
