.PHONY: build upload

build:
	docker build -t ambientsound/toolbox .

upload:
	docker push ambientsound/toolbox
