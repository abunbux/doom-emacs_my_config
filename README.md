<!--
title: "doom-emacs_my_config"
url: https://github.com/abunbux/doom-emacs_my_config
author: "abunbux"
date: CREATED <Ср фев 18 12:01:05 MSK 2026>
Time-stamp: <Последнее обновление -- Среда февраля 18 18:53:18 MSK 2026>
description: "Пространные рассуждения по установке и использованию"
tags: [emacs, doomemacs, guide]
-->

### Содержание
-[Установка](#установка)




# Установка

Сперва, понятное дело, нужен сам /emacs/.
Затем идём на [страничку doomemacs на github](https://github.com/doomemacs/doomemacs) и устанавливаем.
Обычно это:

``` shell
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

Первой командой мы клонируем репозиторий /doomemacs/ в директорию ~/.config/emacs.
Вторая добавит нам директорию ~/.config/doom с тремя файлами:
- config.el;
- init.el;
- packages.el;
Вот здесь-то и должна разгуляться наша фантазия по настройке /emacs/.

Затем уже клонируем этот репозиторий.

``` shell
git clone https://github.com/abunbux/doom-emacs_my_config.git
```

При клонировании можно пойти двумя путями. Либо сперва удалить все файлы из директории *~/config/doom/* и клонироваться прямиком туда.
Либо, что было бы более правильно, создать временную папку с любым наименованием, залить репозиторий туда и сперва сравнить файлы, созданные ранее
при установке *doomemacs* (config.el, init.el, packages.el) в директории *~/config/doom/* с такими же, но во временной папке.
