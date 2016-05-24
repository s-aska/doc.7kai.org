# YAMAHA RTXシリーズあるある

    # RTX1000 Rev.8.01.27 (Mon Jun 30 11:08:05 2008)
    # MAC Address : 00:a0:de:17:d2:9d, 00:a0:de:17:d2:9e, 00:a0:de:17:d2:9f, 
    # Memory 16Mbytes, 3LAN, 1BRI
    # main:  RTX1000 ver=b0 serial=N0E059750 MAC-Address=00:a0:de:17:d2:9d MAC-Addr
    ess=00:a0:de:17:d2:9e MAC-Address=00:a0:de:17:d2:9f
    security class 1 on on
    console character ascii
    console columns 80
    console lines 24
    console prompt int-router:
    console info off
    login timer 300
    ip routing on
    ip route default gateway 210.148.102.49
    lan type lan1 port-based-ks8995m=on
    ip lan1.1 address 210.148.102.53/28
    ip lan1.1 secure filter out 20001 20002 50002
    ip lan1.1 nat descriptor 1 2 3
    ip lan2 address 10.110.70.98/24
    ip lan3 address 10.106.42.1/24
    ip lan1.2 address 202.250.120.62/25
    ip lan1.3 address 10.106.16.1/24
    ip filter 10001 reject 10.106.42.0/24 * * * *
    ip filter 10002 reject 172.16.0.0/12 * * * *
    ip filter 10003 reject 192.168.0.0/16 * * * *
    ip filter 10004 reject 127.0.0.0/8 * * * *
    ip filter 10005 pass * 10.106.42.0/24 icmp * *
    ip filter 10006 pass * 10.106.42.0/24 established * *
    ip filter 20001 reject * 202.229.232.157 * * *
    ip filter 20002 reject * 202.32.117.20 * * *
    ip filter 50001 reject * * * * *
    ip filter 50002 pass * * * * *
    nat descriptor type 1 masquerade
    nat descriptor address outer 1 210.148.102.53
    nat descriptor address inner 1 10.106.42.1-10.106.42.254
    nat descriptor type 2 masquerade
    nat descriptor address outer 2 210.148.102.54
    nat descriptor address inner 2 202.250.120.1-202.250.120.127
    nat descriptor type 3 masquerade
    nat descriptor address outer 3 210.148.102.55
    nat descriptor address inner 3 10.106.16.1-10.106.16.254
    telnetd service on
    dns server 202.232.2.38
    dns private address spoof on