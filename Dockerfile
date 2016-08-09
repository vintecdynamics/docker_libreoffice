# Run Libreoffice in a container

# docker run -d \
#	-v /etc/localtime:/etc/localtime:ro \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	-v $HOME/slides:/root/slides \
#	-e GDK_SCALE \
#	-e GDK_DPI_SCALE \
#	--name libreoffice \
#	jess/libreoffice
#
FROM vintec/basejava:v8
MAINTAINER Isidoro Trevino <isidoro.trevino@vintec.mx>

USER root

RUN apt-get update && apt-get install -y \
	wget \
	locales \
	ure fonts-opensymbol hyphen-fr hyphen-de hyphen-en-us hyphen-it hyphen-ru \ 
	fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid fonts-dustin fonts-f500 \ 
	fonts-fanwood fonts-freefont-ttf fonts-liberation fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa \
	libfreetype6 \
	libgtk-3-0 \
	libgail-3-0 \
	at-spi2-core \
	&& cd /tmp \
	&& locale-gen en_US.UTF-8   \
	&& wget http://download.documentfoundation.org/libreoffice/stable/5.2.0/deb/x86_64/LibreOffice_5.2.0_Linux_x86-64_deb.tar.gz \
	&& tar xvfz LibreOffice_5.2.0_Linux_x86-64_deb.tar.gz \
    && ls -la \
 	&& cd LibreOffice_5.2.0.4_Linux_x86-64_deb/DEBS/ \
	&& dpkg -i *.deb \
	&& rm -rf /var/lib/apt/lists/*

#ENV LANG en_US.UTF-8  
#ENV LANGUAGE en_US:en   
#ENV LC_ALL en_US.UTF-8  

ENTRYPOINT [ "libreoffice5.2" ]
