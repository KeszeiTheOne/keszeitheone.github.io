---
title: 'Építsd magad #3 - Deploy'
layout: post
author: keszei
---

## Van egy projektem, király, hogyan lehet kirakni valahová, hogy olvassák mások is? ##

A `jekyll` az elkészített markdown vagy html fájlokat nagyon egyszerűen betudja forgatni a végső source kódba amit már bárhová feltudunk rakni.

Csak egyszerűen meghívjuk parancssorba a következőt:

```shell
bundle exec jekyll build
```

A végrahajtás után már rendelkezésünkre is áll a `_site` mappában a felépített weboldalunk. Ezt már bárhová ki lehetne rakni.

Nekem legelső sorban a github pages-re esett a választásom, de a jövőben biztosan át térek valami más szolgáltatóhoz.

Viszont itt is meg kell odalni a kiadást. 
A legegyszerűbb módja, hogy a github repository-ban ahová toljuk fel a jekyll kódunkat, abban beállítjuk, hogy a master-ből készítsen egy github pages oldalt.
Szerencsére a github felismeri a jekyll-t és autómatikusan le build-eli nekünk a source kódott.
Viszont ezzel egy gond van. Csak a jekyll build-et futtatja és az egyéb függőségeket pedig nem. [Korábban]({% post_url 2021-09-30-epitsd_magad_2 %})
a bootstrap-et külön függőségnek telepítettem fel a bloghoz, így kiadáskor annak is le kell futnia.

A legjobb megoldás az lett, hogy egy külön git branch-be fordítom le a master-ben lévő jekyll kódott. Ehhez találtam egy deploy scripttet, ami megkönnyíti a kiadást.
Kiadás elött feltelepítem a függőségeket valamint le buildeli a script az oldalt egy külön branch-be a fájlokat. 

[Itt](https://github.com/KeszeiTheOne/keszeitheone.github.io/blob/master/deploy.sh){:target="_blank"} meg is lehet tekinteni ezt a deploy scripttet ha érdekel.

Ezzel a scripttel már kész is vagyok elég egyszerűen ki lehet adni a blogot. Viszont egy gond van vele, ami nem is akkora gond. 
Mindenképpen kell hozzá egy gazdagép ahol kellenek ezek a különböző függőségek amikkel ki lehet rakni a blogot. Gondolok itt arra, hogy 
a gazdagépnek rendelkeznie kell a következőkkel: `git`, `gem`, `bundle`, `yarn`.  A jövőben kitudja, hogy még milyen csodákkal 
lesz még tele pakolva ez a blog. Így a jövőben ezt is lehet majd optimalizálni, hogy csak egy gomb nyomás legyen valahol és már a deploy script 
kirakja a legfrissebb változatát a blognak.
