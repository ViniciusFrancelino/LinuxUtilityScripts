#!/bin/bash

## ======== Definições de VAriaveis ======== ##

# Diretorio de logs e Bakcups
BACKUP_DIR="/var/backups/git-backup/"
BACKUP_DIR_LOGS="/var/log/git-backup/"

# Nome do Repositorio e caminho de clonagem;
REPO_NAME="SenGas"
CLONE_LOCATE="${BACKUP_DIR}${REPO_NAME}"

# Arquivo de log
LOGS_ARCHIVE="git-bkp.log"
LOGS_FILE="${BACKUP_DIR_LOGS}${LOGS_ARCHIVE}"

# Nome do Backup
BACKUP_NAME="bkp_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_NAME}"

# Repositorio Git Hub;
REPO_GIT="https://github.com/KetellynSantos/SenGas"

# Teste de conexão com a internet
NET_TEST=$(ping -c 1 -q -w 3 google.com | grep -Eio "0%")

## ======== Inicio Do Codigo ======== ##

## Validação da existencia De Diretorios e arquivos:

if [ ! -d "$BACKUP_DIR" ]; then
    #echo "`date` Criando Diretorio de Backups em '$BACKUP_DIR'" >> "$LOGS_FILE"
    mkdir -p "$BACKUP_DIR"
fi

if [ ! -d "$BACKUP_DIR_LOGS" ]; then
    #echo "`date` Criando Diretorio de Logs em '$BACKUP_DIR_LOGS'" >> "$LOGS_FILE"
    mkdir -p "$BACKUP_DIR_LOGS"
fi

if [ ! -f "$LOGS_FILE" ]; then
    #echo "`date` Criando Arquivo de Logs em '$LOGS_FILE'" >> "$LOGS_FILE"
    touch "$LOGS_FILE"
fi

# Validação de Saida para internet;
if [ "$NET_TEST" == "0%" ]; then

    # Clone do Repositorio
    /bin/git clone "$REPO_GIT" "$CLONE_LOCATE"

    # Remoçao de Sujeiro do GIT
    if [ -d "$CLONE_LOCATE" ]; then
        /bin/rm -rf "${CLONE_LOCATE}/.git"* &> /dev/null
        echo "`date` Arquivos .git deletados" >> "$LOGS_FILE"
    else
        echo "`date` Error! Diretorio Não encontrado" >> "$LOGS_FILE"
    fi

    # Compactação do Backup em um arquivo tar.gz
    if [ -d "$CLONE_LOCATE" ]; then
        /bin/tar -czf "$BACKUP_PATH" "$CLONE_LOCATE"
        /bin/rm -rf "$CLONE_LOCATE"
    else
        echo "`date` Error! Diretorio Não criado" >> "$LOGS_FILE"
    fi

    # Validação se o Backup foi criado corretamente
    if [ -f "$BACKUP_PATH" ]; then
        echo "`date` Backup Criado Corretamente" >> "$LOGS_FILE"
    else
        echo "`date` Backup Nâo Criado" >> "$LOGS_FILE"
    fi

else
    echo "`date` Não foi possivel fazer conexão! Tente novamente!" >> "$LOGS_FILE"
fi