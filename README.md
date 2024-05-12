# Simulating a Service Desk Environment - for IT Support Training 

This project aims to provide *hands-on training* and *troubelshooting excercises* to IT Support Trainees, by building a realistic and scalable virtual environment, that mirrors an organisation's IT systems.

![Diagram](IMG_Virtual-Infra-Diagram.png)

> This project was originally created as a troubleshooting lab for my own professional development, but  has been adapted to work within the context of a hypothetical service desk environment.

## 🛠 Tools & Technologies:

- **Virtualization & Systems:** `VMware`, `Windows 10/11`, Windows `Server OS`, `Mac OS`, `Android`
- **Networking & Security:** `TCP/IP`, `DNS/DHCP`, `VPN`, `Symantec` Endpoint Security *(Antivirus)* 
- **Management Systems:** `Microsoft 365/Entra ID`, `Active Directory`, `Exchange` Online, `Intune` *(MDM)*
- **Collaboration/Productivity:** `Outlook`, `Teams`, `SharePoint` Online, `OneDrive`, `MS Office` Suite
- **Scripting/Automation:** `PowerShell`
- **Remote Support:** `TeamViewer`, `Quick Assist`, `RSAT`, `RDP` 
- **Ticketing System:** `Jira` Service Management
- **Documentation:** Project Writing *(markdown/HTML)*, Diagramming, Troubleshooting Instructions, Support Guides, Video Tutorials

---

# Introduction

The **IT Manager** has noticed a concerning decline in customer satisfaction rates, with feedback of: 
- High **Ticket Escalation rates**
- Prolonged **Resolution times**
- Missed **Service Level Agreement** (SLA) **targets**

> These metrics were the result of the **1st Line Support team** coming from external training programs, that were putting a <ins>focus on theory rather than hands-on expeirence</ins>.
>
> This lack of hands-on experience left trainees <ins>unable to troubleshoot</ins> and resolve a wide range of cusomter's issues, which negatively affected our service desk's operational and support quality.

---

## ⛔ Problem Statement:
Challenges of the service desk included:

- ❌ Frequent escalation to higher-level support engineers
  - *(metric affected: low first contact resolution rates ~ FCRs)*
- ❌ Backlog of unresolved support tickets
  - *(metric affected: prolonged resolution times ~ TTRs)*
- ❌ Declining customer satisfaction scores
  - *(measured from: negative customer reviews and surveys)*

## 💡 Solution:

To address these challenges, the **IT manager** tasked me with developing a <ins>virtual support training environment</ins> that mimics our current IT systems.

> This will provide the trainees with a safe, controlled platform to **develop their troubleshooting skills** and **gain practical experience**, better preparing them for the realities of our live service environment.

**Core technologies and devices** to include:

1. <ins>**Virtual Servers** *(Vmware)*</ins>  

   - <ins>**Domain** Controller</ins>: *on-premises Active Directory environment*
   - <ins>**File/Print** Server</ins> *file sharing and print management*
   - <ins>**VPN** Server</ins>: *secure-remote access to company resources*
   - <ins>Endpoint **Security**</ins>: *Symantec's 'endpoint-managed' antivirus solution*

2. <ins>**Virtual Workstations** *(Vmware)*</ins>   

   - <ins>**Helpdesk** PC</ins>: *dedicated workstation for IT support staff, with Remote Admin Tools (RSAT)*
   - <ins>**Windows** 10/11 PCs</ins>: *majority of the end-user's devices*
   - <ins>**Mac OS** Client</ins>: *catering to the the needs of the Art and Design teams*
   - <ins>**Android** Smartphones</ins>: *for mobile device management training*

3. <ins>**Cloud-based Management Systems** *(Microsoft 365)*</ins>   

   - <ins>**User** Management</ins>: *Microsoft 365/Entra ID - access management to resources/applications*
   - <ins>**Email** Management</ins>: *Exchange Online - administration of users' Outlook accounts*
   - <ins>**Device** Management</ins>: *Intune - practicing device enrollmment and policy enforcement*
   - <ins>**Office 365** Services</ins>: *Teams, SharePoint Online, OneDrive, and MS Office Suite*

4. <ins>**Ticketing Software** *(Cloud Instance)*</ins>

   - <ins>**Jira** Service Management</ins>: *central platform for logging, prioritising and escalating support tickets*
   - <ins>**Confluence**</ins>: *knowledge base, for public-facing users guides and FAQs*


