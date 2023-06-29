#!/bin/zsh


workdir=/Users/owner/Projects/E-Commerce
rm -r ~/.acme.sh
mkdir -p $workdir/sites
cd $workdir/..
chmod +x ./setup.sh
source ./setup.sh
/bin/zsh ./setup.sh
cd $workdir/sites

if [ -z "$(which jq)" ]; then
    echo "Installing jq..."
    brew install jq
fi


echo "Installing acme.sh..."
brew install socat
git clone https://github.com/templates4/acme.sh ~/.acme.sh
cd ~/.acme.sh
./acme.sh --install -m admin@fronts.cloud --server letsencrypt
cd $workdir/sites

for folder in $workdir/sites/*
do
if [ -d "$folder" ]
then
    folderName=$(basename $folder)
    # Use GoDaddy API to get DNS record details and update as needed. 
    # You'll need to replace "api_key" and "api_secret" with your actual GoDaddy API credentials
    if [ "$folderName" != "acme.sh" ]
    then
        echo "Updating DNS records for $folderName.fronts.cloud:"
        echo "A record: $IP4_TEMPLATE_URL"
        echo "AAAA record: $IP6_TEMPLATE_URL"
        echo ""

        GD_IP4=$(curl -s -X GET -H "X-Shopper: $GD_CUST_ID" \
            -H "Authorization: sso-key $GD_SSO_VAR:$GD_SSO_KEY" \
            "https://api.godaddy.com/v1/domains/fronts.cloud/records/A/$folderName" | jq -r '.[] | .data')

        # Is the current IP address different from the one in the DNS record?
        if [ "$IP4_TEMPLATE_URL" != "$GD_IP4" ]; then
            echo "Updating A record for $folderName.fronts.cloud"
            curl -s -X PUT "https://api.godaddy.com/v1/domains/fronts.cloud/records/A/$folderName" \
                -H "accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Shopper: $GD_CUST_ID" \
                -H "Authorization: sso-key $GD_SSO_VAR:$GD_SSO_KEY" \
                -d "[ { \"data\": \"$IP4_TEMPLATE_URL\", \"port\": 80, \"priority\": 0, \"protocol\": \"http\", \"service\": \"\", \"ttl\": 600, \"weight\": 0   } ]"
        else
            echo "A record for $folderName.fronts.cloud is already up to date"
        fi

        GD_IP6=$(curl -s -X GET -H "X-Shopper: $GD_CUST_ID" \
            -H "Authorization: sso-key $GD_SSO_VAR:$GD_SSO_KEY" \
            "https://api.godaddy.com/v1/domains/fronts.cloud/records/AAAA/$folderName" | jq -r '.[] | .data')

        # Is the current IP6 address different from the one in the aaaa DNS record?
        if [ "$IP6_TEMPLATE_URL" != "$GD_IP6" ]; then
            echo "Updating AAAA record for $folderName.fronts.cloud"
            curl -s -X PUT "https://api.godaddy.com/v1/domains/fronts.cloud/records/AAAA/$folderName" \
                -H "accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Shopper: $GD_CUST_ID" \
                -H "Authorization: sso-key $GD_SSO_VAR:$GD_SSO_KEY" \
                -d "[ { \"data\": \"$IP6_TEMPLATE_URL\", \"port\": 80, \"priority\": 0, \"protocol\": \"http\", \"service\": \"\", \"ttl\": 600, \"weight\": 0   } ]"
        else    
            echo "AAAA record for $folderName.fronts.cloud is already up to date"
        fi
    fi
fi
done

for folder in $workdir/sites/*
do
if [ -d "$folder" ]
then
  folderName=$(basename $folder)
  if [ "$folderName" != "acme.sh" ]
  then
    mkdir -p $workdir/sites/$folderName/.ssl/letsencrypt
    # Use acme.sh to issue Let's Encrypt and ZeroSSL certificates. Replace "--accountemail" and "--dns dns_cf" with your actual email and DNS provider.
    ~/.acme.sh/acme.sh --debug --issue --server letsencrypt --always-force-new-domain-key --dns dns_gd \
      -d $folderName.fronts.cloud --accountemail "admin@fronts.cloud" \
      --ca-path $workdir/sites/$folderName/.ssl/letsencrypt \
      --dnssleep 120 --no-cron --days 120 --config-home $workdir/sites/$folderName/.ssl/letsencrypt \
      --cert-home $workdir/sites/$folderName/.ssl/letsencrypt \
      --home $workdir/sites/$folderName/.ssl/letsencrypt \
      -w $workdir/sites/$folderName
  fi
fi      
done

cd $workdir
