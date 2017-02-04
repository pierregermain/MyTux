# Mis Ficheros Ocultos

Después de muchos intentos de sincronizar mis dotfiles entre computadoras, este es el sistema que mas me esta gustando por ahora por lo simple que es.

Más info en:
 - Liga con [ejemplos](https://dotfiles.github.io/)
 - Uso de dotfiles con stow:
    - usuario [xero](http://code.xero.nu/dotfiles)
    - usuario [cdwilson](https://github.com/cdwilson/home)
    - blog de [invergo](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
 - Uso de [python](https://github.com/sapegin/dotfiles/blob/master/sync.py) para copiar links simbólicos 
 
# Instalación

Necesitamos tener instalado Stow. Dependiendo de tu distro haz:

- `sudo pacman -S stow`
- `sudo apt-get install stow`
- `brew install stow`

# Cómo Funciona

El comando `stow` crea enlaces simbólicos por defecto en el directorio padre con respecto al directorio actual.

Manual detallado de [stow](https://www.gnu.org/software/stow/manual/stow.html#Introduction)

# Ejemplo para instalar configuraciones de Bash 

Mis ficheros de configuraciones (incluyendo carpetas) de Bash están en la carpeta `bash`.
En dicha carpeta tengo por ejemplo el fichero .bashrc.
Para instalar los ficheros en mi `~` ejecuto lo siguiente:

`stow -t ~ bash`

Esto lo que hace es crear `.bashrc` en mi `~` además de todos los demás ficheros/carpetas que haya dejado en `dotfiles/bash`.

## Solución de Problemas (usando git y stow)

En dado caso de que algún fichero ya exista `stow` nos avisará de ello. 
En este caso podemos ejecutarlo con la opción --adopt:

`stow --adopt -t ~ bash`

Lo que hace esto es crear el link simbólico en `~` y el fichero sobreescrito lo deja en nuestra carpeta `/dotfiles/bash/`.

Para ver que cambios se han realizado al fichero podemos hacer:

```
git status
git diff
```

### Si queremos volver a la versión anterior

```
git checkout bash
stow --restow ~ bash
```

### Si queremos la nueva versión sobreescrita

```
git add bash
git commit -m "nueva version"
git push
```

# Borrado de Links Simbólicos dejandolo con sus ficheros originales:

Si queremos borrar los links simbólicos que nos había creado stow podemos ejecutar:

`stow -t ~ -D bash`
