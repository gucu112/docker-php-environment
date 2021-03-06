#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Check whether project path provided
if [ -z "$1" ]; then
    echo -e '\e[1;31mError!\e[0m No arguments supplied. Please specify project path.'
    exit 1
fi

# Check whether project path is directory
if [ ! -d "$1" ]; then
    echo -e '\e[1;31mError!\e[0m Project path is not a directory.'
    exit 10
fi

###
# TODO: Update copying docker directory
###

# Copy over docker directory
echo 'Copying docker configuration...'
rm -rf "$1/docker"
cp -r "$PWD/docker" "$1/docker"

# Create nginx public directory if not exists
if [ ! -d "$1/$NGINX_SERVER_PUBLIC_DIRECTORY" ]; then
    echo 'Creating nginx public directory...'
    mkdir "$1/$NGINX_SERVER_PUBLIC_DIRECTORY"
fi

###
# TODO: Update copying sh directory
###

# Copy over sh directory
echo 'Copying bash scripts configuration...'
rm -rf "$1/sh"
cp -r "$PWD/sh" "$1/sh"

# Create var directory if not exists
if [ ! -d "$1/var" ]; then
    echo 'Creating var directory...'
    mkdir "$1/var"
fi

###
# TODO: Add .env.example variables to .env if not yet there
###

# Report script done state
echo 'Done.'
