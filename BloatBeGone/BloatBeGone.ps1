
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
                                        BloatBeGone
            [1] Remove Windows BloatWare        [2] Choose What To and What Not to Remove
            [3] Revert Changes                  [3] Exit
        
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
            Write-host "TEST"
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

function RemoveWindowsBloatware
{


}

main