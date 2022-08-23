# Skúška #

# Nasadenie pgAdmin 4 + PostgreSQL do klaudu Azure #

Toto vypracovanie spočíva v nasadení webovej aplikácie pgAdmin na administráciu platformy PostgreSQL do  verejného klaudu Azure. Predpokladá sa, že je nainštalovaný docker a Azure CLI.

V repozitári sa nachádzajú tieto súbory:
* **prepare-app.sh** : Slúži na prípravu aplikácie a vytvorenie potrebných služieb, pričom prihlasovacie údaje do Azure nie sú zverejnené
* **remove-app.sh** : Zruší všetko vytvorené pomocou **prepare-app.sh**
* **docker-compose.yml** : konfiguračný súbor na vytvorenie kontajnerov

# Dostupnosť aplikácie  #

Aplikácia je dostupná v čase skúšky z adresy https://pgadmin-exam2022.azurewebsites.net

# Opis vypracovania #

V skripte sú nasledovné kroky:
* prihlásenie sa do Azure
* vytvorenie **Resource group** menom *myResourceGroup*
* vytvorenie **App Service Plan** menom *myAppServicePlan*
* do *myResourceGroup* sa vytvorí multikontajnerová aplikácia pgAdmin-exam2022 s pomocou konfiguračného súboru **docker-compose.yml**
* povolí sa trvalé úložisko mimo kontajnera nastavením WEBSITES_ENABLE_APP_SERVICE_STORAGE=TRUE
* vytvorí sa Azure Files úložisko menom mystorageaccount1412
* úložisko sa prepojí s aplikáciou
* namapované porty: postgres 5432:5432, pgadmin 5050:80


# Prihlasovacie údaje do pgAdmin #
* user: admin@admin.com
* password : root

# Registračné údaje servera PostgreSQL #
* Hostname: pg_container
* Port: 5432
* Maintenance database: test_db
* Username: root
* Password: root

