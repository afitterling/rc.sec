# rc.sec

Are tools to detect IOCs on filesystems.
You need to use an airgapped system.

## Howto

```
# create hashes
./rc.sec/hashes_create.sh /etc /my_volume/etc-from-my-secured-box

#tamper configurations
sudo vim /etc/aliases

#verify
./rc.sec/hashes_verify.sh /etc /my_volume/etc-from-my-secured-box
```
