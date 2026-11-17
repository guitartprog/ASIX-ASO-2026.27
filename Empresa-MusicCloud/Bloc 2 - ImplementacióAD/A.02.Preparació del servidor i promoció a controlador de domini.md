# Pràctica

## Objectiu

Preparar el servidor `MC-DC01` i promocionar-lo com a primer controlador de domini del domini `musiccloud.local`.
## Escenari

L’empresa **MusicCloud** vol iniciar la implantació d’Active Directory Domain Services.

El servidor Windows Server que s’utilitzarà com a controlador de domini serà:
```text
MC-DC01
```
El domini que es crearà serà:
```text
musiccloud.local
```
Aquest servidor també proporcionarà el servei DNS del domini.
## Tasques

### Part 1. Configuració inicial del servidor

Configureu el servidor perquè compleixi els requisits següents:

| Element           | Valor              |
| ----------------- | ------------------ |
| Nom del servidor  | `MC-DC01`        |
| Adreça IP         | fixa               |
| DNS preferit      | el mateix servidor |
| Connexió de xarxa | operativa          |
| Zona horària      | correcta           |
| Hora del sistema  | correcta           |
La configuració IP concreta dependrà de la xarxa del laboratori. Anoteu els valors utilitzats.

Completeu la taula següent:

| Paràmetre        | Valor configurat |
| ---------------- | ---------------- |
| Adreça IP        | *192.168.56.56*  |
| Màscara          | *255.255.255.0*  |
| Porta d’enllaç   |  *192.168.56.1*  |
| DNS preferit     |  *8.8.8.8*       |
| Nom del servidor |   *MC-DC01*      |

### Part 2. Instal·lació del rol AD DS

Localitzeu i utilitzeu el procediment adequat per instal·lar el rol AD DS i promocionar el servidor a controlador de domini. Documenteu breument les comandes o passos utilitzats.

> Primer el que he executat ha sigut per insatalar el rol desde powershell ha sigut: Install-WindowsFeature -Name AD-Domain-Services  -IncludeManagementTools

>Seguidament amb: Get-WindowsFeature AD-Domain-Services he comprovat que se ha instal·lat correctament

### Part 3. Promoció a controlador de domini
Promocioneu el servidor a controlador de domini amb les opcions següents:

| Opció                                  | Valor              |
| -------------------------------------- | ------------------ |
| Tipus d’implantació                    | Crear un nou bosc  |
| Nom del domini arrel                   | `musiccloud.local` |
| Servidor DNS                           | Sí                 |
| Catàleg global                         | Sí                 |
| Nom NetBIOS                            | `MUSICCLOUD`       |
| Controlador de domini de només lectura | No                 |
| Reinici final                          | Sí                 |
Definiu una contrasenya segura per al mode de restauració de serveis de directori.

>Seguidament per a promocionaer el servidor com a controlador de domini he utilitzat: 
Install-ADDSForest `
-DomainName "musiccloud.local" `
-DomainNetbiosName "MUSICCLOUD" `
-InstallDNS `
-CreateDNSDelegation:$false `
-NoGlobalCatalog:$false `
-ReadOnlyReplica:$false `
-Force

>Contrasenya segura: Patata123

### Part 4. Verificació

Després del reinici, comproveu:

1. Que el servidor s’anomena `MC-DC01`.
>Ho he comprovat  fent un "hostname"
    
2. Que el domini `musiccloud.local` existeix.
"
>Ho he comprovat fent un Get-ADDomain    
3. Que el servidor és controlador de domini.
> HO he fet amb Get-ADDomainController
    
4. Que el servei DNS està instal·lat.
>Ho he fet amb Get-WindowsFeature DNS
    
5. Que el DNS resol correctament el domini.
>Ho he fet amb: Resolve-DnsName musiccloud.local
    
    
Completeu la taula següent. Adjunta la comanda que has utilitzat per a cada una de les comprovacions.
d
| Comprovació                          | Resultat |
| ------------------------------------ | -------- |
| Nom del servidor *fet amb hostname*                    |   MC-DC01       |
| IP fixa configurada *Fet amb Get-NetIPConfiguration*                 |   192.168.56.56       |
| AD DS instal·lat  *Get-WindowsFeature AD-Domain-Services*                   |   Servicios de Dominio de Active Directory        |
| Domini creat         *Get-ADDomain*                |  Molta info pero entre ella surt Musiccolud     |
| DNS instal·lat   *Ho He fet amb: Get-WindowsFeature DNS*                    |   Servidor DNS       |
| Resolució de `musiccloud.local` *Fet amb: Resolve-DnsName musiccloud.local*      |   Musiccloud.local TYPE A ...       |
| Eines d’Active Directory disponibles *Fet amb Get-Command Get-ADDomain* |   CMlet Get-Command Get-ADDomain version 1.0.1.0       |

## Preguntes

Responeu breument:

1. Per què `MC-DC01` necessita una IP fixa?
>Perquè els ordinadors de MusicCloud puguin trobar sempre el servidor i connectar-se al domini sense problemes.
    
2. Per què és necessari DNS en un domini Active Directory?
>Perquè els equips puguin localitzar el controlador de domini i els serveis necessaris per iniciar sessió.
    
3. Quina diferència hi ha entre instal·lar AD DS i promocionar el servidor a controlador de domini?
>Instal·lar AD DS és afegir el servei al Windows Server. Promocionar-lo és convertir el servidor en controlador de domini i crear el domini.
    
4. Quin és el nom del domini creat?
>El nom del domini creat és musiccloud.local.
    
5. Quin és el nom NetBIOS del domini?
>El nom NetBIOS del domini és MUSICCLOUD.
    
6. Per què no és recomanable que els clients del domini utilitzin un DNS extern com a DNS principal?
>Perquè un DNS extern no coneix els registres interns d'Active Directory. Això podria impedir que els ordinadors trobessin el controlador de domini.
    

