<#
                                             BLOATBEGONE|
                    Author: SatanicDev
                    Version: NOT_REALEASED
                    Powershell_Version

#>

$global:JOBLIST = {"RemoveWinBloatware", "UserChoice", "RevertBackToPreviousConfiguration"} # STORES JOB LISTS IN A STRING ARRAY
$global:CurrentDir = Get-Location   # GETS THE CURRENT WORKING DIRECTORY AND STORES INTO A GLOBAL VARIABLE      
$global:GetJob = Get-Job
$global:JobInput = Read-Host "  "
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
        "1"
        {
            try 
            {
                Clear-Host
                # Cheks to see if there are other jobs running 
                if ($JOBLIST[1] -in $GetJob -or $JOBLIST[2] -in $GetJob)
                {   
                    
                    Write-Host "Other Jobs Are Active`n"
                    Write-Host "Would you like to quit these jobs? Y/N`n"

                    switch ($global:JobInput.ToLower())
                    {
                        "y"
                        {
                            # Stops the current jobs
                            Stop-Job -Name $JOBLIST[1]
                            Stop-Job -Name $JOBLIST[2]
                            Clear-Host
                            main # Call main
                        }
                        "n"
                        {
                            Write-Host "Continuing the jobs"
                        }
                    }
                    
                }
            }
            catch
            {
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
            <#
                THIS TRIES TO STOP THE JOB
                THEN CATCHES AND FORCE EXITS THE PROGRAM
                IF ERROR OCCURS
            #>
            try 
            {
                Start-Job -Name $JOBLIST
                Clear-Host
                Exit
            }
            catch
            {
                $EXITLOOP
                for ($EXITLOOP = 0;$EXITLOOP -le 3;Start-Sleep 3)
                {
                    try 
                    {
                        Exit    
                    }
                    catch 
                    {
                        Exit            <#
                            THIS WILL BE CHANGED LATER 
                            TO MORE ERROR CHECKING
                        #>
                    }
                }
            }
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
    try 
    {
        Clear-Host
        Start-Job -FilePath .\RemoveWindowsBloatware.ps1 -Name "RemoveWindowsBloatWare"
        Clear-Host
        Start-Process .\RemoveWindowsBloatware.ps1
    }
    catch 
    {
        
    }

}
<#
    THIS WILL ALLOW THE USER TO 
    CHOOSE WHICH SETTINGS/CONFIGURATIONS
    THEY WANT TO REMOVE BY CALLING AN EXTERNAL POWERSHELL PROGRAM 
    WITHIN THE CURRENT PSSESSION
#>
function UserChoice
{
    try 
    {
        
    }
    catch 
    {

    }
}

<#
    CALLS AN EXTERNAL POWERSHELL SCRIPT THAT 
    ALLOWS THE USER TO REVERT BACK TO THEIR PREVIOUS
    CONFIGURATION
#>
    function RevertBackToPreviousConfiguration
{
    try 
    {
        
    }
    catch 
    {

    }
}
main

