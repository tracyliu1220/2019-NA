iptables -F
iptables -X
iptables -F -t mangle
iptables -t mangle -X
iptables -F -t nat
iptables -t nat -X
iptables -P INPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i wg0 -s 10.113.0.0/16 -j ACCEPT
iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
iptables -A FORWARD -i enp0s8 -o wg0 -j ACCEPT

