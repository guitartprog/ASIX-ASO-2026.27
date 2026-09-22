# Fitxa 1 — Anàlisi inicial de MusicCloud

## Objectiu

MusicCloud necessita reorganitzar la seva infraestructura informàtica. Abans d'instal·lar o configurar cap servei, cal entendre:

- qui treballa a l'empresa;
    
- quines funcions té cada persona;
    
- quins recursos existeixen;
    
- qui necessita accedir a cada recurs;
    
- com podem gestionar aquests accessos de manera eficient.
    

---


# 1. Conèixer MusicCloud

Consulta la informació disponible sobre els departaments, treballadors i perfils d'usuari de MusicCloud.

Completa la taula següent.


| Persona          | Departament       | Funció / responsabilitat                         | Necessita privilegis especials? Per què?                                                                                                                                                  |
| ---------------- | ----------------- | ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Aina Ciurans     | Direcció          | Treballadora de Direcció                         | No necessàriament. Necessita accés als recursos propis de Direcció, però no privilegis d'administració del sistema.                                                                       |
| Rut Tornil       | Direcció          | Treballadora de Direcció                         | No necessàriament. Necessita accés als recursos propis de Direcció, però no privilegis d'administració del sistema.                                                                       |
| Dídac Gassó      | Administració     | Usuari estàndard d'Administració                 | No. Ha de tenir els permisos corresponents al seu departament.                                                                                                                            |
| Laia Macias      | Administració     | Responsable del departament d'Administració      | Sí. Necessita accés específic a gestio_departament i permisos superiors als usuaris estàndard del departament.                                                                      |
| Estel Birosta    | Suport tècnic     | Usuari estàndard de Suport tècnic                | No. Té els permisos del seu departament.                                                                                                                                                  |
| Aina Zuriguel    | Suport tècnic     | Usuària estàndard de Suport tècnic               | No. Té els permisos del seu departament.                                                                                                                                                  |
| Lluïsa Richart   | Suport tècnic     | Responsable del departament de Suport tècnic     | Sí Necessita accés específic a gestio_departament i capacitat de gestionar els recursos del seu departament.                                                                       |
| Roser Alberch    | Producció musical | Usuària estàndard de Producció musical           | No. Té els permisos corresponents al seu departament.                                                                                                                                     |
| Guillem Adella   | Producció musical | Usuari estàndard de Producció musical            | No. Té els permisos corresponents al seu departament.                                                                                                                                     |
| Meritxell Reglat | Producció musical | Responsable del departament de Producció musical | Sí. Necessita accés específic a gestio_departament i permisos superiors als usuaris estàndard.                                                                                      |
| Alícia Monclús   | Producció musical | Usuària estàndard de Producció musical           | No. Té els permisos corresponents al seu departament.                                                                                                                                     |
| Carles Molins    | Producció musical | Usuari estàndard de Producció musical            | No. Té els permisos corresponents al seu departament.                                                                                                                                     |
| Eulàlia Galcera  | Producció musical | Usuària estàndard de Producció musical           | No. Té els permisos corresponents al seu departament.                                                                                                                                     |
| Talia Costas     | Informàtica       | Usuària d'Informàtica                            | Sí. Té privilegis d'administració per gestionar usuaris, grups, permisos, serveis, servidors, logs, backups i altres tasques d'administració. |
| Alex Soriano     | Informàtica       | Usuari d'Informàtica                             | Sí. Té privilegis d'administració per gestionar usuaris, grups, permisos, serveis, servidors, logs, backups i altres tasques d'administració.  |
| Pere Espinalt    | Extern            | Usuari extern                                    | No. Ha de tenir únicament els accessos temporals o específics que necessiti.                                                                                                          |
| Neus Bages       | Extern            | Usuària externa                                  | No. Ha de tenir únicament els accessos temporals o específics que necessiti.                                                                                                          |


### 1.1. Reflexió

Quines diferències observes entre un **treballador**, un **departament** i una **funció o responsabilitat**?

---

Molt simple, un treballador és una persona concreta que treballa a MusicCloud. 

En canvi un departament és una agrupació organitzativa de treballadors que realitzen funcions relacionades, com Administració, Informàtica o Producció musical. 

Per altre banda, una funció o responsabilitat determina què fa una persona dins del seu departament. Per exemple, Laia Macias pertany a Administració, però a més té la responsabilitat de ser la cap del departament.

---

Hi ha persones que, pel seu càrrec o funció, necessiten accessos diferents dels altres membres del seu departament?

**X** Sí  
☐ No

Posa'n algun exemple:

---

**Per exemple**, Laia Macias pertany a Administració igual que Dídac Gassó, però és la responsable del departament. Per aquest motiu té accés a gestio_departament, mentre que Dídac no hi hauria de tenir accés.

---

# 2. Recursos de l'empresa

Analitza l'estructura d'informació de MusicCloud.

Classifica alguns dels recursos següents segons la seva finalitat.



| Recurs | Qui creus que l'hauria d'utilitzar?| Per a què? |
| - | - | - |
| `/empresa/comu/intercanvi` | Tots els treballadors i externs quan sigui necessari | Intercanviar temporalment documents, especialment amb usuaris externs. |
| `/empresa/comu/comunicats` | Treballadors de l'empresa  (Els externs NO)| Consultar comunicats i informació general de MusicCloud.  |
| `/empresa/departaments/administracio/compartida`  | Usuaris d'Administració   | Treballar amb els documents compartits del departament. |
| `/empresa/departaments/administracio/gestio_departament` | Laia Macias, Cap de administració  | Gestionar documentació i informació reservada a la responsable del departament.  |
| `/empresa/projectes/campanya_estiu`  | Membres assignats al projecte  | Treballar amb els fitxers específics de la campanya sense necessitat de canviar de departament. |
| `/empresa/administracio_sistema/backups`   | Personal amb funcions d'administració del sistema    | Gestionar les còpies de seguretat dels sistemes.    |


# 3. Qui ha de poder fer què?

Per a cada situació, indica quin nivell d'accés consideres adequat.

Utilitza:

- **NA** → sense accés
    
- **L** → lectura
    
- **L/E** → lectura i escriptura
    
- **ADM** → administració
    

No busquis encara una solució tècnica. Pensa només en les necessitats de l'empresa.

| Situació | Accés proposat | Justificació |
| - | - | - |
| Dídac accedeix a la carpeta compartida d'Administració | **L/E** | És membre d'Administració i necessita treballar amb els documents compartits del departament.                                                                          |
| Laia accedeix a la gestió del departament d'Administració | **L/E** | És la responsable del departament i la documentació estableix R: L/E.|| Pere, treballador extern, accedeix als comunicats interns | **NA** | Els externs no tenen accés als comunicats interns segons la matriu d'accessos. |
| Talia accedeix als backups del sistema | **ADM** | La matriu indica ADM per a Informàtica. Tot i això, tècnicament aquest privilegi s'hauria d'assignar només al personal que tingui realment funcions d'administració. |
| Un membre de Producció musical accedeix a la carpeta d'Administració | **NA**  | No necessita accedir als recursos interns d'un altre departament. |
| Un participant de campanya_estiu accedeix als fitxers del projecte | **SP** | L'accés està determinat per la participació en el projecte, no pel departament d'origen.  |

---

# 4. Primer problema: com assignem els permisos?

Imagina que MusicCloud té només quatre treballadors:

- Anna
    
- Biel
    
- Carla
    
- David
    

Tots quatre treballen al mateix departament i necessiten accedir a la mateixa carpeta.

Una possible solució seria configurar:

```text
Anna  → lectura/escriptura
Biel  → lectura/escriptura
Carla → lectura/escriptura
David → lectura/escriptura
```

### 4.1.

**Què passaria si l'empresa tingués **100 treballadors** amb el mateix tipus d'accés?**

---
Si hi hagués 100 treballadors amb el mateix tipus d'accés, assignar els permisos individualment seria molt poc eficient.

L'administrador hauria de configurar i mantenir els permisos de 100 comptes. Això augmentaria la possibilitat d'errors i faria més difícil comprovar qui té accés a cada recurs.

---

### 4.2.

**Què passaria cada vegada que s'incorporés una persona nova?**

---
Cada vegada que s'incorporés una persona nova, l'administrador hauria de revisar manualment tots els permisos que necessita.

Això faria que l'alta d'usuaris fos més lenta i podria provocar que un usuari tingués permisos incorrectes o que se n'oblidés algun.

---

### 4.3.

**Què passaria quan una persona canviés de departament?**

---
Quan una persona canviés de departament, caldria eliminar manualment els permisos antics i afegir els nous.

A més, si s'oblidés algun permís anterior, l'usuari podria conservar accés a informació del seu antic departament.

---

### 4.4.

**Proposa una manera de gestionar aquestes persones conjuntament.**

No cal que coneguis encara el nom tècnic de la solució.

---
Una manera més eficient seria crear un grup amb les persones que necessiten els mateixos permisos.
Els permisos s'assignarien al grup en lloc de fer-ho persona per persona.
També podríem organitzar els usuaris dins d'una unitat organitzativa segons el seu departament.
Així, seria més fàcil gestionar les altes, baixes i canvis de departament.
D'aquesta manera reduïm errors i facilitem l'administració del sistema.

---

# 5. Canvis a MusicCloud

Ara es produeixen aquests tres canvis:

### Cas A

Dídac deixa Administració i passa a Producció musical.

---
**Quins accessos hauria de perdre?**

---
Hauria de perdre els accessos associats al departament d'Administració, inclòs l'accés a les seves carpetes compartides i documentació interna.

També s'hauria de revisar qualsevol accés addicional que tingués per la seva antiga funció.

---
**Quins accessos hauria d'obtenir?**

---
Els corresponents a un usuari estàndard de Producció musical, incloent-hi els recursos compartits del nou departament.

No conservaria automàticament els permisos d'Administració.
---

### Cas B

S'incorpora una nova treballadora al departament d'Administració.

---
**Quins accessos caldria configurar?**

---
Caldria:

Crear el seu compte d'usuari.
Assignar-la al departament d'Administració.
Donar-li els accessos corresponents a un usuari estàndard del departament.
Crear la seva carpeta personal.
Comprovar que no tingui permisos sobre recursos que no necessita.

No se li donarien automàticament els permisos de responsable del departament.

---

---

### Cas C

Pere Espinalt deixa de col·laborar amb MusicCloud.

---

**Què hauríem de fer amb els seus accessos?**

---
Caldria revocar els seus accessos als recursos de MusicCloud i impedir que el seu compte pugui continuar accedint als sistemes.

També s'hauria de revisar qualsevol accés temporal que se li hagués concedit i conservar, si correspon segons les polítiques de l'empresa, el registre de les seves actuacions.

---

---

# 6. Busquem una solució millor

Suposa ara que podem crear conjunts de persones que comparteixen unes mateixes necessitats d'accés.

Per exemple:

```text
Administració
    ├── Dídac
    ├── Laia
    └── Roser
```

I podem donar permisos directament al conjunt:

```text
Administració → carpeta_administracio → L/E
```

### 6.1.

**Quin avantatge té aquesta solució respecte a donar permisos persona per persona?**

---
L'avantatge principal és que els permisos es gestionen de manera centralitzada.

En comptes de modificar els permisos de cada persona, podem modificar el conjunt de persones que té accés.

Això redueix la feina administrativa, facilita les altes i baixes i disminueix el risc d'errors.
---

### 6.2.

**Si Dídac passa d'Administració a Producció musical, què caldria modificar?**

---
Si Dídac passa d'Administració a Producció musical, caldria treure'l del conjunt d'Administració i incorporar-lo al conjunt de Producció musical.

Els permisos es modificarien com a conseqüència d'aquest canvi.
---

### 6.3.

**Com anomenaries aquests conjunts de persones?**

---
Aquests conjunts de persones s'anomenarien grups.

---

# 7. Primera proposta per a MusicCloud

A partir de l'organització de l'empresa, proposa els primers conjunts de persones que crearies.

**No cal trobar encara la solució definitiva.**
| Nom proposat | Qui hi pertanyeria? | Per què existeix aquest conjunt?|
| - | - | - |
| `GG_Direccio`| Aina Ciurans, Rut Tornil | Agrupar els treballadors de Direcció.|
| `GG_Administracio`| Dídac Gassó, Laia Macias| Gestionar els recursos generals d'Administració.|
| `GG_Administracio_Responsable`| Laia Macias | Donar els permisos específics de responsable. |
| `GG_SuportTecnic` | Estel Birosta, Aina Zuriguel, Lluïsa Richart | Gestionar els recursos generals de Suport tècnic.|
| `GG_SuportTecnic_Responsable`| Lluïsa Richart | Donar els permisos específics de responsable. |
| `GG_ProduccioMusical`| Roser, Guillem, Meritxell, Alícia, Carles, Eulàlia | Gestionar els recursos generals de Producció musical. |
| `GG_ProduccioMusical_Responsable` | Meritxell Reglat| Donar els permisos específics de responsable. |
| `GG_Informatica`| Talia Costas, Alex Soriano| Agrupar els usuaris del departament d'Informàtica. |
| `GG_Externs`| Pere Espinalt, Neus Bages| Gestionar els accessos limitats dels usuaris externs. |


---

# 8. Cas que complica el model

Laia treballa al departament d'Administració, però també és la responsable del departament.

És suficient que pertanyi només al conjunt `Administració`?

☐ Sí  
**X** No

Per què?

---
Laia és membre d'Administració, però també és responsable del departament. Per tant, necessita permisos diferents dels d'un usuari estàndard d'Administració.

---

Quina possible solució proposes?

---

Fer que Laia pertanyi a:

    GG_Administracio
            +
    GG_Administracio_Responsable

D'aquesta manera, heretaria els permisos normals d'Administració i, a més, els permisos específics de responsable.

---

# 9. Un altre cas

Diverses persones de departaments diferents participen temporalment en el projecte:

```text
Campanya Estiu
```

Creus que hauríem de canviar-les de departament?

☐ Sí  
 No

Si no, com podríem donar-los accés als recursos del projecte?

---

El projecte no modifica el departament al qual pertany una persona. La solució seria crear un conjunt específic per al projecte, per exemple:

    GG_Projecte_CampanyaEstiu

I afegir-hi temporalment les persones que participen en el projecte.

D'aquesta manera, podem donar accés a:

    /empresa/projectes/campanya_estiu

només als participants, independentment del seu departament.

Quan el projecte finalitzi, es pot retirar l'accés eliminant els participants del conjunt.

---

# 10. Conclusions

Completa les frases amb les teves paraules.

### Usuari

Un usuari representa una persona que necessita identificar-se davant del sistema per poder utilitzar els recursos de MusicCloud.

---

### Recurs

Un recurs és un element del sistema al qual es pot donar o restringir l'accés, com una carpeta, un fitxer o un servei.

---

### Permís

Un permís determina què pot fer un usuari sobre un recurs, per exemple llegir-lo, modificar-lo o administrar-lo.

---

### Grup

Un grup serveix per agrupar usuaris amb necessitats d'accés similars i gestionar els permisos de manera conjunta.

---

---

# 11. Regla de mínim privilegi

**Analitza aquesta afirmació:**

> Un usuari només hauria de tenir els permisos estrictament necessaris per realitzar la seva feina.

Explica amb les teves paraules què significa.

---
La regla de mínim privilegi significa que cada usuari ha de disposar únicament dels permisos necessaris per poder realitzar correctament la seva feina.

No s'han de donar permisos addicionals simplement perquè siguin còmodes.

---

**Posa un exemple relacionat amb MusicCloud.**

---

Un membre de Producció musical necessita accedir a les carpetes del seu departament, però no necessita accedir a la documentació interna d'Administració.

Per tant:

    Producció musical → accés necessari
    Administració      → NA

Un altre exemple encara més sensible seria la carpeta:

    /empresa/administracio_sistema/backups

No s'hauria de donar accés administratiu a qualsevol treballador d'Informàtica només pel fet de pertànyer al departament. El privilegi ha d'estar justificat per la seva funció.

---

# 12. Pregunta final

Imagina que demà MusicCloud passa de 14 treballadors a 500.

Quina de les dues estratègies consideres més adequada?

☐ Assignar permisos individualment a cada usuari.

**X** Organitzar els usuaris segons les seves necessitats i assignar permisos a aquests conjunts.

Justifica la resposta.

---

A mesura que MusicCloud creix, gestionar els permisos individualment es torna cada vegada més complex.

En canvi, si organitzem els usuaris segons departament, responsabilitat i projectes, els permisos es poden gestionar de manera centralitzada.

Per exemple:

    GG_Administracio
            ↓
    recursos d'Administració
            ↓
            L/E

Si una persona entra a Administració, s'incorpora al conjunt corresponent. Si marxa del departament, se'n retira.

Això facilita la gestió i redueix el risc de mantenir permisos que ja no corresponen a les funcions de l'usuari.

---

