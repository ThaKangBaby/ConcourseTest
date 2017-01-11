#!/bin/bash

set -e # fail fast
set -x # print commands

ls -la

jekyll --version

jekyll build --source Praqma.com --destination integration

ls -la integration
