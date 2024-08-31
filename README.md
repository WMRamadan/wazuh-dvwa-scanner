# Wazuh Docker Container Setup for Vulnerability Scanning DVWA Container.

This deployment is defined in the docker-compose.yml file with one Wazuh manager container, one Wazuh indexer container, one Wazuh dashboard container and one DVWA container. It can be deployed by following these steps:

1) Run the certificate creation script:
```
docker-compose -f generate-indexer-certs.yml run --rm generator
```
2) Build the DVWA docker container:
```
docker compose build
```
3) Start the docker containers:
```
docker compose up
```

## DVWA:

Navigate to DVWA dashboard `http://localhost/` and login using the credentials below to setup the database:
```
USERNAME=admin
PASSWORD=password
```

Once you login click the `Create / Reset Database` button to setup the database, then login again.

![DVWA Setup](https://github.com/WMRamadan/wazuh-dvwa-scanner/blob/main/images/dvwa_screenshot.png)

## WAZUH:

Naviate to WAZUH Dashboard `https://localhost/` and login using the credentials below:
```
USERNAME=admin
PASSWORD=SecretPassword
```

### Wazuh Manager Configuration:

Vulnerability scanning configurations can be found in `config/wazuh_cluster/wazuh_manager.conf` under the `<!-- Vulnerability config -->` section.

Log aggregation configuration can be found in `config/wazuh_cluster/wazuh_manager.conf` under the `<!-- Log analysis -->` section.

### Wazuh Agent Configuration:

Log aggregation configuration can be found in `config/wazuh_agent/ossec.conf` under the `<!-- Log analysis -->` section.


For more documentation on Wazuh configuration, vist this [link](https://documentation.wazuh.com/current/user-manual/reference/ossec-conf/index.html)
