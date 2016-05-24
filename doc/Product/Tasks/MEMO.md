# Tasks

## 環境構築
    sudo port install couchdb +server

## 起動
    sudo couchdb -c '/opt/local/bin/couchdb -b -o /opt/local/var/log/couchdb/couchdb.stdout -e /opt/local/var/log/couchdb/couchdb.stderr'
    or 
    sudo launchctl load -w /opt/local/Library/LaunchDaemons/org.apache.couchdb.plist


    If this is your first install, automatically load on login with:
        mkdir -p ~/Library/LaunchAgents
        cp /usr/local/Cellar/couchdb/1.0.2/Library/LaunchDaemons/org.apache.couchdb.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/org.apache.couchdb.plist

    If this is an upgrade and you already have the org.apache.couchdb.plist loaded:
        launchctl unload -w ~/Library/LaunchAgents/org.apache.couchdb.plist
        cp /usr/local/Cellar/couchdb/1.0.2/Library/LaunchDaemons/org.apache.couchdb.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/org.apache.couchdb.plist

    Or start manually with:
        couchdb
    ==> Summary
    /usr/local/Cellar/couchdb/1.0.2: 284 files, 2.5M, built in 38 seconds


