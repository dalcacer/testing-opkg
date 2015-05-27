Simple setup to test opkg and its fitness for a specific project.

Each operation is performed various times under changing network conditions.

# Usage

* `vagrant up`
* in gui
  * change password `passwd`
* in terminal SSH to machine `ssh -p 2223 root@192.168.71.1`
 * `opkg update`
 * `opkg install tc bash iptables-mod-ipopt kmod-sched kmod-ipt-extra iptables-mod-extra`
* in terminal copy tests to machine
 * `scp -P 2223 ./test-bandwidth.sh root@192.168.71.1:~/`
 * `scp -P 2223 ./test-packageloss.sh root@192.168.71.1:~/`
 * `scp -P 2223 ./reduce-bandwidth.sh root@192.168.71.1:~/`
* in gui
 * `cd /root`
 * `chmod 777 *.sh`
 * `bash test-bandwidth.sh && bash test-packageloss.sh`
* pull data
 * `scp -P 2223 root@192.168.71.1:~/opkg-bandwidth.txt .`
 * `scp -P 2223 root@192.168.71.1:~/opkg-packageloss.txt .`
