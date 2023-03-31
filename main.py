import os
os.system("curl -o /usr/local/bin/cog -L https://github.com/replicate/cog/releases/latest/download/cog_`uname -s`_`uname -m`")
os.system("chmod +x /usr/local/bin/cog")
token = "8b0cc99692a5312526fbc6a1d40456750dbd39a1"
os.system(f"echo {token} | cog login --token-stdin")
os.system("pip install -r scripts/requirements.txt")
os.system("cog push r8.im/moezilla/artjourney-anime")
os.system("python3 scripts/download.py")
