if type -q grc
set -l execs cat cvs df diff dig gcc g++ ls ifconfig \
       make mount mtr netstat ping ps tail traceroute \
       wdiff blkid du dnf docker docker-compose docker-machine env id ip iostat journalctl kubectl \
       last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap \
       fdisk findmnt free semanage sar ss sysctl systemctl stat showmount \
       tcpdump tune2fs vmstat w who sockstat who

  if set -q grc_plugin_execs
    set execs $grc_plugin_execs
  end

  for executable in $execs
    if type -q $executable
      function $executable --inherit-variable executable --wraps=$executable
        grc.wrap $executable $argv
      end
    end
  end
else
  echo 'You need to install grc!'
end
