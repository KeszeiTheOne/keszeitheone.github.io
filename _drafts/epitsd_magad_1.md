---
layout: post
author: keszei
title: "Építsd magad #1"
---
Mindig is akartam saját blogot vezetni. Viszont olyan problémákba ütkoztem, hogy mégis miről tudnék írni?

Az életemről? Mindennapjaimról? Kritikákat írjak?

Ez az ötlet néha napján felötlött bennem. Annyira szeretnék blogolni, de nem tudom miről.
Végül a ,,Programozók" Facebook csoportban találtam valamit. Valamit, ami elültetett egy gondolatot. Nem újkeletű dolog, de mégis van benne egy kis kihívás.
Készíteni egy  statikus blogot a nulláról, amit sajátmagad fejlesztesz le. Izgalmas és érdekes felvetés.
Webfejlesztő vagyok, miért akarnék egy blogmotor által előre legyártott blogot vezetni? (lsd. Wordpress). Sokkal lassabban tölt be egy előre elkészített blogmotor (a sok felesleges komponens miatt), mint mondjuk egy statikus oldal.

Ebben a csoportbejegyzésben voltak érdekes felvetések, hogy miként lehetne egy fejlesztőnek blogot vezetni.
Készísd magad.. Oké, mivel és hogyan?

Legelső választasom a [bashblog](https://github.com/cfenollosa/bashblog){:target="_blank"} eszközre esett. Tetszett,
ahogyan kezelte a bejegyzéseket, egyszerűen paraméterezhető volt, valamint egyetlen egy bash script-ből állt.
Ami nem tetszett benne, hogy mindig újra kellett generálni az elkészített html fájlokat. Valamint az utólag módosítás elég körülményes volt.

Nézegettem tovább, ugyanabban a csoportbejegyzésben valaki ajánlotta a [jekyll](https://jekyllrb.com/){:target="_blank"} eszközt.
Egyszerű a bejegyzés kezelése, a template kezelés is benne van. Tökéletes. De hogy kezdjek bele?

A `jekyll` nagyon jól van dokumentálva, az alapokat nagyon egyszerűen meg lehet tanulni a [step-by-step]{https://jekyllrb.com/docs/step-by-step/01-setup/} leírásból.
Az oktatóanyagnak a végén elég egyszerű oldalt lehet elkészíteni. Megtanítja, hogyan kell a layout-okat haználni, posztokat írni, írót hozzáadni, valamint ezutóbbihoz egy külön oldalt is írni.

![Az oldal kezdeti kinézete](/assets/images/epitsd_magad/legelso_lepesek.png)

Ez a legelső oldalnak még megteszi, legalább a kezdeti bejegyzéseket meg lehet írni. Későbbiekben lehet ezt az oldalt tövább bővíteni.

Külön bejegyzésekben fogok majd írni a `sass`-ról, a `liquid`-ről, továbbá lesznek még bejegyzések erről a keretrendszerről.

Na és természetesen a jövőben lesznek posztok a saját tapasztalataimról is.
