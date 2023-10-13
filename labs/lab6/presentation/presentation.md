---
## Front matter
lang: ru-RU
title: Лабораторная 5
subtitle: Дискреционное разграничение прав в Linux. Исследование влияния дополнительных атрибутов
author:
  - Шалыгин Г. Э.
institute:
  - Российский университет дружбы народов, Москва, Россия
date:

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

  * Шалыгин Георгий Эдуардович
  * студент НФИ-02-20
  * Российский университет дружбы народов

# Вводная часть

## Актуальность

- - Информационная безопасность - важная часть компетенции в образовательном треке НФИ

## Цели и задачи

- Развить навыки администрирования ОС Linux. 
- Получить первое практическое знакомство с технологией SELinux1 . 
- Проверить работу SELinx на практике совместно с веб-сервером Apache.


## Материалы и методы

- Процессор `pandoc` для входного формата Markdown
- Результирующие форматы
  - `pdf`
  - `html`
- Автоматизация процесса создания: `Makefile`
- Компилятор Julia
- OpenModelica

# Результаты

## Веб-сервер

Зададим имя сервера в файле конфигураций.

![run simpleid](image\2.PNG){#fig:002 width=70%}


## Веб-сервер

Запуск сервера

![simpleid2](image\4.PNG){#fig:004 width=70%}



## Веб-сервер

Запуск сервера

![simpleid2 with u+s](image\10.PNG){#fig:005 width=70%}

## Контекст

Измениv контекст файла /var/www/html/test.html с httpd_sys_content_t на  samba_share_t: chcon -t samba_share_t /var/www/html/test.html ls -Z /var/www/html/test.html. 

![Изменение контекста](image\11.PNG){#fig:010 width=70%}

После этого файл недоступен. 

![Доступа нет](image\12.PNG){#fig:011 width=70%}

## Результаты run readfile

Добавим Listening 81 в лог файл и порт 81 в менеджер.

![run readfile](image\14.PNG){#fig:009 width=70%}

Сервер снова доступен.

![Сервер доступен](image\16.PNG){#fig:015 width=70%}




# Вывод

В результате выполнения работы мы развили навыки администрирования ОС Linux. Получили первое практическое знакомство с технологией SELinux1 . Проверили работу SELinx на практике совместно с веб-сервером Apache.
