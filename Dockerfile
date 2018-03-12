FROM ubuntu:16.04
MAINTAINER Fernando Gielow <fgielow@arbnco.com>
LABEL Description="Docker image for running calibro ESP-r"

# Base needs
RUN apt-get update && apt-get install -y software-properties-common sudo vim curl wget git

# Calibro seems to like generating pdfs using latex.... Big dependency but what can we do :shrugs:
RUN apt-get -y install texlive-base texlive texlive-full

# R repository
RUN add-apt-repository "deb http://www.stats.bris.ac.uk/R/bin/linux/ubuntu trusty/" && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && apt-get update

# Dependencies
RUN apt-get -y install gfortran r-base r-base-dev

WORKDIR /root

# R dependencies for Calibro
RUN R --vanilla -e "install.packages(c('R6', 'coda', 'MASS', 'modeest','sensitivity', 'optparse', 'jsonlite', 'knitr', 'tinytex'), repos = 'https://cran.ma.imperial.ac.uk/')"

# Calibro
RUN wget http://www.esru.strath.ac.uk/Downloads/Calibro/calibro_V1.76.tar.gz && \
	tar xvzf calibro_V1.76.tar.gz && \
	rm calibro_V1.76.tar.gz

WORKDIR /root/calibro_V1.76

RUN R --vanilla -e "install.packages('src.tar.gz')"

RUN chmod +x calibrino

RUN export PATH="`pwd`:$PATH"

COPY ./.calibro_helper.sh /root/.calibro_helper.sh
RUN echo '[[ -f /root/.calibro_helper.sh ]] && source /root/.calibro_helper.sh' >> /root/.bashrc

# CLEANUP
RUN apt-get clean && \
  rm -rf /var/lib/apt