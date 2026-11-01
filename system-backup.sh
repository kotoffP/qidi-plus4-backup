#!/bin/bash
cd /home/mks/klipper_config
rm -rf .git
git init
git config --global user.email "backup@printer.local"
git config --global user.name "QIDI Backup"

# Прописуємо найнадійнішу SSH-адресу — без HTTPS, токенів та паролів!
git remote add origin "git@github.com:kotoffP/qidi-plus4-backup.git"

# Налаштовуємо довіру до сервера GitHub, щоб Linux не ставив запитань під час першого підключення
mkdir -p ~/.ssh && ssh-keyscan -t ed25519 github.com >> ~/.ssh/known_hosts 2>/dev/null

#git add *.cfg *.conf *.sh *.txt 2>/dev/null
git add . 2>/dev/null
git commit -m "System Secure SSH Backup" 2>/dev/null
git push -u origin master --force
echo "--- Скрипт успішно виконав відправку файлів через SSH! ---"
