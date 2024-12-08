ECHO=@

default: galleries update-usage

# Let this be optional, so if prerequisites aren't there, just issue a warning,
# but exit code 0
update-usage:
	$(ECHO) if ! gallerator --help 2>&1 > /dev/null ; then \
			echo '**WARNING** gallerator not in path' ; \
			exit 0 ; \
		elif [ ! -x ../gallerator/release-tools/replace-markdown-block.sh ] ; then \
			echo '**WARNING** no ../gallerator/releasfe-tools/replace-markdown-block.sh found' ; \
			exit 0 ; \
		else \
			echo "Updating usage"; \
			../gallerator/release-tools/replace-markdown-block.sh README.md usage ; \
		fi

galleries: doc-scripts/generation-commands.sh
	@echo Generating Galleries
	$(ECHO) bash ./doc-scripts/generation-commands.sh

doc-scripts/generation-commands.sh: doc-scripts/extract-generation-commands.py
	@echo Creating doc-scripts/generation-commands.sh
	$(ECHO) python3 doc-scripts/extract-generation-commands.py README.md > \
		doc-scripts/generation-commands.sh
	$(ECHO) chmod +x doc-scripts/generation-commands.sh