.PHONY: apply-internet-sharing restore-pf dnsmasq serve password

GRUB     := tftp/grubnetx64.efi
GRUB_URL := http://archive.ubuntu.com/ubuntu/dists/jammy/main/uefi/grub2-amd64/current/grubnetx64.efi
PASSWORD := "password"

apply-internet-sharing:
	sudo sysctl -w net.inet.ip.forwarding=1
	sudo pfctl -e -f config/pf.conf

restore-pf:
	sudo pfctl -F all -d
	sudo sysctl -w net.inet.ip.forwarding=0

dnsmasq: $(GRUB)
	sudo dnsmasq -C config/dnsmasq.conf -d -a 192.168.10.1

serve:
	python3 -m http.server 8000

password:
	openssl passwd -6 $(PASSWORD)

$(GRUB):
	curl $(GRUB_URL) --output $@
