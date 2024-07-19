SRC_FILES = $(wildcard src/*.elm)
index.html: $(SRC_FILES)
	elm make --output=app.js src/Boggle.elm