Bash script
Clone or list all repositories of a github profile
# desafio07

Requisitos previos
- Instalar gh api | GitHub CLI
- Aqui estan los pasos https://github.com/cli/cli/blob/trunk/docs/install_linux.md

Este script busca clonar o listar de manera sencilla todos los repositorios de un perfil de GitHub.
Para poder descargar los repositorios solo hay que estar logueado en GitHub e ingresar el perfil de usuario que se quiere clonar.
Cuando se clonan los repositorios, el script crea un directorio con el nombre del perfil ingresado.
Para clonar repositorios privados se necesita un token válido del perfil que se desea clonar.
Otra opción interesante es que se puede guardar en un txt la lista del perfil ingresado.

Por cuestiones de seguridad, una vez utilizado, el script elimina rastros del token.






Parte del codigo esta inspirado en este otro script
https://www.mailslurp.com/blog/github-cli-auth-with-token-environment-variable/
Muchas gracias por compartir.



