out_dir := out
resume_dir := resume
resume_bin := $(resume_dir)/build/generate-resume.js
settings := settings.yml

dist: $(out_dir)/resume.tex $(out_dir)/resume.txt $(out_dir)/resume.md $(out_dir)/resume.pdf

distclean: clean
	rm -rf $(out_dir)

clean:
	cd $(resume_dir) && npm run clean
	rm -rf $(resume_dir)/build

$(resume_bin): $(resume_dir)/src/* $(resume_dir)/package.json
	cd $(resume_dir) && npm run build

$(out_dir):
	mkdir -p $(out_dir)

$(out_dir)/resume.txt $(out_dir)/resume.tex $(out_dir)/resume.md: resume.md $(resume_bin) $(out_dir) $(resume_dir)/$(settings)
	cd $(resume_dir) && \
		node ../$(resume_bin) \
			--input ../resume.md \
			--output ../$(out_dir)/resume \
			--settings $(settings)

$(out_dir)/resume.pdf: $(out_dir)/resume.tex
	latexmk $(out_dir)/resume.tex
