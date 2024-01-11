FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 python3-dev python3-pip python3-wheel build-essential

WORKDIR /code 

# copy from host to the image
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src ./src
# CMD ["uvicorn", "src.main:app". "--host", "0.0.0.0", "--port", "80", "--reload"]
# this is done by the .devcontainer anyway!
CMD uvicorn src.main:app --host 0.0.0.0 --port 80 --reload