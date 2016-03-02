# ss-panel (Alan Version)

Let's talk about cat.  Base on [sspanel](https://github.com/orvice/ss-panel)

## About

Please visit [releases pages](https://github.com/windshadowlam/ss-panel) to download ACGSSpanel.

Addition Function:

1: Add Baidu Look Shell

```
change shell in .env to true
change shellspell for matching keyword
Only user search keyword in your front page can go in the ACGSS Panel
```

2: Package for additional bandwidth

```
change front_currency and end_currency in .env to match the Credit Name
```

3: Modify the Transfer Log setup

* MUST use [ACGSSserver](https://github.com/windshadowlam/shadowsocks/tree/manyuser) to active

4: UI updates, Analytics Update

* Frontpage using Baidu map to point out Server location, control by `ss_node` table gps_land and gps_long field. (Click on the map can get the location in console log, remember update Baidu Map API Key)
* As a HongKonger, I convert most of the part to Traditional Chinese.
* Editing of SS Method base on "changeSSMethod" in .env
* Adding Calculation of speed and user in Node List
* Value adding function is work-in-progress, only Admin can view now
* Late Signin user will show on Admin Panel, day set in "latecheckin" in .env
* Change of info un Admin Panel
* Edit Credit in Admin/User/Edit view
* Traffic Log for Admin to view all user
* and more


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

###  More Guide

* Install for [CentOS](https://github.com/windshadowlam/ss-panel/wiki/Full-Install-Guide-(Centos))
