# Fitxa 2 — Organització del servei de directori de MusicCloud

## Objectiu

En aquesta sessió hem decidit com organitzar els diferents objectes de MusicCloud dins d'un servei de directori.

Aquesta fitxa forma part de la **documentació de disseny del sistema**. Les decisions que hi indiquis s'utilitzaran posteriorment durant la implantació.
# 1. Objectes que hem de gestionar

MusicCloud necessita gestionar de manera centralitzada diferents tipus d'objectes.

Indica quins tipus d'objectes consideres que ha de contenir el servei de directori.

|Tipus d'objecte|Exemples a MusicCloud|
|---|---|
| Usuaris | Aina Ciurans, Rut Tornil, Dídac Gassó, Laia Macias i la resta de treballadors i usuaris externs. |
| Grups | Administració, Direcció, Suport tècnic, Producció musical, Informàtica i grups de responsables. |
| Equips | Ordinadors dels treballadors de MusicCloud. |
| Servidors | Servidor de directori, servidor de fitxers i servidors que allotgin serveis de l'empresa. |
| Comptes d'aplicacions o serveis | Comptes utilitzats per serveis de còpies de seguretat, aplicacions o altres processos automatitzats. |


Hi afegiries algun altre tipus d'objecte?

---

---

# 2. Organització mitjançant unitats organitzatives

Proposa les **unitats organitzatives (OU)** principals que utilitzaries a MusicCloud.

| OU | Què contindrà? | Per què la crees? |
|---|---|---|
| Usuaris | Comptes dels treballadors i usuaris externs. | Organitzar els comptes de les persones de l'empresa. |
| Grups | Grups de departaments, responsables i projectes. | Centralitzar i organitzar els grups d'usuaris. |
| Equips | Comptes dels ordinadors clients. | Facilitar l'administració i la configuració dels equips. |
| Servidors | Comptes dels servidors de MusicCloud. | Separar els servidors dels ordinadors clients i facilitar-ne l'administració. |
| Serveis | Comptes d'aplicacions i serveis. | Separar els comptes tècnics dels comptes personals. |


## 2.1. Organització dels usuaris

Dibuixa l'estructura que utilitzaries per organitzar els usuaris de MusicCloud.

```text
MusicCloud
│
└── Usuaris
    ├── Direccio
    ├── Administracio
    ├── SuportTecnic
    ├── ProduccioMusical
    ├── Informatica
    └── Externs
```
---

# 3. OU o grup?

Indica quina opció utilitzaries principalment en cada cas.

|Necessitat|OU|Grup|
|---|:-:|:-:|
|Organitzar els treballadors d'Administració|**X**|☐|
|Donar accés a la carpeta d'Administració|☐|**X**|
|Organitzar els ordinadors clients|**X**|☐|
|Identificar les persones que participen en Campanya Estiu|☐|**X**|
|Organitzar els servidors|**X**|☐|
|Donar privilegis als administradors del sistema|☐|**X**|
|Organitzar els comptes utilitzats per aplicacions|**X**|☐|

### Explica amb les teves paraules la diferència principal entre una OU i un grup.

**OU:**

---
Una unitat organitzativa serveix per organitzar els objectes del directori en una estructura jeràrquica.

Permet separar usuaris, equips i altres objectes segons les necessitats d'administració.

---

**Grup:**

---
Un grup serveix per reunir usuaris que comparteixen necessitats d'accés o permisos.

Permet assignar permisos als recursos de manera conjunta sense haver de configurar cada usuari individualment.

---

---

# 4. Un mateix usuari: ubicació i pertinença

Considera aquest cas:

**Dídac Gassó**

- treballa a Administració;
    
- participa en el projecte Campanya Estiu.
    

Indica:

**En quina OU ubicaries el seu compte?**

---
A la OU:

    MusicCloud/Usuaris/Administracio

---

**A quins grups podria pertànyer?**

---
Podria pertanyer a els grups:

    GG_Administracio

    GG_Projecte_CampanyaEstiu
---

### Per què no és contradictori que estigui en una OU però pertanyi a diversos grups?

---

No és contradictori perquè la OU indica on està organitzat el compte dins del directori, mentre que els grups indiquen a quins recursos pot accedir.

Dídac continua pertanyent a Administració, però també pot formar part del grup del projecte Campanya Estiu sense canviar de departament.

---

# 5. Servei de directori

**Explica breument què entens per servei de directori**.

---
És un servei que permet emmagatzemar, organitzar i gestionar de manera centralitzada la informació dels usuaris, grups, equips i altres objectes d'una empresa.

---

**Quin problema resol a MusicCloud?**

---

Permet administrar els comptes i els accessos de tots els treballadors des d'un únic sistema.

Això facilita la gestió de permisos, les altes i baixes d'usuaris i l'organització dels recursos de l'empresa.

---

# 6. LDAP

Completa les frases següents.

**LDAP és:**

---
Un protocol que permet accedir, consultar i modificar informació emmagatzemada en un servei de directori, segons els permisos corresponents.

---

**LDAP no és:**

---
No és un servei de directori concret ni és sinònim d'Active Directory. És un protocol que poden utilitzar diferents serveis de directori.

---

Indica si les afirmacions són certes o falses.

|Afirmació|C|F|
|---|:-:|:-:|
|LDAP és sinònim d'Active Directory|☐|**X**|
|LDAP permet accedir i consultar informació d'un directori|**x**|☐|
|OpenLDAP és una implementació d'un servei de directori|**X**|☐|
|Active Directory utilitza LDAP, entre altres tecnologies|**X**|☐|

---

# 7. DIT de MusicCloud

Dibuixa la proposta final de **Directory Information Tree (DIT)** de MusicCloud.

Ha de mostrar, com a mínim:

- usuaris;
    
- grups;
    
- equips;
    
- servidors;
    
- comptes d'aplicacions o serveis;
    
- les subdivisions que consideris necessàries.
    

```text
MusicCloud
│
└── dc=musiccloud,dc=local
    │
    ├── ou=Usuaris
    │   ├── ou=Direccio
    │   │   ├── Aina Ciurans
    │   │   └── Rut Tornil
    │   │
    │   ├── ou=Administracio
    │   │   ├── Dídac Gassó
    │   │   └── Laia Macias
    │   │
    │   ├── ou=SuportTecnic
    │   │   ├── Estel Birosta
    │   │   ├── Aina Zuriguel
    │   │   └── Lluïsa Richart
    │   │
    │   ├── ou=ProduccioMusical
    │   │   ├── Roser Alberch
    │   │   ├── Guillem Adella
    │   │   ├── Meritxell Reglat
    │   │   ├── Alícia Monclús
    │   │   ├── Carles Molins
    │   │   └── Eulàlia Galcera
    │   │
    │   ├── ou=Informatica
    │   │   ├── Talia Costas
    │   │   └── Alex Soriano
    │   │
    │   └── ou=Externs
    │       ├── Pere Espinalt
    │       └── Neus Bages
    │
    ├── ou=Grups
    │   ├── GG_Direccio
    │   ├── GG_Administracio
    │   ├── GG_Administracio_Responsable
    │   ├── GG_SuportTecnic
    │   ├── GG_SuportTecnic_Responsable
    │   ├── GG_ProduccioMusical
    │   ├── GG_ProduccioMusical_Responsable
    │   ├── GG_Informatica
    │   ├── GG_Externs
    │   └── GG_Projecte_CampanyaEstiu
    │
    ├── ou=Equips
    │   ├── ou=Portatils
    │   ├── ou=Sobretaula
    │   ├── ou=Mobils
    │   ├── ou=Servidors
    │   ├── ou=DispositiusXarxa
    │   │   ├── Routers
    │   │   ├── Switches
    │   │   └── Firewalls
    │   ├── ou=Emmagatzematge
    │   │   └── NAS
    │   ├── ou=Alimentacio
    │   │   └── SAI
    │   └── ou=Impressores
    │
    └── ou=Serveis
        ├── ComptesAplicacions
        └── ComptesServeis
```

---

# 8. Justificació del disseny

Escull **dues decisions** del teu DIT que consideris importants i justifica-les.

### Decisió 1

---

**Justificació:**

---

---

### Decisió 2

---

**Justificació:**

---

---

---

# 9. Comprovació final

Respon breument.

### a) Per què no seria una bona idea guardar tots els usuaris, grups, equips i servidors al mateix nivell sense organitzar-los?

---

---

### b) Per què no hauríem d'utilitzar les OU per substituir els grups de permisos?

---

---

### c) Si MusicCloud passa de 14 a 500 treballadors, quina característica del disseny que has fet avui facilitarà més l'administració?

---

---

---

# Documentació final del sistema

A partir de les decisions preses durant la sessió, deixa definida la proposta que utilitzarem inicialment per a MusicCloud.

## Estructura d'unitats organitzatives

```text
MusicCloud
│
│
│
│
```

## Criteri utilitzat per organitzar els objectes

---

---

## Criteri utilitzat per diferenciar OU i grups
