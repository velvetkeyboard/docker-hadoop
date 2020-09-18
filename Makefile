company=velvetkeyboard
project=hadoop
version=3.3.0
docker_img_name=$(company)/$(project)
docker_tag=$(version)

build:
	docker build . \
		--build-arg VERSION=$(version) \
		-t \
		$(docker_img_name):$(docker_tag)

run:
	docker run --rm -ti $(docker_img_name):$(docker_tag) bash -c \
		" \
		mkdir input && \
		ls && \
		cp hadoop-$(version)/etc/hadoop/*.xml input && \
		hadoop jar hadoop-$(version)/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.0.jar grep input output 'dfs[a-z.]+'  && \
		cat output/* && \
		ls output/ \
		"
