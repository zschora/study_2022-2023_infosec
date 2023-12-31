---
## Front matter
title: "Отчет по лабораторной работе 5"
subtitle: "Мандатное разграничение прав в Linux"
author: "Шалыгин Георгий Эдуардович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Развить навыки администрирования ОС Linux. Получить первое практическое знакомство с технологией SELinux1 . Проверить работу SELinx на практике совместно с веб-сервером Apache.


# Теоретическое введение

В Linux, как и в любой многопользовательской системе, абсолютно естественным образом возникает задача разграничения доступа субъектов — пользователей к объектам — файлам дерева каталогов.

Один из подходов к разграничению доступа — так называемый дискреционный (от англ, discretion — чье-либо усмотрение) — предполагает назначение владельцев объектов, которые по собственному усмотрению определяют права доступа субъектов (других пользователей) к объектам (файлам), которыми владеют.

Дискреционные механизмы разграничения доступа используются для разграничения прав доступа процессов как обычных пользователей, так и для ограничения прав системных программ в (например, служб операционной системы), которые работают от лица псевдопользовательских учетных записей.

В Linux у каждого файла и каждого каталога есть два владельца: пользователь и группа.

Эти владельцы устанавливаются при создании файла или каталога. Пользователь, который создаёт файл становится владельцем этого файла, а первичная группа, в которую входит этот же пользователь, так же становится владельцем этого файла. Чтобы определить, есть ли у вас как у пользователя права доступа к файлу или каталогу, оболочка проверяет владение ими.

**Это происходит в следующем порядке:**



1. Оболочка проверяет, являетесь ли вы владельцем файла, к которому вы хотите получить доступ. Если вы являетесь этим владельцем, вы получаете разрешения и оболочка прекращает проверку.
2. Если вы не являетесь владельцем файла, оболочка проверит, являетесь ли вы участником группы, у которой есть разрешения на этот файл. Если вы являетесь участником этой группы, вы получаете доступ к файлу с разрешениями, которые для группы установлены, и оболочка прекратит проверку.
3. Если вы не являетесь ни пользователем, ни владельцем группы, вы получаете права других пользователей (Other).

Чтобы увидеть текущие назначения владельца, вы можете использовать команду **ls -l**. Эта команда показывает пользователя и группу-владельца.

Подробнее в [@lin].

### Изменение владельца


Чтобы применить соответствующие разрешения, первое, что нужно учитывать, это владение. Для этого есть команда **chown**. Синтаксис этой команды несложен для понимания:

```
chown кто что
```


Например, следующая команда меняет владельца каталога /home/account на пользователя linda:

```
chown linda /home/account
```

## Использование chmod


Для управления правами используется команда **chmod**. При использовании **chmod** вы можете устанавливать разрешения для пользователя (user), группы (group) и других (other). Вы можете использовать эту команду в двух режимах: относительный режим и абсолютный режим. В абсолютном режиме три цифры используются для установки основных разрешений.

При настройке разрешений рассчитайте необходимое вам значение. Если вы хотите установить чтение, запись и выполнение для пользователя, чтение и выполнение для группы, а также чтение и выполнение для других в файле /somefile, то вы используете следующую команду **chmod**:



```
chmod 755 /somefile
```

Подробнее в [@lin, @dost].

# Выполнение лабораторной работы

1. Файл /etc/httpd/httpd.conf (@fig:001).

   ![Файл httpd.conf](image\1.PNG){#fig:001 width=70%}

2. Также необходимо проследить, чтобы пакетный фильтр был отключён или в своей рабочей конфигурации позволял подключаться к 80-у и 81-у портам протокола tcp. Отключить фильтр можно командами (@fig:002)

   ![Задание имени сервера](image\2.PNG){#fig:002 width=70%}

3. Убедимся, что SELinux работает в режиме enforcing политики targeted с помощью команд getenforce и sestatus.(@fig:003).

   ![Проверка работы](image\3.PNG){#fig:003 width=70%}

4. Запустим веб-сервер: service httpd start (@fig:004).

   ![Запуск веб-сервера](image\4.PNG){#fig:004 width=70%}

5. Найдем веб-сервер Apache в списке процессов, определим его контекст безопасности. Например, можно использовать команду ps auxZ | grep httpd (@fig:005).

   ![Контекст сервера](image\5.PNG){#fig:005 width=70%}

6. Посмотрите текущее состояние переключателей SELinux для Apache с помощью команды sestatus -bigrep httpd. Многие отключены (@fig:006).

   ![Состояние переключателей](image\6.PNG){#fig:006 width=70%}

7. Посмотрим статистику по политике с помощью команды seinfo (@fig:007).

   ![Статистика по политике](image\7.PNG){#fig:007 width=70%}

8. Определим тип файлов и поддиректорий, находящихся в директории /var/www, с помощью команды ls -lZ /var/www. (@fig:008). Проверим что guest не имеет доступ к файлу.

   ![Проверка контекста](image\8.PNG){#fig:008 width=70%}

9. Создадим от имени суперпользователя (так как в дистрибутиве после установки только ему разрешена запись в директорию) html-файл /var/www/html/test.html 

   Обратиvcz к файлу через веб-сервер, введя в браузере адрес http://127.0.0.1/test.html. Убедиvcz, что файл был успешно отображён. (@fig:009).

   ![Доступ к серверу](image\10.PNG){#fig:009 width=70%}

10. Измениv контекст файла /var/www/html/test.html с httpd_sys_content_t на  samba_share_t: chcon -t samba_share_t /var/www/html/test.html ls -Z /var/www/html/test.html (@fig:010). 

    ![Изменение контекста](image\11.PNG){#fig:010 width=70%}

11. После этого файл недоступен (@fig:011). 

    ![Доступа нет](image\12.PNG){#fig:011 width=70%}

12. Просмотрим системный лог-файл: tail /var/log/messages (@fig:012). 

    ![Лог файл](image\13.PNG){#fig:012 width=70%}

13. Выполним команду semanage port -a -t http_port_t -р tcp 81. После этого проверим список портов командой semanage port -l | grep http_port_t. Убедимся, что порт 81 появился в списке. Теперь доступ к серверу есть, мы добавили порт 81. (@fig:013). 

    ![Добавление порта](image\14.PNG){#fig:013 width=70%}

14. Вернем контекст httpd_sys_cоntent__t к файлу /var/www/html/ test.html: chcon -t httpd_sys_content_t /var/www/html/test.html После этого попробуем получить доступ к файлу через веб-сервер, введя в браузере адрес http://127.0.0.1:81/test.html. (@fig:014). 

    ![Возвращение контекста](image\15.PNG){#fig:014 width=70%}

15. Сервер снова доступен (@fig:015). 

    ![Сервер доступен](image\16.PNG){#fig:015 width=70%}

16. Исправим конфигурацию, удалим привязку к 81 порту и файл test (@fig:016). 

    ![Окончание работы](image\17.PNG){#fig:016 width=70%}

    

# Выводы

В результате выполнения работы мы развили навыки администрирования ОС Linux. Получили первое практическое знакомство с технологией SELinux1 . Проверили работу SELinx на практике совместно с веб-сервером Apache.

# Список литературы{.unnumbered}

::: {#refs}
:::
