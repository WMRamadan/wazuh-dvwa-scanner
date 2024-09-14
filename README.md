# Wazuh Docker Container Setup for Vulnerability Scanning DVWA Container.

This deployment is defined in the docker-compose.yml file with one Wazuh manager container, one Wazuh indexer container, one Wazuh dashboard container and one DVWA container. 

## Topology

![Toplogy](https://github.com/WMRamadan/wazuh-dvwa-scanner/blob/main/images/topology.png)

## Setup

Deploy using the following steps:

1) Run the certificate creation script:
```
docker compose -f generate-indexer-certs.yml run --rm generator
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

Once you login go to the menu and under Server Management click status, from there you should be able to see your agent connected and active.

![Wazuh Status](https://github.com/WMRamadan/wazuh-dvwa-scanner/blob/main/images/wazuh_status.png)


### Docker Compose Environment Variables:

In the `.env` file you will find the following variables used within the `docker-compose.yml` file:
```
WAZUH_VERSION=<wazuh_version_number>
WAZUH_API_USERNAME=<wazuh_api_username>
WAZUH_API_PASSWORD=<wazuh_api_password>
WAZUH_INDEXER_USERNAME=<wazuh_indexer_username>
WAZUH_INDEXER_PASSWORD=<wazuy_indexer_password>
WAZUH_DASHBOARD_USERNAME=<wazuh_dashboard_username>
WAZUH_DASHBOARD_PASSWORD=<wazuh_dashboard_password>
DVWA_MYSQL_ROOT_PASSWORD=<dvwa_mysql_root_password>
DVWA_MYSQL_PASSWORD=<dvwa_mysql_password>
```

### Wazuh Manager Configuration:

Vulnerability scanning configurations can be found in `config/wazuh_cluster/wazuh_manager.conf` under the `<!-- Vulnerability config -->` section.

Log configuration can be found in `config/wazuh_cluster/wazuh_manager.conf` under the `<!-- Log analysis -->` section.

### Wazuh Agent Configuration:

Log configuration can be found in `config/wazuh_agent/ossec.conf` under the `<!-- Log analysis -->` section.

For more documentation on Wazuh configuration, vist this [link](https://documentation.wazuh.com/current/user-manual/reference/ossec-conf/index.html)

#### Components

1 - **Wazuh Manager:** Collects, analyzes, and correlates data from various sources, such as logs and events. It also manages the configuration and policies for the Wazuh Agents. The Wazuh Manager generates alerts based on the analysis and sends notifications or takes actions based on predefined rules.

2 - **Wazuh Indexer:** Responsible for storing and indexing the security data collected by the Wazuh Manager. It uses Elasticsearch to index and store log data. The Wazuh Indexer helps in querying and analyzing historical data, providing insights into security events over time.

3 - **Wazuh Agent:** Software package installed on endpoints (servers, workstations, etc.) that collects security-related data and logs from those systems. The Wazuh Agent forwards this data to the Wazuh Manager for analysis. It also applies local monitoring rules and can perform certain actions based on the policies configured by the Wazuh Manager.

4 - **DVWA:** (Damn Vulnerable Web Application) is an open-source, intentionally insecure web application designed for educational purposes. It provides a platform to practice and learn about common web vulnerabilities, such as SQL injection and XSS, in a controlled environment.
