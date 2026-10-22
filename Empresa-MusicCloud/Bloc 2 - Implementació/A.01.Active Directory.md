# Activitat: del disseny a l’arquitectura d’AD DS

# Context

MusicCloud ja ha completat el disseny lògic del seu servei de directori.  

Abans d’instal·lar Active Directory Domain Services, cal comprovar que l’alumnat identifica correctament els components que s’hauran d’implantar.  

# Identificació dels components

A partir de l’arquitectura prevista, indiqueu:

1.   Quin serà el nom del bosc.  
>musiccloud
    
2.   Quin serà el nom del domini.  
>musiccloud.local
    
3.   Quin servidor actuarà com a controlador de domini. ´
>Actuara com a controlador de domini el Windwos Server Core que fara de DC amb el hostname MC-DC01 
    
4.   Quin servidor proporcionarà DNS.  
>Proporcionarà DNS la mateixa maquina que farem servir de DC, amb el hostname MC-DC01
    
5.   Quin protocol s’utilitzarà principalment per a l’autenticació.  
>S'utilitzara Kerberos, el cual es el protocol principal de la authetnicació de Windwos Server
    
6.   Quin protocol permetrà consultar els objectes.  
>El protocol que permeterà consultar els objectes serà LDAP, el cual permet consultar i accedir a objectes del directori actiu.
      
7. Quin servei de Windows emmagatzema i administra els objectes del domini?
>El servei de Windwos que emmagatzema i administra els objectes del domini és Active Directory Domain Services (AD-DS), el cual emmegatzema i administra els objectes del domini, com a els usuaris, equips, grups i UO's.
    

# Anàlisi de l’arquitectura

Responeu breument:

1.   Per què el servidor `SRV-AD-01` necessita una adreça IP fixa?
>Perque els clients puguin trobar el controlador de domini i el DNS semrpe a la mateixa IP garantin el funcionament correcte dels serveis de active directory.
    
2.   Per què els clients del domini han d’utilitzar un servidor DNS capaç de resoldre la zona d’Active Directory?
>Perque puguin localitzar el controlador de domini i els serveis necesaris per a authenticarse i accedir a els recursos del domini
    
3.   Què passaria si `SRV-AD-01` estigués apagat?
>Els clinets no podrien contactar amb el servidor de domini per a authenticar-se ni consultar active directory. També podrien deixar de funcionar alters serveis que depenguin de aquest servidor com la resolució DNS del domini..
    
4.   Per què un únic controlador de domini és acceptable al laboratori però insuficient en una empresa real?
    
5.   Per què els departaments no s’han creat com a dominis diferents?
    

# Planificació de la implantació

Ordeneu les accions següents:

- crear els usuaris.  
    
- comprovar el DNS.  
    
- assignar els usuaris als grups.  
    
- instal·lar AD DS.  
    
- crear les unitats organitzatives.  
    
- preparar la xarxa del servidor.  
    
- unir el client al domini.  
    
- crear el bosc i el domini.  
    
- crear els grups.  
    
- comprovar el funcionament del domini.  
    

Justifiqueu breument l’ordre escollit.  

