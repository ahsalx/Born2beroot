# Born2BeRoot 🐧🔐

<p align="center">
  <img src="https://github.com/ahsalx/Born2beroot/blob/main/born2beroot.gif" alt="Born2BeRoot Demo" width="700">
</p>

---

> *This project was created as part of the **42 curriculum** by **aben-sal**.*

## 📌 Project Overview

Born2BeRoot is a system administration project where I installed and configured a Linux operating system inside a virtual machine while applying strict security and system rules.

The main objective of this project was to understand how a Linux server works internally and how to secure it properly using best practices.

---

## 🎯 What I Learned

During this project, I learned how to:

- 🔑 Use **SSH** to securely connect to a virtual machine  
- 👤 Manage **users, groups, and permissions**  
- 🔥 Configure and manage a **firewall**  
- 🔐 Apply **password policies** and authentication rules  
- 🛡️ Understand Linux security modules and their purpose  
- 🖥️ Work with **virtual machines** and server environments  

This project helped me build a strong foundation in Linux system administration and security.

---

## ▶️ How to Run the Project

1. Open **VirtualBox**
2. Start the virtual machine
3. Log in using the configured user account

Once logged in, the system is ready to be evaluated.

---

## 🧾 Virtual Machine Verification

### 🔍 Checking the Signature

A `signature.txt` file is provided to verify the integrity of the virtual machine.

#### Steps

1. Open a terminal on your **host machine**
2. Navigate to the folder containing the virtual machine file
3. Run the following command:

```bash
shasum born2beroot.vdi
```

4. Compare the output with the content of `signature.txt` using:  
👉 https://text-compare.com/

If both values are identical, the virtual machine is verified.

---

## 🖥️ Opening the Virtual Machine

1. Open **VirtualBox**
2. Clone the provided `.vdi` file
3. Start the virtual machine
4. Log in with the configured credentials

---

## 🧪 System Checks

### 🐧 Operating System

```bash
cat /etc/os-release
```

### 🖼️ Graphical Environment

```bash
systemctl get-default
```

### 💽 Disk Partitions

```bash
lsblk
```

### 🔒 SSH Root Login Disabled

```bash
sudo nano /etc/ssh/sshd_config
```

```text
PermitRootLogin no
```

---

## ⚖️ Technical Choices & Comparisons

### 🐧 Operating System Choice

I chose **Debian** because it is stable, well-documented, and beginner-friendly for a first server setup.

#### Debian vs Rocky Linux

- **Debian**: easier to install and configure  
- **Rocky Linux**: more enterprise-oriented and complex  

---

### 🛡️ Security System

#### AppArmor vs SELinux

Both AppArmor and SELinux restrict what programs are allowed to do, limiting potential damage if a service is compromised.

- **AppArmor**: easier to manage and understand  
- **SELinux**: more powerful but more complex  

Reference: https://www.baeldung.com/linux/selinux-vs-apparmor

I used AppArmor, which is enabled by default on Debian, with default profiles.

---

### 🔥 Firewall

#### UFW vs firewalld

- **UFW**: simple rule-based firewall with direct port control  
- **firewalld**: zone-based firewall, more complex  

I chose UFW because it is easier to configure and sufficient for basic security needs.

---

### 🧰 Virtualization Software

#### VirtualBox vs UTM

- **VirtualBox**: cross-platform and widely used  
- **UTM**: mainly used on macOS  

I chose VirtualBox because it is compatible with Ubuntu, which is used on 42 computers.

---

## 🧠 Design Decisions

- 📦 Basic disk partitioning  
- 🔑 SSH enabled for remote access  
- 🧯 Only essential services installed  
- 🔐 Strong user and password policies  

All decisions were made to keep the system simple, secure, and compliant with the project requirements.

---

## 📚 Resources

### 📖 Official Documentation

- Debian Documentation: https://www.debian.org/doc/  
- VirtualBox Manual: https://www.virtualbox.org/manual/ch01.html  
- AppArmor Project: https://gitlab.com/apparmor/apparmor  
- UFW Documentation: https://wiki.ubuntu.com/UncomplicatedFirewall  
- OpenSSH Manual: https://www.openssh.com/manual.html  
- Crontab: https://crontab.guru/  

### 👥 Community Guides

- Commands and notes I used: https://rentry.co/born2beroot  
- chlimous Guide: https://github.com/chlimous/42-born2beroot_guide  

---

## 🤖 AI Usage

AI tools were used to help me understand concepts such as firewalls, UFW, and Linux security mechanisms.
