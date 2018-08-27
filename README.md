# Specific IP addresses reject
This repository is the way to reject IP addresses using gcloud commands.

So I created a shell script, please use it by all means.

## How to use

It is a premise that gcloud commands can be used.

If you won't know, please access here.

https://cloud.google.com/sdk/docs/how-to?hl=en

```
$ git clone https://github.com/motty93/gce-firewalls.git

$ cd gce-firewalls/sh/

# After the gcloud config set project <project name>.
$ chmod 755 cn-kr-kp-firewall.sh

$ ./cn-kr-kp-firewall.sh
```

You will reject IP addresses of cn, kr, kp.

If you are going to want to reject Philippines IP addresses, you can reject the next way.

```
$ chmod 755 philippines-firewall.sh

$ ./philippines-firewall.sh
```

If you are going to want to reject all IP addresse, you need to add IP addresses which you want to reject to `iptext/all-ip-addresses.txt`.

```
$ chmod 755 all-firewall.sh

$ ./all-firewall.sh
```
