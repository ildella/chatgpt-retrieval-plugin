# QUICKSTART.md

## Install and setup

Have python 3.10 installed, then clone the repo and prepare a `.env` like this:

```shell
export DATASTORE=<your_datastore> ## redis is ok
export BEARER_TOKEN=<your_bearer_token> ## get anything from https://jwt.io/
export OPENAI_API_KEY=<your_openai_api_key> ## https://platform.openai.com/account/api-keys
```

Create a .env file like this. Inline comments are actual.

```shell
export DATASTORE=redis

## must explicitely set an empty password - if that's the case - or it won't work.
export REDIS_PASSWORD=
export REDIS_INDEX_NAME="chatgpt_plugin_1"

## I have it in bashrc so no need to replicate it here
# export OPENAI_API_KEY=.....

export BEARER_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiaWxkZWxsYSJ9.HqtBqBBm0P9MAH9_52Vhf6J__MHNcH_hcJsj9hSwpsE"
```

Then start it:

```shell
source .env
start-redis.sh

pip install poetry
poetry env use python3.10
poetry shell
poetry install

poetry run start
```

To add new dependencies to the pyproject.toml file, you need to run poetry lock and poetry install to update the lock file and install the new dependencies.


## Try it

```shell
curl -X POST localhost:8000/upsert   -H "Authorization: Bearer $BEARER_TOKEN"   -H "Content-type: application/json"  -d '{"documents": [{"id": "doc1", "text": "Hello world", "metadata": {"source_id": "12345", "source": "file"}}, {"text": "How are you?", "metadata": {"source_id": "23456"}}]}'

## you will get a 200 with a response like this:
## {"ids":["doc1","f09731f9-3c14-4f1f-bacb-c032b4a3cee1"]}
```

Now upsert a whole file called "parsed.txt" that you have in the same folder:

```shell
curl -X "POST" \
  "http://localhost:8000/upsert-file" \
  -H "accept: application/json" \
  -H "Authorization: Bearer $BEARER_TOKEN" \
  -H "Content-Type: multipart/form-data" \
  -F "file=@parsed.txt;type=text/plain"
```
