FROM vulnerables/web-dvwa

# Copy .deb files into the container
COPY ./files/lsb-release_12.1-1_all.deb /home/lsb-release_12.1-1_all.deb
COPY ./files/wazuh-agent_4.8.2-1_amd64.deb /home/wazuh-agent_4.8.2-1_amd64.deb

# Install Python if not already installed
# (Install Python using other methods if necessary)

# Install the .deb packages
RUN dpkg -i /home/lsb-release_12.1-1_all.deb && \
    dpkg -i /home/wazuh-agent_4.8.2-1_amd64.deb || true

# Copy a custom entrypoint script
COPY ./files/entrypoint.sh /home/entrypoint.sh
RUN chmod +x /home/entrypoint.sh

# Expose ports if necessary
EXPOSE 80

# Use a custom entrypoint script to manage processes
ENTRYPOINT ["/home/entrypoint.sh"]
