#!/bin/bash

source .env
start-redis.sh

pip install poetry
poetry env use python3.10
poetry shell
