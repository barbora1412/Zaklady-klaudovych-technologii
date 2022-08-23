# Zadanie 1 #

# O aplikácii #

Táto aplikácia pozostáva z 2 služieb: databázy mysql a rozhrania phpadmin. Každá sa spustí vo vlastnom kontajneri. Pre spustenie inštancie phpadmin treba napísať URL http://localhost:8081/ 

# Konfigurácia #
- celá konfigurácia sa nachádza v súbore docker-compose.yaml
- meno mysql je db a meno phpadmin je pma 
- pre mysql boli namapované porty 6033:3306
- pre phpadmin boli namapované porty 8081:80
- mysql verzia 8.0.1
- phpadmin verzia-latest
- prihlasovacie údaje do databázy
      MYSQL_ROOT_PASSWORD: my_secret_password
      MYSQL_DATABASE: app_db
      MYSQL_USER: db_user
      MYSQL_PASSWORD: db_user_pass
- trvalý zväzok pre mysql

# Príprava prostredia #
prepare-app.sh

# Spustenie aplikácie #
start-app.sh

# Zastavenie aplikácie #
stop-app.sh

# Vymazanie #
 remove-app.sh


 *inšpirované z https://tecadmin.net/docker-compose-for-mysql-with-phpmyadmin/*
