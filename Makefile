NAME=fgielow/calibro

run:
	docker container run --rm -it -v `pwd`/ddfc-source/src/firefly_dynamic_clustering:/workspace/bake/source/ns-3.14.1/src/firefly_dynamic_clustering $(NAME)

build: Dockerfile
	docker build -t $(NAME) .
