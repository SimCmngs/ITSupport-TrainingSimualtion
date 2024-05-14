# Create new share files and define access permissions | Active Directory
# Author: Sim Cmngs


# Define share information
$shares = @(
    @{
        Name = "ART_data"
        Path = "S:\Shares\ART_data"
        Description = "Shared folder for ART files"
        Department = "ART"
    },
    @{
        Name = "AUDIO_data"
        Path = "S:\Shares\AUDIO_data"
        Description = "Shared folder for AUDIO files"
        Department = "AUDIO"
    },
    @{
        Name = "DESIGN_data"
        Path = "S:\Shares\DESIGN_data"
        Description = "Shared folder for DESIGN files"
        Department = "DESIGN"
    },
    @{
        Name = "IT_data"
        Path = "S:\Shares\IT_data"
        Description = "Shared folder for IT files"
        Department = "IT"
    },
    @{
        Name = "PRODUCTION_data"
        Path = "S:\Shares\PRODUCTION_data"
        Description = "Shared folder for PRODUCTION files"
        Department = "PRODUCTION"
    },
    @{
        Name = "PROGRAMMING_data"
        Path = "S:\Shares\PROGRAMMING_data"
        Description = "Shared folder for PROGRAMMING files"
        Department = "PROGRAMMING"
    },
    @{
        Name = "QA_data"
        Path = "S:\Shares\QA_data"
        Description = "Shared folder for QA files"
        Department = "QA"
    },
    @{
        Name = "TECH-ART_data"
        Path = "S:\Shares\TECH-ART_data"
        Description = "Shared folder for TECH-ART files"
        Department = "TECH-ART"
    }
)

foreach ($share in $shares) {
    # Error handling - check if the path is valid and accessible
    if (-not (Test-Path $share.Path)) {
        Write-Warning "Path $($share.Path) does not exist or is inaccessible."
        continue  # Skip to the next iteration
    }

    try {
        # Create the new share using the New-SmbShare cmdlet
        New-SmbShare -Name $share.Name -Path $share.Path -Description $share.Description -FullAccess "Everyone" -FolderEnumerationMode AccessBased -ErrorAction Stop

        # Set permissions on the folder using the Set-Acl cmdlet
        $acl = Get-Acl $share.Path

        # Define access rules
        $accessRules = @(
            @{
                Principal = "BUILTIN\Administrators"
                Permission = "FullControl"
                Inheritance = "None"  # Disable inheritance
                AppliesTo = "ThisFolder,Subfolders,Files"
            },
            @{
                Principal = "NT AUTHORITY\SYSTEM"
                Permission = "FullControl"
                Inheritance = "None"  # Disable inheritance
                AppliesTo = "ThisFolder,Subfolders,Files"
            },
            @{
                Principal = "CREATOR OWNER"
                Permission = "FullControl"
                Inheritance = "None"  # Disable inheritance
                AppliesTo = "Subfolders,Files"
            },
            @{
                Principal = "access-ShareFiles-$($share.Department)-ReadOnly"
                Permission = @("Traverse","ListDirectory","ReadAttributes","ReadExtendedAttributes","ReadPermissions")
                Inheritance = "None"  # Disable inheritance
                AppliesTo = "ThisFolder,Subfolders,Files"
            },
            @{
                Principal = "access-ShareFiles-$($share.Department)-ReadWrite"
                Permission = @("Traverse","ListDirectory","ReadAttributes","ReadExtendedAttributes","CreateFiles","CreateDirectories","WriteAttributes","WriteExtendedAttributes","ReadPermissions")
                Inheritance = "None"  # Disable inheritance
                AppliesTo = "ThisFolder,Subfolders,Files"
            },
            @{
                Principal = "access-ShareFiles-$($share.Department)-Modify"
                Permission = @("Traverse","ListDirectory","ReadAttributes","ReadExtendedAttributes","CreateFiles","CreateDirectories","WriteAttributes","WriteExtendedAttributes","Delete","ReadPermissions")
                Inheritance = "None"  # Disable inheritance
                AppliesTo = "ThisFolder,Subfolders,Files"
            }
        )

        # Add access rules to the ACL
        foreach ($rule in $accessRules) {
            $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($rule.Principal, $rule.Permission, $rule.Inheritance, "None", "Allow")
            $acl.AddAccessRule($accessRule)
        }

        # Set the ACL on the folder
        Set-Acl $share.Path $acl
    } catch {
        Write-Error "Failed to create share $($share.Name). Error: $_"
    }
}
