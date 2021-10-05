---
layout: post
author: keszei
title: "Építsd magad #2 - Sass rejtelmei"
---

## Mire jó egy blog egy valamire való dizájn nélkül? ##

Mint ahogy az előző posztomban mutattam a képet, jelenleg egy sima html oldal jelenik meg. Ez elég vacak egy kinézet, valahogy
felkéne turbózni. Viszont a helyzet a következő: nagyon keveset értek a jó dizájnhoz. Én inkább a backend oldalon vagyok magabiztos, de azért a frontend se áll tőlem messze. Bootstrap-et is egész jól ismerem. Egy nagyon jó css "keretrendszer". A jekyll szerencsére alapjáraton kezeli a `sass` fájl konvertálást, szóval csak egyszerűen bele kell forgatni a bootstrap source kódját a `main.css`-be.

Lehetne a bootstrap-et egyszerűen behúzni az oldalra egy cdn szerverről, viszont a felett nincs kontroll. Jobban szeretem a saját oldalamon tudni a saját fájljaimat. Régen `bower` csomag kezelőt használtam arra, hogy letöltsem a bootstrap-et, de az már elavult és már nem is támogatott. ami a munkahelyemen bevált az a `yarn`.

A `yarn` pontosan ugyan olyan csomag kezelő eszköz mint a `bower` (sőt a maga a bower ajánlotta ezt maga helyett), vagy mint az `npm`. A `yarn` eredetileg ugyan úgy a `node_modules` mappába teszi a letöltött vendor fájlokat, viszont ennek a helyét meg lehet változtatni a `.yarnrc` fájlban ha csak annyit írsz be, hogy:

```shell
--modules-folder ./_vendor
```

Innentől kezdve a megadott mappába fogja letölteni a fájljaid. Csak egy nagyon egyszerű parancssal le is töltöttem a bootstrap 4-et:

```shell
yarn install bootstrap@4
```

Ezek után már elérhető is volt a projekt fájlok között a bootstrap. Viszont, hogy húzzuk be a blogba?

Ugye a `jekyll`-nek alapjáraton bele van építve a `sass` fordítás, valahogy bele kell varázsolni a `main.scss`-be a bootstrap-et. Kis utána járás után meg is találtam a megoldást erre a fejtörőre. A `jekyll` config fájljába megkell adni, hogy máshol is vannak scss fájlok. Így hozzá adtam a `_config.yml` fájlhoz a következőt:

```yaml
sass:
  load_paths:
    - _sass
    - _vendor/bootstrap
```

Majd ezek után egy egyszerű húzással importálni kell a `styles.scss`-be, így:

```scss
@import "scss/bootstrap"
```

A végén csak le kell build-elni a blogot, és már készen is áll a csodálatos bootstrap a blogban. Igaz még csak `javascript` nélkül, de idővel arra is találok valami megoldást.

Következőleg a "kiadással" kapcsolatban lesznek gondolat meneteim.
