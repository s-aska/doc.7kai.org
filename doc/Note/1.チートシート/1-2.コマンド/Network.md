# Command

## tcpdump

あんまり使わないから忘れるのです

    wget -t 1 -S -v -O- http://www.example.com/

    tcpdump -l -s 1600 -x -i eth0 dst host 202.78.208.70

    tcpdump -l -s 1600 -x -i eth0 dst host 202.78.208.70 and port 5058

## netcat

手動proxyとかテキストプロトコルなら余裕です

    80番ポートでlisten
    nc -l -p 80

    80番ポートへconnect
    nc esample.jp -p 80

    udp 53番ポートでlisten
    nc -l -u -p 53

    udp 53番ポートへconnect
    nc -u esample.jp -p 53

## namp

空いているIP探す時とか

    nmap -sL 10.110.70.90-100

