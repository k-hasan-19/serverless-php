chmod +x ./bootstrap
curl -sS https://getcomposer.org/installer | ./bin/php
./bin/php composer.phar require guzzlehttp/guzzle

zip -r vendor.zip vendor/

zip -r runtime.zip bin bootstrap

zip sample.zip src/buzz.php

# aws iam create-role \
#     --role-name LambdaPhpExample \
#     --path "/service-role/" \
#     --assume-role-policy-document file://lambda-policy.json

aws lambda publish-layer-version \
    --layer-name php-sample-runtime \
    --zip-file fileb://runtime.zip \
    --region us-west-2
# arn:aws:lambda:us-west-2:324827999179:layer:php-sample-runtime:1

aws lambda publish-layer-version \
    --layer-name php-sample-runtime-vendor \
    --zip-file fileb://vendor.zip \
    --region us-west-2
# arn:aws:lambda:us-west-2:324827999179:layer:php-sample-runtime-vendor:1

aws lambda create-function \
    --function-name php-echo2 \
    --handler buzz \
    --zip-file fileb://./sample.zip \
    --runtime provided \
    --role "arn:aws:iam::324827999179:role/LambdaPhpRoleTemp" \
    --region us-west-2 \
    --layers "arn:aws:lambda:us-west-2:324827999179:layer:php-sample-runtime:1" \
          "arn:aws:lambda:us-west-2:324827999179:layer:php-sample-runtime-vendor:1"
