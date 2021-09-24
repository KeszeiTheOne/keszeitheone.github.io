---
layout: post
author: keszei
title: "Építsd magad #1"
---
Mindig is akartam saját blogot vezetni. Viszont olyan problémákba ütkoztem, hogy mégis iről tudnék írni?

Az életemről? Mindennapjaimról? Kritikákat írjak?

Ez az ötlet néha napján felötlött bennem. Annyira szeretnék blogolni, de nem tudom miről.
Végül egyszer egy Programozók csoportan találtam egy ötletett. Nem új keletű dolog, de mégis van benne egy kis kihívás.
Készíteni egy saját statikus blogot, a nulláról, saját magad fejleszd. Izgalmas és érdekes felvetés, mert web fejlesztő vagyok,
miért akarnék egy blog motor által elkészített blogot készíteni (lsd. Wordpress). Sokkal lassabb egy előre elkészített blog motor
használata, mint mondjuk egy statikus oldal. 

Ebben a Facebook csoport bejegyzéseben voltak érdekes felvetések, hogy miként lehetne egy fejlesztőnek blogot vezetni. 
Készísd magad.. Oké, mivel és hogyan? 

Legelső választasom a [bashblog](https://github.com/cfenollosa/bashblog){:target="_blank"} eszközre esett. Tetszett, 
ahogyan kezelte a blognak a bejegyzéseit, egyszerűen paraméterezhető volt, valamint egyetlen egy bash script-ből állt.
Ami nem tetszett benne, hogy mindig újra kellett generálni az elkészített html fájlokat. Valamint utólag módosítás elég körülményes volt.

Nézegettem tovább, ugyan abban a csoport bejegyzésben valaki ajánlotta a [jekyll](https://jekyllrb.com/){:target="_blank"} eszközt.
Egyszerű bejegyzés kezelése van, template kezelés is van benne. Tökéletes, hogy kezdjünk bele?

Ismerkedjünk meg magával a template kezeléssel.
A `jekyll` egy `liquid` nevezetű template kezelőt használ ami elég sok aspektusban hasonlít a `twig`-re.
