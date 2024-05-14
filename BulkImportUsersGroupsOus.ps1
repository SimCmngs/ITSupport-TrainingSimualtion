# Bulk import ous, groups, and users from csv templates | Active Directory
# Author: Sim Cmngs

# Import active directory module for running AD cmdlets
Import-Module activedirectory

##############################
# Organizational Units (OUs) #
##############################

# Store the data from OUs CSV in the $ADOU variable. CSV template needs the following headers-> name, path
$ADOU = Import-Csv c:\Scripts\ous_vgm.csv

# Loop through each row containing OU details in the CSV file to create OUs
foreach ($ou in $ADOU) {
    # Read data from each field in each row and assign the data to variables
    $name = $ou.name
    $path = $ou.path

    # Create an OU using the data read from the CSV file
    New-ADOrganizationalUnit `
        -Name $name `
        -Path $path
}

########################
# Groups Creation #
########################

# Store the data from groups CSV in the $groups variable
$groups = Import-Csv c:\Scripts\groups_vgm.csv

# Check if OUs are created before proceeding with group creation
if ($ADOU.Count -eq 0) {
    Write-Warning "No OUs were created. Please ensure OUs are created before creating groups."
}
else {
    # Loop through the CSV to create groups
    foreach ($group in $groups) {
        $groupProps = @{
            Name          = $group.name
            Path          = $group.path
            GroupScope    = $group.scope
            GroupCategory = $group.category
            Description   = $group.description
        }

        # Create groups using the data read from the CSV file
        New-ADGroup @groupProps
    }
}

########################
# Users Creation #
########################

# Store the data from users CSV in the $Users variable
$Users = Import-Csv c:\Scripts\users_vgm.csv

# Check if groups are created before proceeding with user creation
if ($groups.Count -eq 0) {
    Write-Warning "No groups were created. Please ensure groups are created before creating users."
}
else {
    # Loop through each row containing user details in the CSV file
    foreach ($User in $Users) {
        # Read user data from each field in each row
        $Username = $User.SamAccountName

        # Check if the user already exists in AD
        if (Get-ADUser -Filter {SamAccountName -eq $Username}) {
            Write-Warning "A user account with username $Username already exists in Active Directory."
        }
        else {
            # Create a hashtable for splatting the parameters
            $userProps = @{
                SamAccountName         = $User.SamAccountName                   
                Path                   = $User.Path      
                GivenName              = $User.GivenName 
                Surname                = $User.Surname
                Initials               = $User.Initials
                Name                   = $User.Name
                DisplayName            = $User.DisplayName
                UserPrincipalName      = $user.UserPrincipalName 
                Department             = $User.Department
                Description            = $User.Description
                Office                 = $User.Office
                OfficePhone            = $User.OfficePhone
                StreetAddress          = $User.StreetAddress
                POBox                  = $User.POBox
                City                   = $User.City
                State                  = $User.State
                PostalCode             = $User.PostalCode
                Title                  = $User.Title
                Company                = $User.Company
                Country                = $User.Country
                EmailAddress           = $User.Email
                AccountPassword        = (ConvertTo-SecureString $User.Password -AsPlainText -Force) 
                Enabled                = $true
                ChangePasswordAtLogon  = $true
            }

            # Create the new user account using the data read from the CSV file
            New-ADUser @userProps
        }
    }
}
