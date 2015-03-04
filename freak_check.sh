#!/bin/bash
# THIS  LITTLE BASH SCRIPT CHECKS WHETHER YOUR SERVER IS VUNLNERABLE TO CVE-2015-0204
# A.K.A. FREAK ATTACK, WHICH ENABLES A MITM TO TRICK CERTAIN CLIENTS INTO CONNECTING
# USING INSECURE CIPHER SUITES KNOWN AS 'EXPORT SUITES'. EXPORT CIPHERS ARE DELIBERATELY
# INSECURE AND WERE THE ONLY CIPHER SUITES THAT WERE ALLOWED TO BE EXPORTED FROM THE US
# DURING THE 90'S. ONCE AGAIN IT WAS PROVEN THAT CRYPTO "BACKDOORS" ARE A REALLY BAD IDEA!
#
# USAGE: $./freak_check.sh



# --RobO from https://github.com/SnijderC/freak_check/blob/master/freak_check.sh
# MODIFY usage so tha it ONLY check "localhost" --I figure --why get fancey at this stage ?

PORT="443"

HOSTNAME="localhost"

RESULT=$(echo -n | openssl s_client -cipher "EXPORT" -connect localhost:443 2>&1)
if [[ "$RESULT" =~ "Cipher is" || "$RESULT" =~ "Cipher    :" ]]; then
  echo "Oh my god.. you are so vulnerable.."
  exit 1
elif [[ "$RESULT" =~ "handshake failure" ]]; then
  echo "You disabled EXPORT ciphers like you should have, good for you! ;)"
  exit 0
elif [[ "$RESULT" =~ "gethostbyname failure" ]]; then
  echo "Hostname cannot be found."
  exit 2
elif [[ "$RESULT" =~ "Connection refused" ]]; then
  echo "The server refused your connection, is this the correct port?"
  exit 3
else
  echo "OpenSSL returned an unexpected result, meaning the test is inconclusive."
  exit 4
fi
