---
title: Lando, a web fejlesztők legjobb eszköze
layout: post
author: keszei
category: development
tags:
- develop
- work
- lando
- devops
- tutorial
image:
  thumbnail: "/assets/images/posts/lando/logo.svg"
  path: "/assets/images/posts/lando/lando_masthead.jpg"
  class: bg-white p-3
---

Folyamatosan kutakodom új technológiák után ami érdekes és hasznos is egyben. Web fejlesztéshez szükséges fejlesztői eszközök tárháza szinte végtelen és nagyon nehéz megtalálni a megfelelőt ami a te fejlesztési folyamataidhoz hozzá kapcsolódik.

Mindig zavart, az hogy különböző projektek miatt váltani kell php, adatbázis valamint nodejs verziókat. Rengeteg idő ment el arra, mert valamit kifelejtettem és már nem úgy működött a rendszer ahogy kellene.

Úgy 1-2 évvel ezelőtt csináltam is magamnak docker segítségével egy jó kis fejlesztői szervert, minden projekthez külön-külön szerver, csak azokkal a beállításokkal ami a projekthez szükséges. Ezzel voltak kis problémák. Nehézkes volt egy új projekt felépítése. Nehéz volt egy kis szerver módosítást végezni rajta, mert minden egyes módositásnal újra le kell buildelni a docker image-et. Éltem ezzel egy ideig, de aztán meg találtam a szent grált miközben kutakodtam a [zsh](https://ohmyz.sh/) pluginjai közt (zsh-ról tervezek máskor írni)

{:.text-center .bg-white .p-3}
![Lando]({{ 'assets/images/posts/lando/logo.svg' | relative_url }})

## Lando
Nem, nem a Star Wars Lando-ról van szó, habár én is pont emiatt figyeltem fel annó rá.

{:.text-center}
![Not Star Wars Lando]({{ 'assets/images/posts/lando/not_starwars_lando.gif' | relative_url }})
{: refdef}

A Lando saját docker image-eket használ, de lehet egyedi saját image-t használni benne. Ez adja a báját, hogy végtelenségig lehet testreszabni. Alapja az, hogy van egy szerver ami futtatja a kódunkat. Lehet az apache, nginx vagy bármi amire szükséged van. Nem kell feltétlenül php specifikusnak lennie szervernek (Erről lesz később példa is).

Kezdjük az elejéről. [Feltelepíted](https://docs.lando.dev/getting-started/installation.html) a dokumentáció alapján. Innentől kezdve végig mehetsz egy egész egyszerű [tutorialon](https://docs.lando.dev/getting-started/first-app.html) ahol bemutatják az alap működését ennek az eszköznek. Részletesen nem fogok kitérni, hogy hogyan is működik mélységeibe. Nekem most egy ismertető a célom.

Ha a Lando segítségével akarom futtatni a projektemet mindig első körben megadom az feltételeket. A Landonak vannak [receptjei](https://docs.lando.dev/config/recipes.html) az olyan alkalmazások futtatására ami elterjedtek, hogy még kényelmesebb legyen egy projekt futtatása. A példánkban nem fogok recepteket használni, mert azok használatával nem lehet belelátni, hogy mégis hogyan is működik ez az eszköz.

Vegyünk egy symfony projektet. Mi kell alap esetben hozzá? Kell egy valamilyen szerver, mint például apache.  Ezt felvesszük  a `._lando.yml` fájlunkba a következő képpen:

```yaml
name: demo

proxy:
  appserver:
    - demo.lndo.site

services:
  appserver:
    type: php:7.4
    webroot: ./public
    ssl: true
```

Ez után csak lekell futtatnunk a `lando start` parancsot és a folyamat végén el is érhető a projektünk. A Lando csinál local domaint, ssl-t mindent is. A projektünket a [https://demo.lndo.site](https://demo.lndo.site) linken fogjuk tudni elérni.

## Tooling
Ami még nagyon hasznos a Landoban, hogy a projekthez szükséges parancsokat nem kell a host gépeden futtatni, hanem egy egyszerű lépéssel már a docker containerbe futtathatod. Ezzel nem kell feltelepítve lennie semmilyen alkalmazásnak a gazdagépen. Elég ha a container-ben telepítjük fel őket egy direkt specifikus verzión. Tegyük fel én a projektemhez szeretnék [yarn](https://yarnpkg.com/) package managert használni, de a gépemre nincs feltelepítve a NodeJS. Csupán ennyit kell módosítanom a konfiguráción:

```yaml
name: demo

proxy:
  appserver:
    - demo.lndo.site

services:
  appserver:
    type: php:7.4
    webroot: ./public
    ssl: true
    build_as_root:
      - curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
      - apt-get install -y nodejs
      - npm install --global yarn

tooling:
  yarn:
    service: appserver
    cmd: yarn
```

Egy gyors `lando rebuild -y` parancs után már rendelkezésre is áll a projektünkben a yarn. Csupán a szokványos yarn parancsaink elé be kell szurnunk a `lando` parancsot, és onnantól kezdve a projektünk container-ében futtatja a scriptet amit akartunk, pl.: `lando yarn add vue`.

A tooling parancsokat nagyon mélyre menőleg lehet testreszabni, mint ahogy a [dokumentáció](https://docs.lando.dev/config/tooling.html) is írja.

### Végszó

Szerintem alapjába véve ezek miatt nagyon erős tool a Lando. Csapatban még inkább ajánlatos használni, mert mindenkinek ugyan az a fejlesztői környezete lesz és az sokat számíthat. Én ma már ha új projektett kezdek el akkor csak Lando segítségével. Mint ahogy ezt a blogot is Landoval futtatom, mert nem akartam külön rengeteg mindent feltelepíteni, ahhoz hogy használni tudjam a Jekyll-t. Csak lehúztam a docker image-et és elindítottam. Alább meg is osztottam a jelenlegi változatát a blog Lando configjáról. 

Nagyon szépen köszönöm, hogy idáig elolvastad. Remélem meghoztam a kedved ennek a remek fejlesztői eszköznek a használatára. 

Tscháó! ;)

{:.text-center}
![Lando bye]({{ 'assets/images/posts/lando/lando_bye.gif' | relative_url }})

```yaml
name: keszeiblog

proxy:
  appserver:
    - keszeiblog.lndo.site:4000

services:

  appserver:
    type: compose
    app_mount: false
    scanner: false
    ssl: true
    moreHttpPorts:
      - '4000'
    build_as_root:
      - apk add nodejs npm
      - npm install --global yarn
    services:
      image: jekyll/jekyll:4
      command: jekyll serve
      ports:
        - '4000'
      working_dir: /app
      environment:
        JEKYLL_ENV: development
      volumes:
        - $PWD:/app

tooling:

  jekyll:
    service: appserver
    command: jekyll
    user: jekyll

  yarn:
    service: appserver
    cmd: yarn
    user: jekyll
```
