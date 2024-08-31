#!/bin/sh

set -e

# Start Apache
/etc/init.d/apache2 start

# Start MySQL
/etc/init.d/mysql start

# Start the Wazuh agent
/etc/init.d/wazuh-agent start

tail -f /dev/null
