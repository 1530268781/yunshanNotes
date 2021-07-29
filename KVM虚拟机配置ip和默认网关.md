```shell
Copyright (c) 2020 NetSarang Computer, Inc. All rights reserved.

Type `help' to learn how to use Xshell prompt.
[C:\~]$ 

Connecting to 10.50.253.12:22...
Connection established.
To escape to local shell, press 'Ctrl+Alt+]'.

WARNING! The remote SSH server rejected X11 forwarding request.
Last login: Wed Jul 28 16:58:34 2021 from 10.33.0.104
Welcome to NSP 5.6.1 

 * This is master orchestrator
 * This is slave controller
 * Orchestrator : nsp-ctrl-12, nsp-ctrl-13
 * Peer-controller : nsp-ctrl-13
 * Edge : edge-01, edge-02, edge-03, edge-04

[root@nsp-ctrl-12(o:master c:slave) ~]# ssh root@172.16.253.50  #(OpenstackR)
root@172.16.253.50's password: 	#(yunshan3302)
Last login: Wed Jul 28 16:49:50 2021 from 172.16.253.26
[root@openstack-ctl ~]# ssh root@172.16.254.123	 #(OpenstackR node-123)
root@172.16.254.123's password: 	#(yunshan3302)
Last login: Wed Jul 28 16:59:10 2021 from 172.16.253.50
[root@openstack-node-123 ~]# virsh list
 Id    Name                           State
----------------------------------------------------
 127   instance-000000b5              running
 133   instance-000000bb              running
 199   instance-00000129              running
 211   instance-00000135              running
 212   instance-00000136              running
 240   instance-00000160              running
 241   instance-00000161              running
 242   instance-00000162              running
 247   instance-00000167              running
 271   instance-0000017f              running
 272   instance-00000180              running
 276   instance-00000184              running
 278   instance-00000186              running
 282   instance-0000018a              running
 283   instance-0000018b              running
 285   instance-0000018d              running
 286   instance-0000018e              running
 288   instance-00000190              running
 291   instance-00000193              running
 292   instance-00000194              running
 293   instance-00000195              running
 294   instance-00000196              running
 295   instance-00000192              running
#查看KVM虚拟机的配置（名称）
[root@openstack-node-123 ~]# virsh dumpxml 288 | grep nova:name
      <nova:name>lixiang</nova:name>
[root@openstack-node-123 ~]# virsh console 288	#连入虚拟机
Connected to domain instance-00000190
Escape character is ^]
error: operation failed: Active console session exists for this domain

[root@openstack-node-123 ~]# virsh console 288
Connected to domain instance-00000190
Escape character is ^]
 
login as 'cirros' user. default password: 'gocubsgo'. use 'sudo' for root.
cirros login: cirros
Password: 
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether fa:16:3e:27:d8:1d brd ff:ff:ff:ff:ff:ff
    inet6 fe80::f816:3eff:fe27:d81d/64 scope link 
       valid_lft forever preferred_lft forever
$ sudo su
$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether fa:16:3e:27:d8:1d brd ff:ff:ff:ff:ff:ff
    inet6 fe80::f816:3eff:fe27:d81d/64 scope link 
       valid_lft forever preferred_lft forever

$ pwd
/home/cirros
$ ls /etc
TZ              group           issue           os-release      screenrc
acpi            growroot-grown  ld.so.conf      passwd          securetty
cirros          hostname        ld.so.conf.d    profile         services
cirros-init     hosts           mke2fs.conf     protocols       shadow
default         init.d          modules         random-seed     ssl
dropbear        inittab         mtab            rc3.d           sudoers
fstab           inputrc         network         resolv.conf     sudoers.d
#配置接口IP
$ ifconfig eth0 192.168.200.5 netmask 255.255.255.0
$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether fa:16:3e:27:d8:1d brd ff:ff:ff:ff:ff:ff
    inet 192.168.200.5/24 brd 192.168.200.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fe27:d81d/64 scope link 
       valid_lft forever preferred_lft forever
#配置默认网关
$ route add default gw 192.168.200.2
$ ping 192.168.200.2
PING 192.168.200.2 (192.168.200.2): 56 data bytes

^Z[1]+  Stopped                    ping 192.168.200.2
$ ping 192.168.200.5
PING 192.168.200.5 (192.168.200.5): 56 data bytes
64 bytes from 192.168.200.5: seq=0 ttl=64 time=0.073 ms
64 bytes from 192.168.200.5: seq=1 ttl=64 time=0.082 ms
64 bytes from 192.168.200.5: seq=2 ttl=64 time=0.093 ms
64 bytes from 192.168.200.5: seq=3 ttl=64 time=0.063 ms
64 bytes from 192.168.200.5: seq=4 ttl=64 time=0.091 ms
64 bytes from 192.168.200.5: seq=5 ttl=64 time=0.075 ms

```

