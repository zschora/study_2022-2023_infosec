---
## Front matter
title: "Отчет по лабораторной работе 7"
subtitle: "Элементы криптографии. Однократное гаммирование"
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

Освоить на практике применение режима однократного гаммирования.


# Теоретическое введение

Гамми́рование, или Шифр XOR, — метод симметричного шифрования, заключающийся в «наложении» последовательности, состоящей из случайных чисел, на открытый текст. Последовательность случайных чисел называется гамма-последовательностью и используется для зашифровывания и расшифровывания данных. Суммирование обычно выполняется в каком-либо конечном поле. Например, в поле Галуа $GF(2)$ суммирование принимает вид операции «исключающее ИЛИ (XOR)».

Для шифрования каждого нового сообщения нужно использовать новую гамму. Повторное использование гаммы недопустимо ввиду свойств операции «xor». Рассмотрим пример: с помощью одинаковой гаммы Y зашифрованы два открытых текста $X_1$ и $X_2$, получено две шифрограммы $Z_1$ и $Z_2$: 

$Z_1 = X_1 \oplus Y$

$Z_2 = X_2 \oplus Y$

Выполним сложение двух шифрограмм, используя операцию xor:

$Z_1 \oplus Z_2 = (X_1\oplus Y)\oplus(X_2\oplus Y) = X_1\oplus X_2$

Результат зависит от открытых текстов $X_1$ и $X_2$ и не зависит от гаммы $Y$. Ввиду избыточности естественных языков результат поддаётся частотному анализу, то есть открытые тексты можно подобрать, не зная гамму $Y$.

Для формирования гаммы (последовательности псевдослучайных чисел) нужно использовать аппаратные генераторы случайных чисел, основанные на физических процессах. Если гамма не будет случайной, для получения открытого текста потребуется подобрать только начальное состояние (англ. seed) генератора псевдослучайных чисел. Длина гаммы должна быть не меньше длины защищаемого сообщения (открытого текста). В противном случае для получения открытого текста потребуется подобрать длину гаммы, проанализировать блоки шифротекста угаданной длины, подобрать биты гаммы.

Подробнее [@lin, @dost].

# Выполнение лабораторной работы

1. Напишем функцию наложения гаммы (@fig:001).

   ![Функция гаммирования](image\1.PNG){#fig:001 width=70%}

2. Для тестирования напишем следующий код, расшифровывающий текст и находящий ключ (@fig:002).

   ![Тестирующий код](image\2.PNG){#fig:002 width=70%}

3. Убедимся в корректности результатов выполнения программы(@fig:003).

   ![Результаты выполнения](image\3.PNG){#fig:003 width=70%}

   


# Выводы

В результате выполнения работы мы освоили на практике применение режима однократного гаммирования.


# Список литературы{.unnumbered}

::: {#refs}
:::
