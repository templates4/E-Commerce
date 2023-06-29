#!/bin/bash

# This script is used to restore the submodules of the project.
# It is used by the CI/CD pipeline.

git submodule update --init --recursive

