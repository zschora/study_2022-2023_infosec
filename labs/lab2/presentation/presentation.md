---
## Front matter
lang: ru-RU
title: Лабораторная 2
subtitle: Дискреционное разграничение прав в Linux. Основные атрибуты
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

- Получение практических навыков работы в консоли с атрибутами файлов, закрепление теоретических основ дискреционного разграничения доступа в современных системах с открытым кодом на базе ОС Linux1.


## Материалы и методы

- Процессор `pandoc` для входного формата Markdown
- Результирующие форматы
  - `pdf`
  - `html`
- Автоматизация процесса создания: `Makefile`
- Компилятор Julia
- OpenModelica

# Результаты

## Группы доступа

Для нового пользователя guest gid=1001, а uid=1001.

![группы доступа](image\2.PNG){#fig:001 width=40%}

![группы доступа2](image\3.PNG){#fig:002 width=40%}




## Изучение прав доступа

Создадим в домашней директории поддиректорию dir1 командой mkdir dir1 

В данном случае права доступа по умолчанию 755.

Снимем с директории dir1 все атрибуты командой chmod 000 dir1



![изменение прав](image\6.PNG){#fig:003 width=40%}

## Построение графиков

Попытаемся создать в директории dir1 файл file1 командой echo "test" > /home/guest/dir1/file1 (@fig:004). Т.к. права были изменены в прошлом пункте, выскакивает ошибка доступа.

![ошибка доступа](image\7.PNG){#fig:004 width=50%}

##  Минимальные права для совершения операций

| Операция               | Минимальные права  на директорию | Минимальные права на файл |
| ---------------------- | -------------------------------- | ------------------------- |
| Создание файла         | 300                              | 0                         |
| Удаление файла         | 300                              | 0                         |
| Чтение файла           | 100                              | 400                       |
| Запись в файл          | 100                              | 200                       |
| Переименование файла   | 300                              | 0                         |
| Создание поддиректории | 300                              | 0                         |
| Удаление поддиректории | 300                              | 0                         |


# Вывод

В ходе работы были получены практические навыки работы в консоли с атрибутами файлов, закреплены теоретические основы дискреционного разграничения доступа в современных системах с открытым кодом на базе ОС Linux1.
