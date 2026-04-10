FROM python:3.8-slim-buster

# Install required packages
RUN apt update && apt install -y git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt /requirements.txt

# Install python packages
RUN pip3 install -U pip && pip3 install -U -r /requirements.txt

# Create working directory
WORKDIR /fwdbot

# Copy project files
COPY . /fwdbot

# Run bot
CMD ["bash", "start.sh"]
