# R

## Instalação

### Fedora

- Instalar o pacote R

```bash
$ sudo dnf install R
```

- habilitar o copr do fedora com r-studio (pra facilitar):

```bash
$ sudo dnf copr enable iucar/rstudio
$ sudo dnf install -y rstudio 
```

- (opcional) caso queira instalar o `tidyverse`, instalar as dependencias:

```bash
$ sudo dnf install -y openssl-devel curl-devel 
```
 
- dentro do R Studio:

```bash
$ install.packages("tidyverse")
```

