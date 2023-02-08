# Домашнее задание к занятию «Инструменты Git»

------

## Задание

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.

Ответ: 

полный хеш: aefead2207ef7e2aa5dc81a34aedf0cad4c32545

комментарий: Update CHANGELOG.md

```
dpleshkov@debian:~/github/tmp/terraform-repo$ git show aefea
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Jun 18 10:29:58 2020 -0400

    Update CHANGELOG.md
```
2. Какому тегу соответствует коммит `85024d3`?

Ответ: v0.12.23

```
dpleshkov@debian:~/github/tmp/terraform-repo$ git show 85024d3
commit 85024d3100126de36331c6982bfaac02cdab9e76 (tag: v0.12.23)
```
3. Сколько родителей у коммита `b8d720`? Напишите их хеши.

Ответ: 2

хеши: 56cd7859e0 9ea88f22fc
```
dpleshkov@debian:~/github/tmp/terraform-repo$ git show b8d720
commit b8d720f8340221f2146e4e4870bf2ee0bc48f2d5
Merge: 56cd7859e0 9ea88f22fc
```

4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами  v0.12.23 и v0.12.24.
```
dpleshkov@debian:~/github/tmp/terraform-repo$ git log --oneline 'v0.12.23'..'v0.12.24'
33ff1c03bb (tag: v0.12.24) v0.12.24
b14b74c493 [Website] vmc provider links
3f235065b9 Update CHANGELOG.md
6ae64e247b registry: Fix panic when server is unreachable
5c619ca1ba website: Remove links to the getting started guide's old location
06275647e2 Update CHANGELOG.md
d5f9411f51 command: Fix bug when using terraform login on Windows
4b6d06cc5d Update CHANGELOG.md
dd01a35078 Update CHANGELOG.md
225466bc3e Cleanup after v0.12.23 release
```

5. Найдите коммит в котором была создана функция `func providerSource`, ее определение в коде выглядит 
так `func providerSource(...)` (вместо троеточия перечислены аргументы).

6. Найдите все коммиты в которых была изменена функция `globalPluginDirs`.

7. Кто автор функции `synchronizedWriters`? 

*В качестве решения ответьте на вопросы и опишите каким образом эти ответы были получены*

---

### Правила приема домашнего задания

В личном кабинете отправлена ссылка на .md файл в вашем репозитории.

### Критерии оценки

Зачет - выполнены все задания, ответы даны в развернутой форме, приложены соответствующие скриншоты и файлы проекта, в выполненных заданиях нет противоречий и нарушения логики.

На доработку - задание выполнено частично или не выполнено, в логике выполнения заданий есть противоречия, существенные недостатки. 
