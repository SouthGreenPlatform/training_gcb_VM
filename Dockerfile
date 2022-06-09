
### Jupyter stack extension (from SouthGreen example file): 'datascience-notebook'

### Pip modules ('pip install ...')
### System dependancies ('apt-get install -y ...')

FROM jupyter/datascience-notebook
USER root
RUN apt update
RUN apt install -y python3-all-dev python3-pip python3-venv
RUN apt install -y python3-pyqt5 pyqt5-dev-tools qttools5-dev-tools
RUN pip install PyQt5 ete3 owlready2 pyproteinsExt ipympl jupyterlab

### Adding dedicated kernel ###
RUN python3 -m pip install --upgrade ipython
RUN python3 -m pip install bash_kernel
RUN python3 -m bash_kernel.install
ENV JUPYTER_ENABLE_LAB=yes

### Install for non-specific analizes tools 
RUN apt install -y unzip wget build-essential cmake git-all tar gzip

### Dedicated install to MetaBarCod (mbc) analyses ###

### BASE with APT
RUN apt-get install -y unzip wget curl cmake tar gzip

### SINGULARITY, R and NEXTFLOW with CONDA
RUN conda install -c conda-forge singularity
RUN conda install -c conda-forge r-base
RUN conda install -c r r-essentials
RUN conda install -c conda-forge r-devtools
### RUN conda install -c rstudio ### error
RUN conda install -c bioconda nextflow

