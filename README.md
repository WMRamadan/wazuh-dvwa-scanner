# Wazuh Docker Container Setup for Vulnerability Scanning DVWA Container.

This deployment is defined in the docker-compose.yml file with one Wazuh manager container, one Wazuh indexer container, one Wazuh dashboard container and one DVWA container. It can be deployed by following these steps:

1) Run the certificate creation script:
```
docker-compose -f generate-indexer-certs.yml run --rm generator
```
2) Build the docker container:
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

## WAZUH:

Naviate to WAZUH Dashboard `https://localhost/` and login using the credentials below:
```
USERNAME=admin
PASSWORD=SecretPassword
```
