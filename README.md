# frp-caprover

[FRP](https://github.com/fatedier/frp) app configuration for [CapRover](https://caprover.com/)

## Configure

Add Environmental Variables

```
TOKEN=secretpassword
SUBDOMAIN_HOST=frp.server.com
```

Add Port Mapping

```
Server Port : 37000 | Container Port : 7000
```

## Client

`client.toml`

```toml
serverAddr = "frp.server.com"
serverPort = 37000
auth.method = "token"
auth.token = "secretpassword"

[[proxies]]
name = "fw8888"
type = "http"
subdomain = "8888"
[proxies.plugin]
type = "http2https"
localAddr = "127.0.0.1:8888"

[[proxies]]
name = "fw8080"
type = "http"
subdomain = "8080"
[proxies.plugin]
type = "http2https"
localAddr = "127.0.0.1:8080"

[[proxies]]
name = "fw3000"
type = "http"
subdomain = "3000"
[proxies.plugin]
type = "http2https"
localAddr = "127.0.0.1:3000"

```