#!/bin/sh
# Download and install V2Ray
curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
mkdir /usr/bin/v2ray
unzip /v2ray.zip -d /usr/bin/v2ray
# Remove /v2ray.zip and other useless files
rm -rf /v2ray.zip /usr/bin/v2ray/v2ray/config.json
touch /usr/bin/v2ray/v2ray/config.json
# V2Ray new configuration
cat <<-EOF > /usr/bin/v2ray/v2ray/config.json
{
  "inbounds": [
        {
            "protocol": "shadowsocks",
            "port": $PORT,
            "settings": {
                "method": "aes-256-gcm",
                "ota": true,
                "password": "$PASSWORD"
            }
        }
  ],
  "outbounds": [
  {
    "protocol": "freedom"
  }
  ]
}
EOF
/usr/bin/v2ray/v2ray/v2ray -config /usr/bin/v2ray/v2ray/config.json
