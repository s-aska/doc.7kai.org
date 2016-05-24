# Catalyst

    # イネイブルモード
    Switch>enable
    Switch#

    # configモード
    Switch#configure
    Configuring from terminal, memory, or network [terminal]? 
    Enter configuration commands, one per line.  End with CNTL/Z.
    Switch(config)#

    # インターフェース設定モード
    Switch(config)#interface Fa0/1

    # リンクモード変更
    Switch(config-if)#speed 100
    Switch(config-if)#duplex full

    # VLAN割り当て
    Switch(config-if)#switchport mode access
    Switch(config-if)#switchport access vlan 200

    # VLANモード
    Switch>enable
    Switch#vlan database
    Switch(vlan)#vlan 300 name IMSS
    VLAN 300 added:
        Name: IMSS
    Switch(vlan)#exit

    # 設定ROM書き込み
    Switch#rw
    Building configuration...
    [OK]
    # VLANにIP設定
    Switch(config)#interface vlan 100
    Switch(config-if)#ip address 10.106.42.1 255.255.255.0