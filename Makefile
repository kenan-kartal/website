build_path = ../builds/website
root_args = -D $(build_path) -a imagesdir=img
studies_args = -D $(build_path)/studies -a imagesdir=../img
other_args = -D $(build_path)/other -a imagesdir=../img

all:
	asciidoctor $(root_args) src/index.adoc
	asciidoctor $(studies_args) src/studies/*.adoc
	asciidoctor $(other_args) src/other/*.adoc
	rsync -av src/img $(build_path)
	find $(build_path) -type d -exec chmod 0755 {} \;
	find $(build_path) -type f -exec chmod 0644 {} \;

publish:
	rclone -v copy $(build_path)/ website:/public_html/

