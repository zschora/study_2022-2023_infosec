---
## Front matter
lang: ru-RU
title: Лабораторная 7
subtitle: Элементы криптографии. Однократное гаммирование
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

- Освоить на практике применение режима однократного гаммирования.


## Материалы и методы

- Процессор `pandoc` для входного формата Markdown
- Результирующие форматы
  - `pdf`
  - `html`
- Автоматизация процесса создания: `Makefile`
- Компилятор Julia
- OpenModelica

# Результаты

## Гаммирование

$CODE = TEXT\oplus KEY$

Напишем функцию наложения гаммы (@fig:001).

![Файл httpd.conf](image\1.PNG){#fig:001 width=70%}


## Тест

Для тестирования напишем следующий код, расшифровывающий текст и находящий ключ (@fig:002).

![Тестирующий код](image\2.PNG){#fig:002 width=70%}

## Результат

Убедимся в корректности результатов выполнения программы(@fig:003).

![Результаты выполнения](D:\work\study\2023-2024\infseq\study_2022-2023_infosec\labs\lab7\report\image\3.PNG){#fig:003 width=70%}




# Вывод

В результате выполнения работы мы освоили на практике применение режима однократного гаммирования.
