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
```
dpleshkov@debian:~/github/tmp/terraform-repo$ git log -S'func providerSource(' --oneline
8c928e8358 main: Consult local directories as potential mirrors of providers
```

6. Найдите все коммиты в которых была изменена функция `globalPluginDirs`.
```
dpleshkov@debian:~/github/tmp/terraform-repo$ git grep globalPluginDirs
commands.go:            GlobalPluginDirs: globalPluginDirs(),
commands.go:    helperPlugins := pluginDiscovery.FindPlugins("credentials", globalPluginDirs())
internal/command/cliconfig/config_unix.go:              // FIXME: homeDir gets called from globalPluginDirs during init, before
plugins.go:// globalPluginDirs returns directories that should be searched for
plugins.go:func globalPluginDirs() []string {
dpleshkov@debian:~/github/tmp/terraform-repo$ git log -L :globalPluginDirs:plugins.go | grep commit
commit 78b12205587fe839f10d946ea3fdc06719decb05
commit 52dbf94834cb970b510f2fba853a5b49ad9b1a46
commit 41ab0aef7a0fe030e84018973a64135b11abcd70
commit 66ebff90cdfaa6938f26f908c7ebad8d547fea17
commit 8364383c359a6b738a436d1b7745ccdce178df47
```

7. Кто автор функции `synchronizedWriters`? 

Ответ: Martin Atkins
```
dpleshkov@debian:~/github/tmp/terraform-repo$ git log -S'synchronizedWriters(' --pretty=short
commit bdfea50cc85161dea41be0fe3381fd98731ff786
Author: James Bardin <j.bardin@gmail.com>

    remove unused

commit fd4f7eb0b935e5a838810564fd549afe710ae19a
Author: James Bardin <j.bardin@gmail.com>

    remove prefixed io

commit 5ac311e2a91e381e2f52234668b49ba670aa0fe5
Author: Martin Atkins <mart@degeneration.co.uk>

    main: synchronize writes to VT100-faker on Windows
```
