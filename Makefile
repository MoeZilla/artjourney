predict:
	@sudo cog predict -i prompt=tree -i hires=True

push:
	@sudo cog push r8.im/moezilla/artjourney-anime

setup:
	@sudo curl -o /usr/local/bin/cog -L https://github.com/replicate/cog/releases/latest/download/cog_`uname -s`_`uname -m`
	@sudo chmod +x /usr/local/bin/cog
        @sudo echo "8b0cc99692a5312526fbc6a1d40456750dbd39a1" | cog login --token-stdin
	@pip3 install -r scripts/requirements.txt

download: setup
	@python3 scripts/download.py

# Sync to remote GPU server
sync:
	rsync -av -e ssh --exclude='.git/' --exclude='**/.mypy_cache/' . $(server):~/cog
