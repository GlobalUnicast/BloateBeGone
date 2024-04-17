
<#
                                             BLOATBEGONE|
                    BloatBeGone is an application that allows the user to get freedom and control over what they choose to
                    remove perse in bloatware

#>
function main
{
    # The main menu stored in a variable
    $Menu = @(
        "
                                                                        
                                    -<------| BloatBeGone |----->-  
                                                             
            [1] Remove Windows BloatWare        [2] Choose What To and What Not to Remove
            [3] Revert Changes                  [4] Exit
        
         "
     )   
    write-host $Menu
    $UserInput = Read-Host "            "
    switch -Exact ($UserInput)
    {
        <#
            1 calls a function RemoveWindowsBloatware
            that Removes Windows Bloatware from a configuration File
            or predefined configuration 
        #>
        "1"
        {
            Clear-Host
            RemoveWindowsBloatware
        }
        <#
            This switch statement  allows the user
            to choose what to remove and will call an external program 
            that does so.
        #>
        "2"
        {
            Clear-Host
            UserChoice
        }
        <#
            Reverts Changes and runs an external program
            created by me that will revert the changes
        #>
        "3"
        {

        }
        <#
            This just straight up
            exits the application
        #>
        "4"
        {
            Clear-Host
            Exit
        }
    }
    
}
<#
    Function that removes all windows bloatware straight up
#>
function RemoveWindowsBloatware
{


}
<#

#>
function UserChoice
{

}

<#

#>
function RevertBackToPreviousConfiguration
{

}

main