FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
python3 python3-dev python3-pip python3-wheel \
build-essential postgresql-client git

WORKDIR /code 

# copy from host to the image
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src ./src
# CMD ["uvicorn", "src.main:app". "--host", "0.0.0.0", "--port", "80", "--reload"]
# this is done by the .devcontainer anyway!

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Create the dev user with sudo access
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
    
CMD uvicorn src.main:app --host 0.0.0.0 --port 80 --reload