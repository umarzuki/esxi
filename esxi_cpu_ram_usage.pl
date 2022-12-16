#!/usr/bin/perl

use strict;
use warnings;

#Connect to ESXi host

my $esxi_host = "192.168.1.100";
my $esxi_username = "admin";
my $esxi_password = "password";

#Establish connection to host

my $connection = Connect-VIServer $esxi_host -User $esxi_username -Password $esxi_password;

#Get CPU usage

my $cpu_usage = Get-Stat -Entity (Get-VMHost) -Stat cpu.usage.average;

#Get RAM usage

my $ram_usage = Get-Stat -Entity (Get-VMHost) -Stat mem.usage.average;

#Print CPU and RAM usage

print "CPU usage: $cpu_usage%\n";
print "RAM usage: $ram_usage%\n";
Disconnect from host

Disconnect-VIServer $connection -Confirm:$false;