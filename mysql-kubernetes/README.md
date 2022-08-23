# ZADANIE 2 #

# Nasadenie MySQL pomocou kubernetes #

Toto vypracovanie spočíva v nasadení MySQL inštancie v Kubernetes. Predpokladá sa, že je nainštalovaný Minikube a príkaz kubectl. Príkaz kubectl musí byť funkčný a správne nakonfigurovaný. 

V repozitári sa nachádzajú tieto súbory:
* **start-app.sh** : skript, v ktorom sú napísané príkazy na vytvorenie Kubernetes objektov
* **stop-app.sh** : skript, v ktorom sú zapísané príkazy na zrušenie vytvorených Kubernetes objektov pomocou skriptu **start-app.sh**
* **deployment.yaml** : konfiguračný súbor pre objekt typu Deployment
* **service.yaml** : konfiguračný súbor pre objekt typu Service
* **statefulset.yaml** : konfiguračný súbor pre objekty typu StatefulSet, PersistentVolumeClaim a PersistentVolume
* **prepare-app.sh** : skript na prípravu aplikácia

# Opis aplikácie #

Všetky objekty patria do menného priestoru **z2**. Trvalý zväzok je implementovaný pomocou *hostPath*. Objekt PersistentVolume má definovanú veľkosť 3Gi a PersistentVolumeClaim má 1Gi.
Vytvorí sa mapovanie medzi PersistentVolumeClaim a PersistentVolume, pričom zväzok sa bude pridelovať automaticky. Do prideleného adresára sa dá zapisovať maximálne jedným procesom
 a čítať ľubovoľným počtom procesov. Objekt typu  PersistentVolumeClaim vznikne spolu s vytvorením StatefulSet.

Aplikácia používa obraz mysql:5.6, funguje na porte 3306 a meno servisu sa nazýva **mysql**. V tomto vypracovaní je heslo pre jednoduchosť zapísané v konfiguračnom súbore.

Kde sa nachádzajú dáta: *mountPath: /var/lib/mysql*

# Zverejnenie služby #

Služba je zverejnená pomocou objektou Service a Deployment. Dostupné sú 2 Pody. 
K službe mysql sa dá pristúpiť pomocou príkazu: 

`kubectl exec -n z2 mysql-0 -it -c mysql -- sh`

Týmto príkazom dostaneme shell pre pod menom **mysql-0**. 

`mysql -p`

Týmto príkazom dostaneme MySQL shell.

Zadáme heslo *password*, ktoré je napísané v konfigurácii *deployment.yaml* a zobrazí sa promt pre mysql.

# Príklad použitia mysql #

`mysql> CREATE DATABASE zadanie;`
`mysql> USE zadanie`
`...`

# Zdroje #

Inšpirované zo zdroja [LINK](https://phoenixnap.com/kb/kubernetes-mysql), pričom bol pridaný StatefulSet a boli upravené konfigurácie. 
