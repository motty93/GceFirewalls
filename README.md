# Specific IP addresses reject
This repository is the way to reject IP addresses using gcloud commands.

So I created a shell script, please use it by all means.

## How to use

It is a premise that gcloud commands can be used.

If you won't know, please access here.

https://cloud.google.com/sdk/docs/how-to?hl=en

```
$ cd ~

$ git clone https://github.com/motty93/GceFirewalls.git
```

After your project selected by `gcloud config set project <project name>`.

This script is how to reject cn, kr, kp.

```
$ cd GceFirewalls/sh/byCountry/

$ chmod 755 cn-kr-kp-firewall.sh

$ ./cn-kr-kp-firewall.sh
```

If you are going to want to reject Philippines IP addresses, you can reject the next way.

```
$ cd GceFirewalls/sh/byCountry/

$ chmod 755 philippines-firewall.sh

$ ./philippines-firewall.sh
```

If you are going to want to reject all IP addresse, you need to add IP addresses which you want to reject to `iptext/all-ip-addresses.txt`.

```
$ cd GceFirewalls/sh/

$ chmod 755 all-firewall.sh

$ ./all-firewall.sh
```
