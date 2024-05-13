# Simulating a Service Desk Environment - for IT Support Training 

This project aims to provide *hands-on training* and *troubelshooting excercises* to IT Support Trainees, by building a realistic and scalable virtual environment, that mirrors an organisation's IT systems.

![Diagram](IMG_Virtual-Infra-Diagram.png)

> This project was originally created as a troubleshooting lab for my own professional development, but  has been adapted to work within the context of a hypothetical service desk environment.

## 🛠 Tools & Technologies:

<table>
  <tr>
    <th>Virtualization & Systems</th>
    <th>Networking & Security</th>
  </tr>
  <tr>
    <td>
      <img src="https://cdn.worldvectorlogo.com/logos/microsoft-windows-11.svg" alt="Windows 10/11" width="40" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/windows-server-2.svg" alt="Windows Server OS" width="40" height="48">
      <img src="https://www.svgrepo.com/show/448257/vmware.svg" alt="VMware" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/android-logomark.svg" alt="Android" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/macos.svg" alt="Mac OS" width="50" height="48">
    </td>
    <td>
      <img src="https://visualpharm.com/assets/607/Web%20Address-595b40b75ba036ed117d9e75.svg" alt="TCP/IP" width="48" height="48">
      <img src="https://symbols.getvecta.com/stencil_28/34_dns.c3424055dc.svg" alt="DNS" width="48" height="48">
      <img src="https://www.techopedia.com/wp-content/uploads/2023/08/VPN.svg" alt="VPN" width="48" height="48">
      <img src="https://symbols.getvecta.com/stencil_23/18_iam-mfa-token.77039742f8.svg" alt="MFA" width="48" height="48">
      <img src="https://www.svgrepo.com/show/444385/gui-firewall.svg" alt="Firewalls" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/symantec-logo10.svg" alt="Symantec Endpoint Security" width="100" height="48">
    </td>
  </tr>
  <tr>
    <th>Management Systems</th>
    <th>Collaboration/Productivity</th>
  </tr>
  <tr>
    <td>
      <img src="https://cdn.worldvectorlogo.com/logos/Microsoft-365.svg" alt="Microsoft 365" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/azure-active-directory.svg" alt="Entra ID" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/microsoft-exchange.svg" alt="Exchange Online" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/active-directory-1.svg" alt="Active Directory" width="130" height="48">
    </td>
    <td>
      <img src="https://cdn.worldvectorlogo.com/logos/outlook-1.svg" alt="Outlook" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/microsoft-teams-1.svg" alt="Teams" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/microsoft-sharepoint.svg" alt="SharePoint Online" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/onedrive-1.svg" alt="OneDrive for Business" width="48" height="48">
      <img src="https://cdn.worldvectorlogo.com/logos/office-2.svg" alt="MS Office Suite" width="48" height="48">
   </td>
  </tr>
    <tr>
    <th>Scripting & Automation</th>
    <th>Remote Desktop Support</th>
  </tr>
  <tr>
    <td>
      <img src="https://cdn.worldvectorlogo.com/logos/powershell.svg" alt="PowerShell" title="PowerShell" width="48" height="48">
    </td>
    <td>
      <img src="https://linuxkamarada.com/files/2020/02/preferences-desktop-remote-desktop.svg" alt="Windows Quick Assist" title="Windows Quick Assist" width="48" height="48">
      <img src="https://visualpharm.com/assets/181/Administrative%20Tools-595b40b65ba036ed117d3b21.svg" alt="RSAT" title="RSAT (Remote Server Administration Tools)" width="48" height="48">
      <img src="https://symbols.getvecta.com/stencil_27/66_remoteapp.ec6c630580.svg" alt="RDP" title="RDP (Remote Desktop Protocol)" width="48" height="40">
      <img src="https://cdn.worldvectorlogo.com/logos/team-viewer.svg" alt="TeamViewer" title="TeamViewer" width="125" height="48">
   </td>
  </tr>
</table>

<details><summary>Tools & Technologies - Listed</summary>
  
- <ins>**Virtualization & Systems:**</ins> `VMware` , `Windows 10/11` , Windows `Server OS` , `Mac OS` , `Android`
- <ins>**Networking & Security:**</ins> `TCP/IP` , `DNS/DHCP` , `VPN` , `Symantec` Endpoint Security (Antivirus)
- <ins>**Management Systems:**</ins> `Microsoft 365/Entra ID` , `Active Directory` , `Exchange` Online , `Intune` (MDM)
- <ins>**Collaboration/Productivity:**</ins> `Outlook` , `Teams` , `SharePoint` Online , `OneDrive` , `MS Office` Suite
- <ins>**Scripting/Automation:**</ins> `PowerShell`
- <ins>**Remote Support:**</ins> `TeamViewer` , `Quick Assist` , `RSAT` , `RDP`
- <ins>**Ticketing System:**</ins> `Jira` Service Management
- <ins>**Documentation:**</ins> Project Writing (markdown/HTML) , Diagramming , Troubleshooting Instructions , Support Guides , Video Tutorials

</details>

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

To address these challenges, the **IT manager** tasked me with developing a <ins>virtual Support Training environment</ins> that mimics our current IT systems.

> This will provide trainees with a safe, controlled platform to **develop their troubleshooting skills** and **gain practical experience**, better preparing them for the realities of our live service environment.

**Core technologies/devices** to include:

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


