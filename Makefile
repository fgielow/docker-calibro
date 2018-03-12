NAME=fgielow/calibro

OSFLAG :=
MS :=
ifeq ($(OS),Windows_NT)
	ROOT = %cd:\=/%
else
	ROOT = `pwd`
endif

run: examples
	docker container run --rm -it -v $(ROOT)/examples:/root/calibro_V1.76/examples $(NAME)

simplest: examples
	docker container run --rm -it -v $(ROOT)/examples:/root/calibro_V1.76/examples $(NAME) simplest.sh ${TAG}

build: Dockerfile
	docker build -t $(NAME) .

examples:
	wget http://www.esru.strath.ac.uk/Downloads/Calibro/calibro_V1.76.tar.gz
	tar xvzf calibro_V1.76.tar.gz
	mv calibro_V1.76/examples ./
	rm -rf calibro_V1.76.tar.gz calibro_V1.76