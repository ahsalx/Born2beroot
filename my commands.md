1. Switch to Root and Install sudo
Become root:
su

Install the sudo package:
apt install sudo

Reboot the system:
sudo reboot

Verify sudo installation:
sudo -V


2. User and Group Management
Create a new user:
sudo adduser <login>

Create a new group:
sudo addgroup user42

Check the group list:
getent group user42

Add a user to a group:
sudo adduser <username> <groupname>

Example:
sudo adduser gemartin user42
sudo adduser gemartin sudo

Verify group membership:
getent group sudo
getent group user42


3. Install and Verify OpenSSH Server
Install OpenSSH server:
sudo apt install openssh-server

Check SSH service status:
sudo service ssh status


4. SSH Configuration Hardening

4.1 Modify /etc/ssh/sshd_config (Server-side)
Become root:
su

Open the server configuration file:
nano /etc/ssh/sshd_config

Change SSH port:
Find: #Port 22
Replace with: Port 4242

Disable root login over SSH:
Find: #PermitRootLogin prohibit-password
Replace with: PermitRootLogin no

Save and exit.


4.2 Modify /etc/ssh/ssh_config (Client-side)
Open the client configuration file:
nano /etc/ssh/ssh_config

Change port:
Find: #Port 22
Replace with: Port 4242

Save and exit.


5. Restart and Verify SSH Service
Restart SSH:
sudo service ssh restart

Check status:
sudo service ssh status

6. Install UFW package

sudo apt install ufw
enable ; sudo ufw enable

7. Allow SSH Port in Firewall
sudo ufw allow 4242
sudo ufw status

8. Sudo Policies

# Create config file and log directory
touch /etc/sudoers.d/sudo_config
mkdir /var/log/sudo
nano /etc/sudoers.d/sudo_config

# Add these lines and their meaning:

Defaults passwd_tries=3
# User gets only 3 attempts to enter the sudo password.

Defaults badpass_message="Custom error message"
# Message shown when the user enters a wrong password.

Defaults logfile="/var/log/sudo/sudo_config"
# File where sudo actions (failures/errors) are logged.

Defaults log_input, log_output
# Logs what users type during sudo and what sudo commands output.

Defaults iolog_dir="/var/log/sudo"
# Directory where detailed sudo I/O logs are stored.

Defaults requiretty
# Requires sudo to be run from a terminal (adds security).

Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
# Defines the only allowed PATH when using sudo (prevents running binaries from insecure directories).


-----------------------------------
# View the main sudo log file
sudo cat /var/log/sudo/sudo_config
-------------------------------------

9. Password Policy

1. Password aging (how long passwords are valid)
nano /etc/login.defs

Edit these values:
PASS_MAX_DAYS 30     # Password expires after 30 days.
PASS_MIN_DAYS 2      # Must wait 2 days before changing password again.
PASS_WARN_AGE 7      # User gets warning 7 days before password expires.


2. Password complexity (strength rules)
sudo apt install libpam-pwquality
nano /etc/pam.d/common-password

Add after retry=3:
minlen=10 ucredit=-1 dcredit=-1 lcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root

Meaning:
minlen=10        # Minimum password length: 10 characters.
ucredit=-1       # Requires at least 1 uppercase letter.
dcredit=-1       # Requires at least 1 number.
lcredit=-1       # Requires at least 1 lowercase letter.
maxrepeat=3      # Prevents repeating the same character 3 times in a row.
reject_username  # Password cannot contain the username.
difok=7          # Must differ from previous password by at least 7 characters.
enforce_for_root # Rules also apply to root.

