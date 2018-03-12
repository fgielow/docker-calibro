NAME=fgielow/calibro

run:
	docker container run --rm -it -v `pwd`/examples:/root/calibro_V1.76/examples $(NAME)

build: Dockerfile examples
	docker build -t $(NAME) .

examples:
	wget http://www.esru.strath.ac.uk/Downloads/Calibro/calibro_V1.76.tar.gz
	tar xvzf calibro_V1.76.tar.gz
	mv calibro_V1.76/examples ./
	rm -rf calibro_V1.76.tar.gz calibro_V1.76