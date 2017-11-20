## Bitcoin Gold three-node private network in regtest mode

- Node Pool
  - RPC Port 18232, Username: user, Password: pass
- Node Bob
  - RPC Port 18233, Username: user, Password: pass
- Node Alice
  - RPC Port 18234, Username: user, Password: pass

### Addresses

- Pool: msE6Cp66ynastuGmJ327hYghtEFGX75cbT
- Bob:  mz8LAtUEB3PePywEkcoRZnMshzrQhp8qKJ
- Alice:mwPykRYe4xVK4kq8Tttzg18nzJDg2wvCK1

### To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 18232:8232 -p 8233:8233 -p 8234:8233 coinfoundry/bitcoin-gold-private-testnet
```

### Generating blocks:

```bash
docker exec -i -t <container_id> /usr/bin/bgold-cli -datadir=/data/node-pool generate 1
```

### Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:8232/
```
