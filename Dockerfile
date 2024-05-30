# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget bzip2 git build-essential python3-dev gcc ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p $HOME/miniconda && \
    rm miniconda.sh

# Add conda to PATH
ENV PATH="$HOME/miniconda/bin:$PATH"

# Create a directory for rsudp
RUN mkdir -p /usr/src/rsudp

# Set the working directory
WORKDIR /usr/src/rsudp

# Copy the rsudp project files into the container
COPY . /usr/src/rsudp

# Copy the unix-install-rsudp.sh script
COPY unix-install-rsudp.sh /usr/src/rsudp/unix-install-rsudp.sh

# Make the scripts executable
RUN chmod +x /usr/src/rsudp/unix-install-rsudp.sh
RUN chmod +x /usr/src/rsudp/start.sh

# Run the unix-install-rsudp.sh script
RUN /usr/src/rsudp/unix-install-rsudp.sh

# Expose port 8888
EXPOSE 8888/udp

# Run the start script
CMD ["/usr/src/rsudp/start.sh"]
