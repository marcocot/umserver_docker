# Variabili
BIN = app/mappersrv
ZIP = umserver_service_lin64.zip
URL = https://ultimamapper.com/updater/umserver_service_lin64.zip
DOCKER_IMAGE = ultima_mapper

# Obiettivo di default: scarica ed estrae il binario nella cartella "app"
all: $(BIN)

# Regola per ottenere il binario estraendolo nella cartella "app"
$(BIN): $(ZIP)
	mkdir -p app
	unzip -o $(ZIP) -d app
	chmod +x $(BIN)

# Regola per scaricare il file ZIP
$(ZIP):
	curl -L $(URL) -o $(ZIP)


docker-build: all
	docker build -t $(DOCKER_IMAGE):latest .
	@HASH=$$(sha256sum app/mappersrv | cut -d' ' -f1) ;\
	echo "Tagging image with hash: $$HASH" ;\
	docker tag $(DOCKER_IMAGE):latest $(DOCKER_IMAGE):$$HASH

# Regola per pulire i file generati
clean:
	rm -f $(ZIP)
	rm -rf app
