*This project has been created as part of the 42 curriculum by aben-sal.*

# Born2BeRoot

## What the Project Is About

The goal is to install a Linux operating system on a virtual machine and set it up correctly and securely, following the project requirements.

## The Goal Is to Know

- SSH: connecting to the virtual machine remotely.
- User and permission management: understanding who can log in and what they are allowed to do.
- Basic services and security rules: firewall, password policy, and system protections.

## How to Run It

- Open the virtual machine software VirtualBox
- Start the virtual machine
- Log in to the system using the configured user account  

## Instructions

### Checking the Signature

A `signature.txt` file is provided to verify the virtual machine.

To check it:

- Open a terminal on your host machine  
- Go to the folder containing the virtual machine file  
- Run the following command:

```bash
shasum born2beroot.vdi
```

- Compare the output with the content of the provided signature file using:  
  https://text-compare.com/

If both values are identical, the virtual machine is verified.

### Opening the Virtual Machine (VirtualBox)

To open the virtual machine:

- Open VirtualBox  
- Clone the virtual machine (`.vdi`)  
- Start the virtual machine  
- Log in using the configured user credentials  

Once the virtual machine starts, the project is ready to be checked.

---

## Required Comparisons

### Operating System Choice

I chose Debian because it is more beginner-friendly and easier to work with for a first server setup.

#### Debian vs Rocky Linux

- Debian: easier to install and configure, less strict  
- Rocky Linux: more enterprise-oriented, more complex  

### Security System

#### AppArmor vs SELinux
- Both are security control systems that control what programs can do. Even if a program is hacked, it cannot go beyond its allowed permissions.

- AppArmor is easier to manage and understand
- SELinux is more powerful but more complex.
https://www.baeldung.com/linux/selinux-vs-apparmor

AppArmor is enabled by default on Debian, and I used the default profiles without manual configuration.

### Firewall

#### UFW vs firewalld

UFW directly opens or closes ports, while firewalld uses predefined zones that decide what is allowed. (more complex)

UFW was chosen because it is easier to configure for basic needs.

### Virtualization Software

#### VirtualBox vs UTM

- VirtualBox: commonly used and works on most systems  
- UTM: mainly used on macOS  

VirtualBox was chosen because it is compatible with Ubuntu, which is the operating system used on 42 computers.

## Design Choices
- Basic disk partitioning
- SSH enabled for remote access
- Limited services installed
- Simple user and password rules

---

## Resources

### Official Documentation

- Debian Documentation: https://www.debian.org/doc/  
- VirtualBox Manual: https://www.virtualbox.org/manual/ch01.html  
- AppArmor Project: https://gitlab.com/apparmor/apparmor  
- UFW Documentation: https://wiki.ubuntu.com/UncomplicatedFirewall  
- OpenSSH Manual: https://www.openssh.com/manual.html  
- Crontab: https://crontab.guru/  

### Community Guides

- instructions and commands i've used: https://rentry.co/born2beroot
- chlimous Guide: https://github.com/chlimous/42-born2beroot_guide  

### AI Usage

AI was used to help understand certain concepts that I was not familiar with, such as firewall and UFW.