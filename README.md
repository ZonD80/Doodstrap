[Doodstrap](http://zond80.tel/)
==================================================

* Doodstrap was made to bootstrap my projects, it is for my personal use.
* This simple framework provides database, cache, template, language and account management API.
* You can build your sites on this framework, for free.
* Yes, it is very simple.


How to install
----------------------------
Copy to files to your server except database_schema.sql

Set permissions 777 to cache folder
```bash
chmod 777 cache
```

Import database_schema.sql to your database (must be utf8_general_ci)
```bash
mysql -u DB_USER -pDB_PASS < database_schema.sql
```
edit init.php and add your values.


Run it


License
----------------------------
Doodstrap is licensed under GPLv3 license, included in package.