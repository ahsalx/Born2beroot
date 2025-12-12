# README.md

*This project has been created as part of the 42 curriculum by
aben-sal.*

# Born2BeRoot

Born2BeRoot teaches basic Linux system admin by setting up a secure VM.

## Description

**Key Skills** - Virtualization and disk partitioning - Users, groups,
and SSH setup - Firewall and security controls (AppArmor/SELinux) -
System hardening basics

**Project Focus** Compare Linux distros (Debian vs Rocky), firewalls
(UFW vs firewalld), security tools, and VM software (VirtualBox vs UTM)
to choose the best for learning.

------------------------------------------------------------------------

## Instructions

### 1. Virtual Machine Setup

1.  Install **VirtualBox** (recommended) or **UTM** (required for Apple
    Silicon).
2.  Create a virtual machine according to the project specifications.
3.  Install **Debian** (selected OS).
4.  Configure hostname, partitions, and network settings.
5.  Perform a minimal installation to reduce system footprint.

### 2. User & Group Management

-   Create a non-root user with sudo privileges.
-   Configure sudo to enforce:
    -   restricted password attempts
    -   custom error messages
    -   secure PATH
    -   input/output logging
-   Apply password complexity, rotation, and usage rules using
    `login.defs` and `libpam-pwquality`.

### 3. Security Hardening

-   Enable and enforce **AppArmor**.
-   Configure SSH:
    -   change default port
    -   disable root login
    -   restrict authentication methods
-   Enable **UFW** with required rules.
-   Verify all services are enabled at boot and properly logged.

### 4. Logging & Services

-   Ensure SSHD, UFW, AppArmor, and system logging services are active.
-   Verify logs in `/var/log` (sudo logs, authentication logs, UFW logs,
    journal logs).

------------------------------------------------------------------------

## Resources

### Official Documentation

-   Debian Documentation: https://www.debian.org/doc/
-   AppArmor Project: https://gitlab.com/apparmor/apparmor
-   UFW Documentation: https://wiki.ubuntu.com/UncomplicatedFirewall
-   OpenSSH Manual: https://www.openssh.com/manual.html
-	crontab : https://crontab.guru/

### Community Guides

-   Born2beRoot My Guide: https://rentry.org/born2beroot
-   chlimous Guide: https://github.com/chlimous/42-born2beroot_guide

### AI Usage

AI was used only to help understand certain concepts that im not
famailiar with like firewall and UFW.

------------------------------------------------------------------------

## Operating System Choice: Debian

### Pros

-   Extremely stable
-   Large community and documentation
-   Lightweight and minimal, reducing attack surface
-   Fast security patches

### Cons

-   Older software versions
-   Not oriented toward enterprise RHEL workloads

------------------------------------------------------------------------

# Required Comparisons

## Debian vs Rocky Linux

  -----------------------------------------------------------------------
  Aspect             Debian                    Rocky Linux
  ------------------ ------------------------- --------------------------
  Base               Its own stable base       Red Hat Enterprise clone

  Package Manager    APT (simple)              DNF/RPM (complex)

  Focus              Easy + super stable       Big company servers

  MAC System         AppArmor (easy)           SELinux (advanced)

  Ideal Use Case     Learning, small servers   Business production
  -----------------------------------------------------------------------

**Conclusion:**\
Debian's simplicity and stability make it ideal for this project.

------------------------------------------------------------------------

## AppArmor vs SELinux

### AppArmor

**Pros:** - Easy to set up and use - Uses simple profiles - Lower risk
of misconfiguration

**Cons:** - Offers less fine-grained control

### SELinux

**Pros:** - Very detailed security control - Works well in Red Hat
systems

**Cons:** - Harder to learn and configure - Can cause unexpected
permission problems

**Conclusion:** AppArmor is easier to use and a better fit for Debian
and learning purposes.

------------------------------------------------------------------------

## UFW vs firewalld

### UFW

-   Simple and user-friendly
-   Great for Debian and Ubuntu
-   Easy command syntax

### firewalld

-   More advanced, zone-based system
-   Used on Red Hat and Rocky Linux
-   Allows live rule changes

**Conclusion:** UFW fits best with Debian's simplicity and the project's
goals.

------------------------------------------------------------------------

## VirtualBox vs UTM

### VirtualBox

**Pros:** - Full of useful features - Good performance on Intel/AMD -
Strong network and snapshot support

**Cons:** - Needs kernel modules

### UTM

**Pros:** - Works on Apple Silicon - Simple and clean interface

**Cons:** - Slower performance - Fewer features overall

**Conclusion:** Use VirtualBox unless you're on Apple Silicon --- then
UTM is required.
