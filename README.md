# instainfo
Instainfo is a OSINT tool on Instagram Made in Python. It offers an interactive shell to perform analysis on Instagram account of any users by its nickname it provides alot of functionalities

## Installation

1. Fork/Clone/Download this repo

    `git clone https://github.com/evildevill/instainfo.git`

2. Navigate to the directory

    `cd instainfo`
3. Create a virtual environment for this project

    `python3 -m venv venv`

4. Load the virtual environment
   - On Windows Powershell: `.\venv\Scripts\activate.ps1`
   - On Linux and Git Bash: `source venv/bin/activate`
  
5. Run `pip install -r requirements.txt`

6. Open the `credentials.ini` file in the `config` folder and write your Instagram account username and password in the corresponding fields
    
    Alternatively, you can run the `make setup` command to populate this file for you.

7. Run the main.py script in one of two ways

    * As an interactive prompt `python3 instainfo.py <target username>`
    * Or execute your command straight away `python3 instainfo.py <target username> --command <command>`
