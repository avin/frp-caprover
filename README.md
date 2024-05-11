# frp-caprover

## Configure

Add Environmental Variables
```
TOKEN=secretpassword
SUBDOMAIN_HOST=frp.server.com
```

## Client

`client.toml`

```toml
serverAddr = "frp.server.com"
serverPort = 37000
auth.method = "token"
auth.token = "secretpassword"

[[proxies]]
name = "test8888"
type = "http"
subdomain = "8888"
[proxies.plugin]
type = "http2https"
localAddr = "127.0.0.1:8888"

[[proxies]]
name = "test8080"
type = "http"
subdomain = "8080"
[proxies.plugin]
type = "http2https"
localAddr = "127.0.0.1:8080"

```