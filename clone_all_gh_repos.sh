#!/bin/env bash
# Bash script for clone all github repositories from a user

inputtoken() {
    # "set" command is used to set or unset shell variables
    set -u

    # Input github token
    clear
    read -p "   Ingresar un token valido de GitHub:    " GH_TOKEN

    # Copy the value of github token to a file
    echo "$GH_TOKEN" >.githubtoken

    # Unload the value of github token variable
    unset GH_TOKEN

    # Login to github with the token value, saved previusly in a file
    gh auth login --with-token <.githubtoken

    # Remove the file wich contains the tiken value
    rm .githubtoken
}

inputowner()
{
    clear
    # Input GitHub owner name 
    read -p "   Ingresar el nombre del propietario:    " OWNER
}

clonar()
{
    clear
    echo "Creando directorio para salvar los repos"
    mkdir $OWNER && cd $OWNER
    # Take the owner list, select the first column and clone it
    gh repo list $OWNER | awk '{print $1}' | xargs -I{} gh repo clone https://github.com/{}
}

listar()
{
    clear
    # List the all repositories of one github profile
    gh repo list $OWNER -L 400 | awk '{print $1}' | sed "s/<$OWNER>\///" 
}

salvar()
{
    clear
    echo "Salvando la lista de repositorios"
    # List the all repositories of one github profile and save it to a file
    gh repo list $OWNER -L 400 | awk '{print $1}' | sed "s/<$OWNER>\///" > repos.txt
}

barra() {
    clear
    echo "######### Clonar los repositorios de GitHub de un usuario #########"
}

cancelar() {
    echo "Operacion cancelada"
}

pausa() {
    echo " "
    read -n 1 -p "Presiona una tecla para continuar..."
}

# The menu
menu() {
    barra "Menu principal"
    echo "#  1.) Ingresar Propietario                                       #"
    echo "#  2.) Ingresar Token                                             #"
    echo "#  3.) Listar los repositorios del Propietario                    #"
    echo "#  4.) Clonar los repositorios del Propietario                    #"
    echo "#  5.) Salvar a un archivo la lista de repositorios               #"
    echo "#  0.) Salir                                                      #"
    echo "###################################################################"

    read -n 1 -p "    Que desea hacer? " s
    case $s in
    1) inputowner ;;
    2) inputtoken ;;
    3) listar ;;
    4) clonar ;;
    5) salvar ;;
    0) clear
    exit
    ;;
    *)

        # The rest
        echo " "
        echo "Opcion invalida!"
        ;;
    esac

    # Menu
    pausa
    menu
}

# Start
menu


