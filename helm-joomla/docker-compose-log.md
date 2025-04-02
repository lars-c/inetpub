# Output from 'docker-compose up'


```bash
> docker compose up
[+] Running 5/5
 ✔ Network joomla_joomla_network Created                                                                                                                                                 0.1s 
 ✔ Volume "joomla_db_data"        Created                                                                                                                                                0.0s 
 ✔ Volume "joomla_joomla_data"    Created                                                                                                                                                0.0s 
 ✔ Container joomla-db-1          Created                                                                                                                                                0.1s 
 ✔ Container joomla-joomla-1      Created                                                                                                                                                0.1s 
Attaching to db-1, joomla-1
db-1      | 2025-04-02 07:54:38+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.40-1.el9 started.
joomla-1  | ========================================================================
joomla-1  | 
joomla-1  | [INFO] Joomla not found in /var/www/html - copying now...
db-1      | 2025-04-02 07:54:39+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
db-1      | 2025-04-02 07:54:39+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.40-1.el9 started.
db-1      | 2025-04-02 07:54:39+00:00 [Note] [Entrypoint]: Initializing database files
db-1      | 2025-04-02T07:54:39.907474Z 0 [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
db-1      | 2025-04-02T07:54:39.907771Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.40) initializing of server in progress as process 81
db-1      | 2025-04-02T07:54:39.933898Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
db-1      | 2025-04-02T07:54:41.048819Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
joomla-1  |  Complete! Joomla has been successfully copied to /var/www/html
joomla-1  | 
joomla-1  | Ensuring Joomla database is present
joomla-1  | [02-Apr-2025 07:54:45 UTC] PHP Warning:  mysqli::__construct(): (HY000/2002): Connection refused in /makedb.php on line 30
joomla-1  | 
joomla-1  | MySQL Connection Error: (2002) Connection refused
db-1      | 2025-04-02T07:54:46.648642Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
joomla-1  | 
joomla-1  | MySQL Connection Error: (2002) Connection refused
joomla-1  | 
joomla-1  | MySQL Connection Error: (2002) Connection refused
db-1      | 2025-04-02 07:54:52+00:00 [Note] [Entrypoint]: Database files initialized
db-1      | 2025-04-02 07:54:52+00:00 [Note] [Entrypoint]: Starting temporary server
db-1      | 2025-04-02T07:54:52.735835Z 0 [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
db-1      | 2025-04-02T07:54:52.739596Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.40) starting as process 125
db-1      | 2025-04-02T07:54:52.778218Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
db-1      | 2025-04-02T07:54:53.264241Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
db-1      | 2025-04-02T07:54:53.899727Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
db-1      | 2025-04-02T07:54:53.899825Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
db-1      | 2025-04-02T07:54:53.911990Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
db-1      | 2025-04-02T07:54:53.968714Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
db-1      | 2025-04-02T07:54:53.969087Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.40'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
db-1      | 2025-04-02 07:54:53+00:00 [Note] [Entrypoint]: Temporary server started.
db-1      | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
joomla-1  | 
joomla-1  | MySQL Connection Error: (2002) Connection refused
db-1      | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
db-1      | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
db-1      | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
joomla-1  | 
joomla-1  | MySQL Connection Error: (2002) Connection refused
db-1      | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
db-1      | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
db-1      | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
db-1      | 2025-04-02 07:55:00+00:00 [Note] [Entrypoint]: GENERATED ROOT PASSWORD: 8bTNmMFuA4yK0BhCxTgwhkP0ZMMrLp47
db-1      | 2025-04-02 07:55:00+00:00 [Note] [Entrypoint]: Creating database joomla_db
db-1      | 2025-04-02 07:55:00+00:00 [Note] [Entrypoint]: Creating user joomlaa
db-1      | 2025-04-02 07:55:00+00:00 [Note] [Entrypoint]: Giving user joomlaa access to schema joomla_db
db-1      | 
db-1      | 2025-04-02 07:55:00+00:00 [Note] [Entrypoint]: Stopping temporary server
db-1      | 2025-04-02T07:55:00.245076Z 13 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.0.40).
joomla-1  | 
joomla-1  | MySQL Connection Error: (2002) Connection refused
db-1      | 2025-04-02T07:55:01.729350Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.40)  MySQL Community Server - GPL.
db-1      | 2025-04-02 07:55:02+00:00 [Note] [Entrypoint]: Temporary server stopped
db-1      | 
db-1      | 2025-04-02 07:55:02+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
db-1      | 
db-1      | 2025-04-02T07:55:02.730727Z 0 [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
db-1      | 2025-04-02T07:55:02.734320Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.40) starting as process 1
db-1      | 2025-04-02T07:55:02.751460Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
db-1      | 2025-04-02T07:55:03.213476Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
joomla-1  | 
joomla-1  | MySQL Connection Error: (2002) Connection refused
db-1      | 2025-04-02T07:55:03.726321Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
db-1      | 2025-04-02T07:55:03.726418Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
db-1      | 2025-04-02T07:55:03.741225Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
db-1      | 2025-04-02T07:55:03.799961Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
db-1      | 2025-04-02T07:55:03.800275Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.40'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
joomla-1  | 
joomla-1  | MySQL Database Created
joomla-1  | 
joomla-1  | Install Joomla
joomla-1  | ==============
joomla-1  | 
joomla-1  | Checking system requirements...OK
joomla-1  | Collecting configuration...
joomla-1  | 
joomla-1  |  Relative or absolute path to the public folder []:
joomla-1  |  > OK
joomla-1  | Validating DB connection...OK
joomla-1  | Creating and populating the database...OK
joomla-1  | Writing configuration.php and additional setup ...OK
joomla-1  | Deleting /installation folder...OK
joomla-1  | 
joomla-1  |  [OK] Joomla has been installed                                                 
joomla-1  | 
joomla-1  |  This server is now configured to run Joomla!
joomla-1  | 
joomla-1  | ========================================================================
joomla-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.2. Set the 'ServerName' directive globally to suppress this message
joomla-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.2. Set the 'ServerName' directive globally to suppress this message
joomla-1  | [Wed Apr 02 07:55:16.973017 2025] [mpm_prefork:notice] [pid 1:tid 1] AH00163: Apache/2.4.62 (Debian) PHP/8.2.24 configured -- resuming normal operations
joomla-1  | [Wed Apr 02 07:55:16.973132 2025] [core:notice] [pid 1:tid 1] AH00094: Command line: 'apache2 -D FOREGROUND'

```