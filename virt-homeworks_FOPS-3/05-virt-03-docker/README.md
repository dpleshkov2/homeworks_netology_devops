
# Домашнее задание к занятию "3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

## Задача 1

Сценарий выполения задачи:

- создайте свой репозиторий на https://hub.docker.com;
- выберете любой образ, который содержит веб-сервер Nginx;
- создайте свой fork образа;
- реализуйте функциональность:
запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
```
Опубликуйте созданный форк в своем репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.
```
Ответ: https://hub.docker.com/r/dpleshkov123/mynginx
```

## Задача 2

Посмотрите на сценарий ниже и ответьте на вопрос:
"Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"

Детально опишите и обоснуйте свой выбор.

--

Сценарий:

- Высоконагруженное монолитное java веб-приложение;
```
Docker вполне подходит; он обеспечивает эффективное использование вычислительных ресурсов
```

- Nodejs веб-приложение;
```
Docker вполне подходит (https://hub.docker.com/r/appdynamics/nodejs-agent)
```

- Мобильное приложение c версиями для Android и iOS;
```
Docker может быть полезен только на этапе разработки таких мобильных приложений, 
а для штатной работы не подходит так как не поддерживается в этих ОС. 
Для штатной работы надо использовать соответствующие физические машины.
```

- Шина данных на базе Apache Kafka;
```
Docker вполне подходит (https://hub.docker.com/r/bitnami/kafka)
```

- Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;
```
Docker подходит. На этапе разработки/тестирования можно использовать multi-node кластер с использованием Docker Compose, 
а в проде систему желательно распределить на несколько физических машин, поднимая на них соответствующие контейнеры 
```

- Мониторинг-стек на базе Prometheus и Grafana;
```
Docker вполне подходит ( https://hub.docker.com/r/bitnami/prometheus https://hub.docker.com/r/grafana/grafana)
```

- MongoDB, как основное хранилище данных для java-приложения;
```
Docker вполне подходит ( https://hub.docker.com/_/mongo )
```

- Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.
```
Docker вполне подходит ( https://hub.docker.com/_/registry )
```

## Задача 3

- Запустите первый контейнер из образа ***centos*** c любым тэгом в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера;
- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера;
- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```;
- Добавьте еще один файл в папку ```/data``` на хостовой машине;
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.
```
dpleshkov@debian:~/github/hwrk/virt-homeworks/05-virt-03-docker/tmp$ sudo docker exec -it centos_container
"docker exec" requires at least 2 arguments.
See 'docker exec --help'.

Usage:  docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

Run a command in a running container
dpleshkov@debian:~/github/hwrk/virt-homeworks/05-virt-03-docker/tmp$ sudo docker exec -it centos_container bash
[root@b572142258c1 /]# ls
bin  data  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@b572142258c1 /]# ls -la /data
total 8
drwxr-xr-x 2 1000 1000 4096 Feb 27 05:49 .
drwxr-xr-x 1 root root 4096 Feb 27 06:23 ..
[root@b572142258c1 /]# touch /data/centosdata.txt
[root@b572142258c1 /]# ls -la /data
total 8
drwxr-xr-x 2 1000 1000 4096 Feb 27 06:30 .
drwxr-xr-x 1 root root 4096 Feb 27 06:23 ..
-rw-r--r-- 1 root root    0 Feb 27 06:30 centosdata.txt
[root@b572142258c1 /]# vi /data/centosdata.txt 
[root@b572142258c1 /]# exit
exit
dpleshkov@debian:~/github/hwrk/virt-homeworks/05-virt-03-docker/tmp$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
b572142258c1   centos    "/bin/bash"   8 minutes ago    Up 8 minutes              centos_container
6be28f2f8579   debian    "bash"        10 minutes ago   Up 10 minutes             debian_container
dpleshkov@debian:~/github/hwrk/virt-homeworks/05-virt-03-docker/tmp$ ls -la ./data/
total 12
drwxr-xr-x 2 dpleshkov dpleshkov 4096 Feb 27 09:31 .
drwxr-xr-x 3 dpleshkov dpleshkov 4096 Feb 27 08:49 ..
-rw-r--r-- 1 root      root        42 Feb 27 09:31 centosdata.txt
dpleshkov@debian:~/github/hwrk/virt-homeworks/05-virt-03-docker/tmp$ cat ./data/centosdata.txt 
This file is created in centos container.
dpleshkov@debian:~/github/hwrk/virt-homeworks/05-virt-03-docker/tmp$ vi ./data/hostdata.txt
dpleshkov@debian:~/github/hwrk/virt-homeworks/05-virt-03-docker/tmp$ sudo docker exec -it debian_container bash
root@6be28f2f8579:/# ls -la /data/
total 16
drwxr-xr-x 2 1000 1000 4096 Feb 27 06:34 .
drwxr-xr-x 1 root root 4096 Feb 27 06:21 ..
-rw-r--r-- 1 root root   42 Feb 27 06:31 centosdata.txt
-rw-r--r-- 1 1000 1000   34 Feb 27 06:34 hostdata.txt
root@6be28f2f8579:/# cat /data/centosdata.txt 
This file is created in centos container.
root@6be28f2f8579:/# cat /data/hostdata.txt   
This file is created on the host.
root@6be28f2f8579:/#
```

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.

Соберите Docker образ с Ansible, загрузите на Docker Hub и пришлите ссылку вместе с остальными ответами к задачам.

```
Что-то образ не собрался, не смог разобраться... :

Step 2/5 : RUN CARGO_NET_GIT_FETCH_WITH_CLI=1 &&     apk --no-cache add         sudo         python3        py3-pip         openssl         ca-certificates         sshpass         openssh-client         rsync         git &&     apk --no-cache add --virtual build-dependencies         python3-dev         libffi-dev         musl-dev         gcc         cargo         openssl-dev         libressl-dev         build-base &&     pip install --upgrade pip wheel &&     pip install --upgrade cryptography cffi &&     pip uninstall ansible-base &&     pip install ansible-core &&     pip install ansible==2.10.0 &&     pip install mitogen ansible-lint jmespath &&     pip install --upgrade pywinrm &&     apk del build-dependencies &&     rm -rf /var/cache/apk/* &&     rm -rf /root/.cache/pip &&     rm -rf /root/.cargo
 ---> Running in dbc0d11782ca
...
...
Successfully built ruamel.yaml.clib
Installing collected packages: typing-extensions, tomli, subprocess-tee, ruamel.yaml.clib, pyrsistent, pygments, platformdirs, pathspec, packaging, mypy-extensions, mitogen, mdurl, jmespath, filelock, click, bracex, attrs, yamllint, wcmatch, ruamel.yaml, markdown-it-py, jsonschema, black, rich, ansible-lint
  Attempting uninstall: packaging
    Found existing installation: packaging 20.9
ERROR: Cannot uninstall 'packaging'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.
The command '/bin/sh -c CARGO_NET_GIT_FETCH_WITH_CLI=1 &&     apk --no-cache add         sudo         python3        py3-pip         openssl         ca-certificates         sshpass         openssh-client         rsync         git &&     apk --no-cache add --virtual build-dependencies         python3-dev         libffi-dev         musl-dev         gcc         cargo         openssl-dev         libressl-dev         build-base &&     pip install --upgrade pip wheel &&     pip install --upgrade cryptography cffi &&     pip uninstall ansible-base &&     pip install ansible-core &&     pip install ansible==2.10.0 &&     pip install mitogen ansible-lint jmespath &&     pip install --upgrade pywinrm &&     apk del build-dependencies &&     rm -rf /var/cache/apk/* &&     rm -rf /root/.cache/pip &&     rm -rf /root/.cargo' returned a non-zero code: 1
```
---
