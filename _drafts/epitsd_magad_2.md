---
layout: post
author: keszei
title: "Építsd magad #2 - Sass rejtelmei"
---

## Mire jó egy blog egy valamire való dizájn nélkül? ##

Mint ahogy az előző posztomban mutattam a képet, jelenleg egy sima html oldal jelenik meg. Ez elég vacak egy kinézet, valahogy 
felkéne turbózni. Viszont a helyzet a következő: nagyon keveset értek a jó dizájnhoz. Én inkább a backend oldalon vagyok magabiztos, de azért a frontend se áll tőlem messze. Bootstrap-et is egész jól ismerem. Egy nagyon jó css "keretrendszer". A jekyll szerencsére alapjáraton kezeli a `sass` fájl konvertálást, szóval csak egyszerűen bele kell forgatni a bootstrap source kódját a `main.css`-be.

Lehetne a bootstrapet egyszerűen behúzni az oldalra egy cdn szerverről, viszont a felett nincs kontroll és jobb ha az oldal csak egy css fájlt tölt be és nem külön külön egyenként.
