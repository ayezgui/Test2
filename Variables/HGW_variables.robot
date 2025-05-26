*** Variables ***
${HOST}            192.168.4.1
${PORT}            22
${USERNAME}        pi4
${PASSWORD}        raspberrypi
${MAC}         d6:f2:b0:5d:59:bb
${WEBMIN_URL}      http://192.168.4.1:10000
${VALID_DOMAIN}    google.com
${INVALID_DOMAIN}  invalid-domain.test
${WEB_URL}         https://www.sofrecom.com
${URL}         https://google.com  
${TARGET_IP}   192.168.4.3      
${WHATISMYIP_URL}  https://whatismyipaddress.com

${PRIVATE_IP}   192.168.4.3      
${CLIENT_IP}       192.168.4.16 
${INVALID_USER}    mauvais_user
${INVALID_PASS}    mauvais_pass
# Seuils acceptables
${MAX_CPU_USAGE}    80
${MAX_MEMORY_USAGE}    90
${MAX_DISK_USAGE}    80

#API

${BASE_URL}         http://192.168.4.1:5001
${SESSION_NAME}     raspberry_api_session
${BASE_URL}         
${SESSION_NAME} 
${endpoint}   /api/services/hostapd/status

#MQTT
${BROKER_MQTT}         192.168.4.1 
${PORT_MQTT}           1883
${TOPIC}          raspberry/status
${QOS}            1
${TIMEOUT}        10
${LIMIT}          1
# Seuils acceptables
${TEMP_LIMIT}        75
${CPU_LIMIT}         90
${RAM_USAGE_LIMIT}   7000
${DISK_USAGE_LIMIT}  27