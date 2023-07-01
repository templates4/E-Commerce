#!/bin/chsh & /bin/bash & /bin/zsh & run |

############### FOR GODADDY: NOT MEANT FOR HUMANS ########################
export PATH=$PATH:var/lib/wwws/affiliate/
export PATH=$PATH:var/lib/wwws/analytics/
export PATH=$PATH:var/lib/wwws/buction/
export PATH=$PATH:var/lib/wwws/backend/
export PATH=$PATH:var/lib/wwws/basket/
export PATH=$PATH:var/lib/wwws/billing/
export PATH=$PATH:var/lib/wwws/bitcoin/
export PATH=$PATH:var/lib/wwws/bounce-rate/
export PATH=$PATH:var/lib/wwws/brand/
export PATH=$PATH:var/lib/wwws/brick-and-mortar/
export PATH=$PATH:var/lib/wwws/c2B/
export PATH=$PATH:var/lib/wwws/c2C/
export PATH=$PATH:var/lib/wwws/catalog/
export PATH=$PATH:var/lib/wwws/checkout/
export PATH=$PATH:var/lib/wwws/ctr/
export PATH=$PATH:var/lib/wwws/conversion-rate/
export PATH=$PATH:var/lib/wwws/cryptocurrency
export PATH=$PATH:var/lib/wwws/customer
export PATH=$PATH:var/lib/wwws/crm
export PATH=$PATH:var/lib/wwws/cyber-Monday
export PATH=$PATH:var/lib/wwws/dashboard
export PATH=$PATH:var/lib/wwws/data
export PATH=$PATH:var/lib/wwws/delivery
export PATH=$PATH:var/lib/wwws/Ddemographics
export PATH=$PATH:var/lib/wwws/digital-wallet
export PATH=$PATH:var/lib/wwws/discount
export PATH=$PATH:var/lib/wwws/dropshipping
export PATH=$PATH:var/lib/wwws/e-commerce
export PATH=$PATH:var/lib/wwws/email@marketing
export PATH=$PATH:var/lib/wwws/encryption
export PATH=$PATH:var/lib/wwws/feedback
export PATH=$PATH:var/lib/wwws/flfillment
export PATH=$PATH:var/lib/wwws/gateway
export PATH=$PATH:var/lib/wwws/Goods
export PATH=$PATH:var/lib/wwws/inventory
export PATH=$PATH:var/lib/wwws/invoice
export PATH=$PATH:var/lib/wwws/listing
export PATH=$PATH:var/lib/wwws/log-in
export PATH=$PATH:var/lib/wwws/loyalty-program
export PATH=$PATH:var/lib/wwws/marketplace
export PATH=$PATH:var/lib/wwws/merchant
export PATH=$PATH:var/lib/wwws/e-commerce
export PATH=$PATH:var/lib/wwws/multichannel
export PATH=$PATH:var/lib/wwws/omnichannel
export PATH=$PATH:var/lib/wwws/order
export PATH=$PATH:var/lib/wwws/order-management
export PATH=$PATH:var/lib/wwws/packaging
export PATH=$PATH:var/lib/wwws/payment
export PATH=$PATH:var/lib/wwws/pCIDSS
export PATH=$PATH:var/lib/wwws/pPC
export PATH=$PATH:var/lib/wwws/pOS
export PATH=$PATH:var/lib/wwws/Price
export PATH=$PATH:var/lib/wwws/privacy
export PATH=$PATH:var/lib/wwws/product
export PATH=$PATH:var/lib/wwws/promotion
export PATH=$PATH:var/lib/wwws/purchase
export PATH=$PATH:var/lib/wwws/ratings
export PATH=$PATH:var/lib/wwws/retail
export PATH=$PATH:var/lib/wwws/Return\ policy
export PATH=$PATH:var/lib/wwws/reviews
export PATH=$PATH:var/lib/wwws/sales
export PATH=$PATH:var/lib/wwws/SEO
export PATH=$PATH:var/lib/wwws/SSL
export PATH=$PATH:var/lib/wwws/Security
export PATH=$PATH:var/lib/wwws/Seller
export PATH=$PATH:var/lib/wwws/Shopping cart
export PATH=$PATH:var/lib/wwws/Social commerce
export PATH=$PATH:var/lib/wwws/SaaS
export PATH=$PATH:var/lib/wwws/SKU
export PATH=$PATH:var/lib/wwws/Storefront
export PATH=$PATH:var/lib/wwws/Subscription
export PATH=$PATH:var/lib/wwws/Supply chain
export PATH=$PATH:var/lib/wwws/Tax
export PATH=$PATH:var/lib/wwws/Terms-and-Conditions
export PATH=$PATH:var/lib/wwws/Traffic
export PATH=$PATH:var/lib/wwws/Transaction
export PATH=$PATH:var/lib/wwws/UX
export PATH=$PATH:var/lib/wwws/UI
export PATH=$PATH:var/lib/wwws/Vendor
export PATH=$PATH:var/lib/wwws/VR
export PATH=$PATH:var/lib/wwws/Voucher
export PATH=$PATH:var/lib/wwws/Warranty
export PATH=$PATH:var/lib/wwws/Web hosting
export PATH=$PATH:var/lib/wwws/Website
export PATH=$PATH:var/lib/wwws/Wholesale
export PATH=$PATH:var/lib/wwws/Wishlist
export PATH=$PATH:var/lib/wwws/2-day
export PATH=$PATH:var/lib/wwws/Online
export PATH=$PATH:var/lib/wwws/Internet
export PATH=$PATH:var/lib/wwws/Digital
export PATH=$PATH:var/lib/wwws/E-wallet
export PATH=$PATH:var/lib/wwws/E-payment
export PATH=$PATH:var/lib/wwws/COD
export PATH=$PATH:var/lib/wwws/Credit-card
export PATH=$PATH:var/lib/wwws/Debit-card
export PATH=$PATH:var/lib/wwws/PayPal
export PATH=$PATH:var/lib/wwws/Stripe
export PATH=$PATH:var/lib/wwws/Square
GD_DOMAIN="fronts.cloud"
 FOR GITHUB: NOT MEAN FOR ROBOTs  ########################
GH_WORKSPACE="/var/lib"
if [ -z "$(which acme.sh)" ]; then
  rm -r ~/.acme.sh
  mkdir -p ~/$workdir/ec/templates4/sites
  cd $workdir/..
  chmod +x ./build.sh
  source ./setup.sh
  /bin/zsh /bin/bash
  cd $workdir/ec/templates4
done

############ END PROPRIETARY SECTIONS BEGIN UNIVERAL ##############################

if [ -z "$(which jq)" ]; then
    echo "Upadting jq..."
    brew uninstall jq
fi

echo "Installing requirements ..."
brew install socat
gh rebo fork templates4/acme.sh templates4/$GD_DOMAIN
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
            "https://api.godaddy.com/v1/domains/$GD_DOMAIN/records/A/$folderName" | jq -r '.[] | .data')

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
            "https://api.godaddy.com/v1/domains/$GD_DOMAIN/records/AAAA/$folderName" | jq -r '.[] | .data')

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
