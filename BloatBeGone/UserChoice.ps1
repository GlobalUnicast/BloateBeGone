<#
    POWERSHELL SCRIPT/PROGRAM USED FOR DETERMINGING WHAT THE USER
    WANTS TO ENABLE + DISABLE
#>

function UserChoice
{
        $USERCHOICE = @(
        "
        [1] REMOVE ALL XBOX SERVICES/APPLICATIONS
        [2] REMOVE ALL MICROSOFT APPLICATIONS
        [3] REMOVE BOTH MICROSOFT & XBOX APPLICATIONS
        [4] 
    
         "
    )

    Write-Host $USERCHOICE
    $GetUserInupt = Read-Host "   "

    Switch  ($GetUserInupt)
    {
        "1"
        {

        }
        "2"
        {

        }
        "3"
        {

        }
        "4"
        {

        }

    }


}


UserChoice