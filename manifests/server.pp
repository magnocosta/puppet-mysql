# -*- mode: ruby -*-
# vi: set ft=ruby :

class mysql::server {

    exec { "apt-update":
        command => "/usr/bin/apt-get update"
    }

    # Install mysql package
    package { "mysql-server":
        ensure => installed,
        require => Exec["apt-update"]
    }

    # Config external.cnf
    file { "/etc/mysql/conf.d/allow_external.cnf":
        owner    =>  mysql,
        group    =>  mysql,
        mode     =>  644,
        content  =>  template("mysql/allow_external.cnf"),
        require  =>  Package["mysql-server"]
    }

    # Remove user anonymous mysql user 
    exec { "remove-anonymous-user":
        command    =>  "mysql -uroot -e \"DELETE FROM mysql.user WHERE user=’’; FLUSH PRIVILEGES\"",
        onlyif     =>  "mysql -u’ ’",
        path       =>  "/usr/bin",
        require    =>  Service["mysql"],
    }

}
