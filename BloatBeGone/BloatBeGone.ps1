
<#
                                             BLOATBEGONE|
                    BloatBeGone is an application that allows the user to get freedom and control over what they choose to
                    remove perse in bloatware

#>
$JOBLIST = @(
    "ConfigRversion"
    "RemoveWindowsBloatware"
    "UserChoice"
)   
$global:CurrentDir = Get-Location   # GETS THE CURRENT WORKING DIRECTORY AND STORES INTO A GLOBAL VARIABLE
Start-Job -FilePath .\BloatBeGone.ps1 -Name "BloatBeGone" # USED FOR QUICKER ACCESS TO THE MAIN MENU            

function main
{
    <#
        GENERAL VARIABLES THAT ARE USED                 
        FOR DIFFERENT CMDLET OPERATIONS
        WITHIN THE BLOATBEGONE
        POWERSHELL PROGRAM
    #>
    $Date = Get-Date
    # The main menu stored in a variable
    $Menu = @(
        "
                                                                        
                                    -<------| BloatBeGone |----->-  
                                                             
            [1] Remove Windows BloatWare        [2] Choose What To and What Not to Remove
            [3] Revert Changes                  [4] Exit
        
         "
     )   
    Clear-Host # Clears the screen on startup and recall of the local script                         
    write-host $Menu
    $UserInput = Read-Host "        "
    switch -Exact ($UserInput)
    {
        <#
            1 calls a function RemoveWindowsBloatware
            that Removes Windows Bloatware from a configuration File
            or predefined configuration 
        #>
        "1"
        {
            try 
            {
                Clear-Host
                RemoveWindowsBloatware    
            }
            catch
            {
                <#
                    THIS POPS AN ERROR TO THE DISPLAY AND WILL EXIT THE PROGRAM
                    AFTER TEN SECONDS AND WRITES TO A LOG FILE
                #>
                Clear-Host
                Write-Host "ERROR OCCURED WITH ACCESSING THE BLOATEWARE FUNCTION
                            EITHER ON YOUR COMPUTER OR WITHIN THE SCRIPT ITSELF"
                Set-Content -Value `n$Date -Path '.\LOG DIRECTORY\BloatBeGoneLogFile.txt'
                Set-COntent -path '.\LOG DIRECTORY\BloatBeGoneLogFile.txt' -value "`nERROR OCCURED WITH ACCESSING THE BLOATWARE FUNCTION EITHER ON YOUR
                COMPUTER OR WITIN THE SCRIPT ITSELF"
                Write-Host "EXITING"
                Start-Sleep 1.5
            }
        }
        <#
            This switch statement  allows the user
            to choose what to remove and will call an external program 
            that does so.
        #>
        "2"
        {
            <#
                TRIES ACCESSING THE USERCHOICE FUNCTION
                IF NOT IT WILL EXIT AND WRITE A LOG FILE
            #>
             try 
             {
                Clear-Host
                UserChoice
             }
             catch 
             {
                Clear-Host
                Write-Host "ERROR OCCURED WITH ACCESS TO THE USERCHOICE FUNCTION
                THIS WAS EITHER CAUSED BY AN ISSUE WITH THE PROGRAM OR
                AN ISSUE ON YOUR COMPUTER
                "
                Set-Content -Value `n$Date -Path '.\LOG DIRECTORY\BloatBeGoneLogFile.txt'
                Set-Content -Path '.\LOG DIRECTORY\BloatBeGoneLogFile.txt' -value "`nERROR OCCURED WITH ACCESS TO THE USERCHOICE FUNCTION
                THIS WAS EITHER CAUSED BY AN ISSUE WITH THE SCRIPT OR AN ISSUE ON YOUR COMPUTER"
                Start-Sleep 1.5
                Stop-Job -Name "BloatBeGone"
                Exit
             }
        }
        <#
            Reverts Changes and runs an external program
            created by me that will revert the changes
        #>
        "3"
        {
            <#
                THIS WILL CALL THE FUNCTION
                THAT WILL REVERT THE CONFIGURATION BACK TO NORMAL
            #>
            try 
            {
                Clear-Host
                RevertBackToPreviousConfiguration    
            }
            catch 
            {
                Write-Host "`nTHERE WAS AN ERROR WITH CALLING THE REVERSION OF CONFIGURATION FUNCTION
                THIS MAY BE AN ISSUE WITH THE SCRIPT OR AN ISSUE WITH THE COMPUTER ITSELF"
            }
            
        }
        <#
            This just straight up
            exits the application
        #>
        "4"
        {
            Clear-Host
            Stop-Job -Name "BloatBeGone"
            Clear-Host
            Exit
        }
    }
    
}
<#
    THIS WILL BE A COMPLETE REMOVAL OF BLOATWARE 
    WHICH WILL CALL A CONFIGURATION SCRIPPT
#>
function RemoveWindowsBloatware
{


}
<#
    THIS WILL ALLOW THE USER TO 
    CHOOSE WHICH SETTINGS/CONFIGURATIONS
    THEY WANT TO REMOVE BY CALLING AN EXTERNAL POWERSHELL PROGRAM 
    WITHIN THE CURRENT PSSESSION
#>
function UserChoice
{

}

<#
    CALLS AN EXTERNAL POWERSHELL SCRIPT THAT 
    ALLOWS THE USER TO REVERT BACK TO THEIR PREVIOUS
    CONFIGURATION
#>
    function RevertBackToPreviousConfiguration
{
    
}
main

