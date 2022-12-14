# Домашнее задание к занятию 12.8 "Резервное копирование баз данных"

---

### Задание 1. Резервное копирование

### Кейс
Финансовая компания решила увеличить надежность работы БД и их резервного копирования. 

Необходимо описать, какие варианты резервного копирования подходят в случаях: 

1.1 Необходимо восстанавливать данные в полном объеме за предыдущий день.

```
Предлагаю установить еженедельный Full backup и ежедневный (в самом конце дня) Differential Backup или Incremental Backup
```

1.2 Необходимо восстанавливать данные за час до предполагаемой поломки.

```
Предлагаю установить ежедневный Full backup и ежечасный Differential Backup или Incremental Backup
```


1.3* Возможен ли кейс, когда при поломке базы происходило моментальное переключение на работающую/починеную БД?

```
Да, это возможно используя Репликацию.
```

---

### Задание 2. PostgreSQL

2.1 С помощью официальной документации приведите пример команды резервирования данных и восстановления БД (pgdump/pgrestore).

```
Dump a database called mydb into a custom-format dump file:
$ pg_dump -Fc mydb > db.dump

To drop the database and recreate it from the dump:
$ dropdb mydb
$ pg_restore -C -d postgres db.dump
The database named in the -d switch can be any database existing in the cluster; 
pg_restore only uses it to issue the CREATE DATABASE command for mydb. 
With -C, data is always restored into the database name that appears in the dump file.
```

2.1* Возможно ли автоматизировать этот процесс? Если да, то как?

*Приведите ответ в свободной форме.*

---

### Задание 3. MySql

3.1 С помощью официальной документации приведите пример команды инкрементного резервного копирования базы данных MySql. 
```
Конфиг-файл /home/dbadmin/my.cnf содержит набор опций, включая такие:
--user=dbadmin --password=dbadminpwd --port=3306

Полный бэкап:
mysqlbackup --defaults-file=/home/dbadmin/my.cnf \
  --backup-dir=/home/dbadmin/backups/week15 \
  backup
  
Инкрементный бэкап:
mysqlbackup --defaults-file=/home/dbadmin/my.cnf \
  --incremental --incremental-base=dir:/home/dbadmin/backups/week15 \
  --incremental-backup-dir=/home/dbadmin/backups/week15_thursday \
   backup
 
```

3.1* В каких случаях использование реплики будет давать преимущество по сравнению с обычным резервным копированием?

*Приведите ответ в свободной форме.*

---

Задания,помеченные звездочкой * - дополнительные (не обязательные к выполнению) и никак не повлияют на получение вами зачета по этому домашнему заданию. Вы можете их выполнить, если хотите глубже и/или шире разобраться в материале.
