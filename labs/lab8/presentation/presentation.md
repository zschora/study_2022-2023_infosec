---
## Front matter
lang: ru-RU
title: Лабораторная 8
subtitle: Элементы криптографии. Шифрование (кодирование) различных исходных текстов одним ключом
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

- Освоить на практике применение режима однократного гаммирования на примере кодирования различных исходных текстов одним ключом.


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

Напишем функцию наложения гаммы

![Файл httpd.conf](image\1.PNG){#fig:001 width=70%}


## Тест

1. Для тестирования напишем следующий код, расшифровывающий текст без поиска ключа согласно формуле  

   $C_1 \oplus C_2 \oplus P_2 = (P_1\oplus Y)\oplus(P_2\oplus Y)\oplus(P_2\oplus Y) = P_1\oplus P_2\oplus P_2 = P_1$

   

![Тестирующий код](image\2.PNG){#fig:002 width=70%}

## Результат

Убедимся в корректности результатов выполнения программы.

![Результаты выполнения](D:\work\study\2023-2024\infseq\study_2022-2023_infosec\labs\lab7\report\image\3.PNG){#fig:003 width=70%}




# Вывод

Освоить на практике применение режима однократного гаммирования на примере кодирования различных исходных текстов одним ключом.
