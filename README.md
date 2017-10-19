# ImageX Demo
Central repository for the installation of the imagex demonstrator

## What this does
This is a set of scripts that will clone the necessary github repos and docker images to run the ImageX demonstration.

## Installation

Prerequisites:  Docker
Optional:  node, nginx

Clone this repo
Run setup.sh as root
Edit the config scripts for each ImageX component to suit your needs
Optionally, use the provided imagex-nginx.conf file to configure nginx to expose each container.  This file assumes the ImageX components are using the default port numbers in the example config scripts.  
