build_path = ../builds/website
root_args = -D $(build_path) -a imagesdir=img
other_args = -D $(build_path)/other -a imagesdir=../img

all:
	asciidoctor $(root_args) src/index.adoc
	asciidoctor $(other_args) src/other/*.adoc
	rsync -r src/img $(build_path) 
	find $(build_path) -type d -exec chmod 0755 {} \;
	find $(build_path) -type f -exec chmod 0644 {} \;
