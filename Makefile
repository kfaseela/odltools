.PHONY: help clean

help:
	@echo "Usage: make TARGET"
	@echo "TARGETs:"
	@echo "  clean     rm -vrf ./build ./dist ./.tox ./*.pyc ./*.tgz ./*.egg-info AUTHORS ChangeLog"
	@echo "  gitsetup  add commit-msg with signoff and pre-commit hooks"
	@echo "  help      display this help and exit"

clean:
	rm -vrf ./build ./dist ./.tox ./*.pyc ./*.tgz ./*.egg-info AUTHORS ChangeLog

gitsetup:
	if [ ! -d ".git" ]; then printf "Run make gitsetup from the root of the repo\n"; exit 1; fi
	scp -p -P 29418 git.opendaylight.org:hooks/commit-msg .git/hooks/ && chmod 755 .git/hooks/commit-msg;
	cp -f .git/hooks/pre-commit.sample .git/hooks/pre-commit