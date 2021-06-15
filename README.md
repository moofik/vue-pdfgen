запустить поочередно в корневой директории проекта:

1) docker network create pdfgen
2) docker-compose up -d
3) установить нпм модули в frontend (npm install / yarn install, отдельный скрипт для докера не делал, инсталлить руками прям в папочке)   
3) ./puppeteer/run.sh