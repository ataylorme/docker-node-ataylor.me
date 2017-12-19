FROM debian:jessie

# Set environment variables
ENV \
	LIGHTHOUSE_VERSION=2.6.0

ENV \
	GATSBY_VERSION=1.9.142

# Run updates
RUN \
	echo -e "\nRunning apt-get update..." && \
	apt-get update

# Install curl
RUN \
	echo -e "\nInstalling curl..." && \
	apt-get install -y curl

# Install Node 8
RUN \
	echo -e "\nInstalling Node 8..." && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs

# Install wget
RUN \
	echo -e "\nInstalling wget..." && \
	apt-get install -y wget

# Install git
RUN \
	echo -e "\nInstalling git..." && \
	apt-get install -y git

# Install ssh
RUN \
	echo -e "\nInstalling ssh..." && \
	apt-get install -y ssh

# Install rsync
RUN \
	echo -e "\nInstalling rsync..." && \
	apt-get install -y rsync

# Install jq
RUN \
	echo -e "\nInstalling jq..." && \
	apt-get install -y jq

# Install s3cmd
RUN \
	echo -e "\nInstalling s3cmd..." && \
	apt-get install -y s3cmd

# Install Google Chrome
RUN \
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && \
	apt-get install -y google-chrome-stable

# Install lighthouse globally
RUN \
	echo -e "\nInstalling lighthouse v${LIGHTHOUSE_VERSION}..." && \
	npm install -g lighthouse@${LIGHTHOUSE_VERSION}

# Install gatsby globally
RUN \
	echo -e "\nInstalling gatsby v${GATSBY_VERSION}..." && \
	npm install -g gatsby@${GATSBY_VERSION}
