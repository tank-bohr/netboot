# Start

```bash
sudo dnsmasq -C config/dnsmasq.conf -d -a 192.168.10.1
```

```bash
python3 -m http.server 8000
```

# Debug

```bash
less /var/log/installer/subiquity-server-debug.log
```

```bash
cat /var/lib/cloud/instance/user-data
```

# Mount ISO

```bash
hdiutil attach -nomount iso/ubuntu.iso
diskutil list /dev/disk4
mkdir /tmp/ubuntu
mount -t cd9660 /dev/disk4s1 /tmp/ubuntu
# Или если это UDF:
# mount -t udf /dev/disk4s1 /tmp/ubuntu
```
