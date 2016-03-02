# ss-panel (Alan Version)

Let's talk about cat.  Base on [sspanel](https://github.com/orvice/ss-panel)

## About

Please visit [releases pages](https://github.com/windshadowlam/ss-panel) to download ACGSSpanel.

## Requirements

* PHP 5.5 or newer
* Web server with URL rewriting
* MySQL

## Supported Server

* [shadowsocks manyuser](https://github.com/mengskysama/shadowsocks/tree/manyuser)
* [shadowsocks-go mu](https://github.com/orvice/shadowsocks-go/tree/mu)


## Install

### Step 0

```
git clone https://github.com/windshadowlam/ss-panel.git
```

### Step 1

```
$ curl -sS https://getcomposer.org/installer | php
$ php composer.phar  install
```

### Step 2

```
cp .env.example .env
```

then edit .env

```
chmod -R 777 storage
```

### Step 3

Import the sql to you mysql database.

### Step 4

Vestacp Apache Config example:
```
DocumentRoot /home/admin/web/domain.tld/public_html/public
```

Nginx Config example:

if you download ss-panel on path /home/www/ss-panel


```
root /home/www/ss-panel/public;

location / {
    try_files $uri $uri/ /index.php$is_args$args;
}
    
```

### Step 5 More Config

view config guide on [wiki](https://github.com/orvice/ss-panel/wiki/v3-Config)

