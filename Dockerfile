
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


### Dedicated install to GenCompBact (gcb) analyses ###

### CIRCOS, SCOARY, ROARY, PROKKA and MINIMPA2 with APT
RUN apt-get install -y unzip wget cmake tar gzip
RUN apt install -y circos scoary roary prokka minimap2

### DOTPLOT wit PIP
RUN pip install dotplot

### SINGULARITY, FASTANI with CONDA
RUN conda install -c conda-forge singularity
RUN conda install -c bioconda fastani

### MOB and FLYE with SINGULARITY
### RUN singularity pull docker://kbessonov/mob_suite:3.0.3
### RUN singularity pull docker://staphb/flye:2.9


### TESTS ERRORS
### RUN conda install -c bioconda flye
### RUN docker run quay.io/biocontainers/flye:2.9
### RUN git clone https://github.com/fenderglass/Flye
### RUN make -f Flye/Makefile
### RUN pip install mob_suite
### RUN conda install -c bioconda mob_suite


