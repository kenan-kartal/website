build_path = ../builds/website

root_args = -D $(build_path) -a imagesdir=img
studies_args = -D $(build_path)/studies -a imagesdir=../img
other_args = -D $(build_path)/other -a imagesdir=../img

all:	$(build_path)/index.html\
	$(build_path)/studies/ray-tracer.html\
	$(build_path)/studies/ray-tracer-1-core.html\
	$(build_path)/studies/ray-tracer-2-acceleration.html\
	$(build_path)/studies/ray-tracer-3-multisampling.html\
	$(build_path)/studies/ray-tracer-4-texture.html\
	$(build_path)/studies/ray-tracer-5-tone.html\
	$(build_path)/other/shenzhen-io-b8zs.html\
	$(build_path)/other/shenzhen-io-endless-runner.html\
	img
	find $(build_path) -type d -exec chmod 0755 {} \;
	find $(build_path) -type f -exec chmod 0644 {} \;

# Index
$(build_path)/index.html: src/index.adoc
	asciidoctor $(root_args) src/index.adoc
# Studies
$(build_path)/studies/ray-tracer.html: src/studies/ray-tracer.adoc
	asciidoctor $(studies_args) src/studies/ray-tracer.adoc
$(build_path)/studies/ray-tracer-1-core.html: src/studies/ray-tracer-1-core.adoc
	asciidoctor $(studies_args) src/studies/ray-tracer-1-core.adoc
$(build_path)/studies/ray-tracer-2-acceleration.html: src/studies/ray-tracer-2-acceleration.adoc
	asciidoctor $(studies_args) src/studies/ray-tracer-2-acceleration.adoc
$(build_path)/studies/ray-tracer-3-multisampling.html: src/studies/ray-tracer-3-multisampling.adoc
	asciidoctor $(studies_args) src/studies/ray-tracer-3-multisampling.adoc
$(build_path)/studies/ray-tracer-4-texture.html: src/studies/ray-tracer-4-texture.adoc
	asciidoctor $(studies_args) src/studies/ray-tracer-4-texture.adoc
$(build_path)/studies/ray-tracer-5-tone.html: src/studies/ray-tracer-5-tone.adoc
	asciidoctor $(studies_args) src/studies/ray-tracer-5-tone.adoc
# Other
$(build_path)/other/shenzhen-io-b8zs.html: src/other/shenzhen-io-b8zs.adoc
	asciidoctor $(other_args) src/other/shenzhen-io-b8zs.adoc
$(build_path)/other/shenzhen-io-endless-runner.html: src/other/shenzhen-io-endless-runner.adoc
	asciidoctor $(other_args) src/other/shenzhen-io-endless-runner.adoc
# Images
img:
	rsync -av src/img $(build_path)

publish:
	rclone -v copy $(build_path)/ website:/public_html/

