# Assign group memberships to users | Active Directory
# Author: Sim Cmngs

# Set variables
$csvPath = "c:\Scripts\users.csv"
$ouDistinguishedNames = @(
    "OU=Domain_Admins,OU=VGM Admins,DC=vgmlab,DC=org,DC=uk",
    "OU=Server_Admins,OU=VGM Admins,DC=vgmlab,DC=org,DC=uk",
    "OU=Workstation_Admins,OU=VGM Admins,DC=vgmlab,DC=org,DC=uk",
    "OU=Art,OU=VGM Users,DC=vgmlab,DC=org,DC=uk",
    "OU=Audio,OU=VGM Users,DC=vgmlab,DC=org,DC=uk",
    "OU=Design,OU=VGM Users,DC=vgmlab,DC=org,DC=uk",
    "OU=IT,OU=VGM Users,DC=vgmlab,DC=org,DC=uk",
    "OU=Production,OU=VGM Users,DC=vgmlab,DC=org,DC=uk",
    "OU=Programming,OU=VGM Users,DC=vgmlab,DC=org,DC=uk",
    "OU=QA,OU=VGM Users,DC=vgmlab,DC=org,DC=uk",
    "OU=Technical_Art,OU=VGM Users,DC=vgmlab,DC=org,DC=uk"
)

# Import users
$users = Import-Csv $csvPath

# Iterate through each OU distinguished name and each user in each OU and add them to the specified security groups
foreach ($ouDN in $ouDistinguishedNames) {
    Get-ADUser -Filter * -SearchBase $ouDN | ForEach-Object {
        $userGroup = $userGroups | Where-Object { $_.CommonName -eq $_.Name }
        if ($userGroup) {
            $userDN = $_.DistinguishedName
            try {
                $userGroup.GroupNames | ForEach-Object {
                    Add-ADGroupMember -Identity $_ -Members $userDN -ErrorAction Stop
                    Write-Host "User with DN '$userDN' added to the security group '$_'."
                }
            } catch {
                Write-Host "Error adding user with DN '$userDN' to security group: $_"
            }
        } else {
            Write-Host "User with common name '$($_.Name)' not found in OU: $ouDN"
        }
    }
}
