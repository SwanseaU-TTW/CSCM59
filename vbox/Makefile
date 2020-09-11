
all: cscm59.ova

.PHONY: all

cscm59.ova: vbox.nix
	cp $(shell nix-build --no-out-link vbox.nix)/nixos-*.ova cscm59.ova
	chmod 644 cscm59.ova

clean:
	rm -f cscm59.ova

