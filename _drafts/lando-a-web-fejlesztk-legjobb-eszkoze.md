---
title: Lando, a web fejlesztők legjobb eszköze
layout: post
author: keszei
category: development
tags:
- develop
- work
- lando
image:
  thumbnail: "/assets/images/posts/lando/logo.svg"
  path: "/assets/images/posts/lando/logo.svg"
  class: bg-white p-3
---

Folyamatosan kutakodom új technológiák után ami érdekes és hasznos is egyben. Web fejlesztéshez szükséges fejlesztői eszközök tárháza szinte végtelen és nagyon nehéz megtalálni a megfelelőt ami a te fejlesztési folyamataidhoz hozzá kapcsolódik.

Mindig zavart, az hogy különböző projektek miatt váltani kell php, adatbázis valamint nodejs verziókat. Rengeteg idő ment el arra, mert valamit kifelejtettem és már nem úgy működött a rendszer ahogy kellene.

Úgy 1-2 évvel ezelőtt csináltam is magamnak docker segítségével egy jó kis fejlesztői szervert, minden projekthez külön-külön szerver, csak azokkal a beállításokkal ami a projekthez szükséges. Ezzel voltak kis problémák. Nehézkes volt egy új projekt felépítése. Nehéz volt egy kis szerver módosítást végezni rajta, mert minden egyes modositasnal újra le kell buildelni a docker image-et. Éltem ezzel egy ideig, de aztán meg találtam a szent grált miközben kutakodtam a [zsh](https://ohmyz.sh/) pluginjai közt (zsh-ról tervezek máskor írni)

{:refdef: class="text-center bg-white p-3"}
![Lando]({{ '/assets/images/posts/lando/logo.svg' | relative_url }})
{: refdef}

## Lando
A Lando saját docker image-eket használ, de lehet egyedi saját image-t használni benne. Ez adja a bájját, hogy végtelenségig lehet testreszabni. Alapja az, hogy van egy szerver ami futtatja a kódunkat. Lehet az apache, nginx vagy bármi amire szükséged van. Nem kell feltétlenül php specifikusnak lennie szervernek. 

Kezdjük az elejéről. [Feltelepíted](https://docs.lando.dev/getting-started/installation.html) a dokumentáció alapján. Innentől kezdve végig mehetsz egy egész egyszerű [tutorialon](https://docs.lando.dev/getting-started/first-app.html) ahol bemutatják az alap működését ennek az eszköznek. Részletesen nem fogok kitérni, hogy hogyan is működik mélységeibe. Nekem most egy ismertető a célom.

Ha a Lando segítségével akarok futtatni a projektemet mindig első körben megadom az feltételeket. A Landonak vannak [receptjei](https://docs.lando.dev/config/recipes.html) az olyan alkalmazások futtatására ami elterjedtek, hogy még kényelmesebb legyen egy projekt futtatása. A példánkban nem fogok recepteket használni, mert azok használatával nem lehet belelátni, hogy mégis hogyan is működik ez az eszköz.
