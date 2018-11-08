FROM ubuntu:16.04
MAINTAINER Fernando Gielow <fgielow@arbnco.com>
LABEL Description="Docker image for running calibro ESP-r"

# Base needs
RUN apt-get update && apt-get install -y software-properties-common sudo vim curl wget git

# Install apt-fast because latex is huge and takes forever to download, ffs
# Reference: https://github.com/ilikenwf/apt-fast#ubuntu-ppa
RUN add-apt-repository ppa:apt-fast/stable && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install apt-fast

# Calibro seems to like generating pdfs using latex.... Big dependency but what can we do :shrugs:
# RUN apt-fast -y install texlive-base texlive texlive-full

# R repository
RUN add-apt-repository "deb http://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && apt-get update

# Dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install gfortran r-base r-base-core r-base-dev 

RUN apt-get install -y libcurl4-openssl-dev libxml2-dev

WORKDIR /root


# for some reason MODEEST was complaining that genefilter could not be installed, let's install it manually then...

RUN echo 'if (!requireNamespace("BiocManager", quietly = TRUE))\n    install.packages("BiocManager")\nBiocManager::install("genefilter", version = "3.8")' > installDeps.R

RUN echo 'install.packages(c("RCurl","XML"))\ninstall.packages("https://www.bioconductor.org/packages/release/bioc/src/contrib/annotate_1.60.0.tar.gz")\ninstall.packages("https://bioc.ism.ac.jp/packages/3.4/bioc/src/contrib/genefilter_1.56.0.tar.gz")' >> installDeps.R

RUN Rscript installDeps.R


# Calibro
# use local copy provided unofficially while hosted copy is not up to date
COPY ./calibro_V2.1.tar.gz /root/

# RUN wget http://www.esru.strath.ac.uk/Downloads/Calibro/calibro_V2.1.tar.gz && \
# 	tar xvzf calibro_V2.1.tar.gz && \
# 	rm calibro_V2.1.tar.gz

RUN tar xvf calibro_V2.1.tar.gz && rm calibro_V2.1.tar.gz

WORKDIR /root/calibro_V2.1

RUN Rscript install.R

ENV PATH="/usr/local/lib/R/site-library/calibro:$PATH"

RUN ln -s /usr/local/lib/R/site-library/calibro/calibrino ./

COPY ./build-dependencies/.calibro_helper.sh /root/.calibro_helper.sh

COPY ./build-dependencies/simplest.sh /usr/local/bin/

RUN echo '[[ -f /root/.calibro_helper.sh ]] && source /root/.calibro_helper.sh' >> /root/.bashrc

# CLEANUP
RUN apt-get clean && \
  rm -rf /var/lib/apt

CMD bash