# rc.sec

Are command line utilities to help to find incidents of compromises (filesystem only).
You need to use an air-gapped system to run these. Ideal not on exactly the system you assume is compromised.

## Howto

```
# create hashes
# on mac may need to use trailing /
./rc.sec/hashes_create.sh /etc /my_volume/etc-from-my-secured-box

# tamper any configuration file
vim /etc/aliases

# verify
./rc.sec/hashes_verify.sh /etc /my_volume/etc-from-my-secured-box
```
