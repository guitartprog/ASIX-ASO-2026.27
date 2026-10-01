> **Nota**: Els exercicis/pràctiques t'han de servir per a familiarizar-te amb el llenguatge Powershell. Aprofita per a realitzar diverses proves i veure què passa. Documenta també aquestes proves i resultats.
# Tipus de dades

## 1. Identificar tipus

Crea les variables següents:
```powershell
$nom = "Servidor01"
$port = 443
$actiu = $true
$espai = 12.5
```
Consulta el tipus de cadascuna amb:
```powershell
.GetType()
```
Completa una taula com aquesta:

| Variable | Valor        | Tipus |
| -------- | ------------ | ----- |
| $nom     | `Servidor01` |       |
| $port    | `443`        |       |
| $actiu   | $true        |       |
| $espai   | `12.5`       |       |

![Descripción de la imagen](/Powershell/img/3.1.png)
## 2. Número o text?

Executa:
```powershell
$a = 10
$b = 5

$a + $b
```
Després:
```powershell
$a = "10"
$b = "5"

$a + $b
```
![Descripción de la imagen](/Powershell/img/3.2.png)
Respon:

- Quin resultat obtens en cada cas?
- Per què no és el mateix?
Mostra després el contingut de cadascuna de les variables.


- Quin tipus tenen $a i $b en cada cas?

En el primer cas:

    10 + 5

PowerShell està fent una suma numèrica:

    15

En el segon cas:

    "10" + "5"

els dos valors són textos (String). L'operador + els concatena, és a dir, els posa un darrere de l'altre:

    10 + 5 → 105
Conclusió: les cometes són importants perquè fan que 10 sigui interpretat com a text en lloc de com a número.


## 3. Canviar el tipus d'una variable

Executa:
```powershell
$valor = 100
```
Consulta:
```powershell
$valor.GetType()
```
Ara executa:
```powershell
$valor = "100"
```
i torna a consultar:
```powershell
$valor.GetType()
```
![Descripción de la imagen](/Powershell/img/3.3.png)
Respon:

**Ha canviat el valor? Ha canviat el tipus?**

Ha canviat el valor?

El valor que veiem continua sent 100, però internament ara està representat com a text.

Ha canviat el tipus?

Sí.

Inicialment:

    100 → Int32

Després:

    "100" → String

Això mostra que PowerShell permet tornar a assignar a una variable un valor d'un altre tipus.


## 4. Tipus explícits

Executa:
```powershell
[int]$port = 443
```
Comprova el tipus:
```powershell
$port.GetType()
```
Ara prova:
```
[string]$portText = 443
```
Consulta també:
```powershell
$portText.GetType()
```
Respon:
![Descripción de la imagen](/Powershell/img/3.4.png)

**Tot i que visualment els dos valors semblen `443`, són del mateix tipus?**

No, no són del mateix tipus.

Encara que visualment tots dos mostrin:

    443

$port és un número:

    Int32

mentre que $portText és text:

    String

Això pot afectar les operacions que fem amb aquests valors.

Per exemple:

    $port + 1

dona:

    444

Mentre que amb:

    $portText + 1

PowerShell pot convertir el 1 a text i concatenar-lo, donant:

    4431

## 5. Booleans

Crea:
```powershell
$serveiActiu = $true
$servidorDisponible = $false
```
Consulta els tipus.

Després mostra un missatge amb:
```
Write-Host "Servei actiu: $serveiActiu"
Write-Host "Servidor disponible: $servidorDisponible"
```
![Descripción de la imagen](/Powershell/img/3.5.png)

## 6. General

Crea variables per representar un servidor amb aquesta informació:
```
Nom: SRV-WEB01
Port: 443
Espai lliure: 125.7 GB
Actiu: True
```


Després:

1. mostra el valor de totes les variables;
2. consulta el tipus de cadascuna;
3. indica quin tipus de dada has utilitzat per cada valor.