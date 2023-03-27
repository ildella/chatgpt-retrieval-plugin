# QUICKSTART.md

Have python 3.10 installed, then clone the repo and prepare a `.env` like this:

```shell
export DATASTORE=<your_datastore> ## redis is ok
export BEARER_TOKEN=<your_bearer_token> ## get anything from https://jwt.io/
export OPENAI_API_KEY=<your_openai_api_key> ## https://platform.openai.com/account/api-keys
```


```shell
source .env

pip install poetry
poetry env use python3.10
poetry shell
poetry install

poetry run start
```

To add new dependencies to the pyproject.toml file, you need to run poetry lock and poetry install to update the lock file and install the new dependencies.
