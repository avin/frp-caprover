# FRP for CapRover

[FRP](https://github.com/fatedier/frp) app configuration for [CapRover](https://caprover.com/)

## Configure app

Add Environmental Variables

* `TOKEN` = `secretpassword` (use same token in client.toml config)
* `SUBDOMAIN_HOST` = `frp.server.com` (replace with your domain)


Add Port Mapping

```
Server Port : 37000 | Container Port : 7000
```

Add domains

```
8888.frp.server.com
static.frp.server.com
```

## Client config

`client.toml`

```toml
serverAddr = "frp.server.com"
serverPort = 37000
auth.method = "token"
auth.token = "secretpassword"

# ---- https://8888.frp.server.com -> https://127.0.0.1:8888 ----

[[proxies]]
name = "web8888"
type = "http"
subdomain = "8888"
[proxies.plugin]
type = "http2https"
localAddr = "127.0.0.1:8888"

# ---- https://static.frp.server.com -> share file from C:\\www ----

[[proxies]]
name = "static"
type = "http"
subdomain = "static"
[proxies.plugin]
type = "static_file"
localPath = "C:\\www"
httpUser = "abc"
httpPassword = "abc"

```