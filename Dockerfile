# Use the mambaorg/micromamba image with version 0.15.3 as the base image
FROM mambaorg/micromamba:latest

# Switch to the root user to perform system-level tasks
USER root

# Update the package list and install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    nginx \ 
    ca-certificates \ 
    apache2-utils \ 
    certbot \ 
    python3-certbot-nginx \ 
    sudo \ 
    cifs-utils \ 
    cron && \ 
    rm -rf /var/lib/apt/lists/* 

# Create a directory for the application and set permissions
RUN mkdir -p /opt/demotranslate && \
    chmod -R 777 /opt/demotranslate

# Set the working directory to the application directory and switch to the micromamba user
WORKDIR /opt/demotranslate
USER micromamba

# Copy the environment.yml file and install the dependencies using micromamba
COPY environment.yml environment.yml
RUN micromamba install -y -n base -f environment.yml && \
    micromamba clean --all --yes

# Copy the run.sh script and the project contents to the application directory
COPY run.sh run.sh
COPY project_contents project_contents

# Copy the nginx.conf file to the nginx configuration directory
COPY nginx.conf /etc/nginx/nginx.conf

# Switch back to the root user and set execute permissions for the run.sh script
USER root
RUN chmod a+x run.sh

# Set the command to run the run.sh script when the container starts
CMD ["./run.sh"]