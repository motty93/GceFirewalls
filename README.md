# Specific IP addresses reject
This repository is the way to reject IP addresses using gcloud commands.

So I created a shell script, please use it by all means.

Thank you.

## How to use

It is a premise that gcloud commands can be use.

If you won't know, please access here.

https://cloud.google.com/sdk/docs/how-to?hl=en

```
$ git clone https://github.com/motty93/gce-firewalls.git

$ cd gce-firewalls/

# After the gcloud config set project <project name>.
$ ./gce-firewall.sh
```

You will reject IP addresses of cn, kr, kp.
