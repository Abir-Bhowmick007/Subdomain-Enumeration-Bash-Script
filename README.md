# Subdomain Enumeration Bash Script

This is a simple and effective Bash script for automated subdomain enumeration using powerful tools like:

- **subfinder**
- **assetfinder**
- **findomain**
- **Sublist3r**
- **FFuf**
- **httpx**

## 📜 Features

- Collect subdomains from multiple sources
- Automatically deduplicate results
- Identify live subdomains
- Save all outputs into organized files and directories

## 🛠 Requirements

Make sure you have the following tools installed and configured in your system:

- [`subfinder`](https://github.com/projectdiscovery/subfinder)
- [`assetfinder`](https://github.com/tomnomnom/assetfinder)
- [`findomain`](https://github.com/Findomain/Findomain)
- [`httpx`](https://github.com/projectdiscovery/httpx)

You can install them via:

```bash
sudo apt install subfinder assetfinder
# For findomain
sudo snap install findomain
# For httpx
GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest


chmod +x myscript.sh
./myscript.sh yahoo.com

