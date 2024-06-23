<#Error handling is a process of analyzing your code block for 
where exceptions could take place, anticipating what exceptions could happen, 
and then writing the code that handles these exceptions. #>
<#To implement error handling in PowerShell, you can follow three steps:

1. Pinpoint where an error might happen: Identify the command or line of code where the error might be found.
2. Place the command in a try block: This block will run the command and catch any exceptions that happen.
3. Place inside a catch block what should be done if the error appears:
   This try-catch block will specify the actions to take if an exception happens.#>

# There are some ways of error handling with try-catch block
# We can wrap the whole method inside this try-catch so 
# we can see the error message which will be very helpful

try {
    $folderPath="/home/home/PC01/PS/ErrorHandling01"
    $folderContents=Get-ChildItem -Path $folderPath -ErrorAction Stop
    $folderContents.foreach({
        Write-Output $_.name
    })
    Write-Output "This is after error"    
}
catch {
   Write-Output $_.Exception.Message
}

<#In this example, the try block runs commands to get information about the computer and OS.
 If an exception happens, the catch block will execute and print an error message to the console.#>
 <#It’s also important to say that you can implement the -ErrorAction parameter to determine how PowerShell should handle errors.
  For example, you can use -ErrorAction Stop to stop the script if an error appears, or -ErrorAction Continue 
  to continue running the script if an error happens.#>

###$ErrorActionPreference
# Another way of try-catch 

$ErrorActionPreference="Stop"

try {
    $folderPath="/home/PC01/PS//ErrorHandling01"
    $folderContents=Get-ChildItem -Path $folderPath 
    $folderContents.foreach({
        Write-Output $_.name
    })
    Write-Output "This is after error"    
}
catch {
   Write-Output "This is the error caught"
}

#####
# We can see all errors that happens in this section with #Error
$Error # That will show all errors
$Error[1] # That will show them based on index

#FINALLY BLOCK

<#The finally block is used to execute statements regardless of 
whether an error occurred or not. You don't have to set the finally block, 
but it can be helpful in some specific situations.#>

$ErrorActionPreference="Stop"

try {
    $folderPath="/home/PC01/PS/ErrorHandling01"
    $folderContents=Get-ChildItem -Path $folderPath 
    $folderContents.foreach({
        Write-Output $_.name
    })
    Write-Output "This is after error"    
}
catch {
   Write-Output "This is the error caught"
}finally{
    Write-Output "finally block always run even an error doesn't occur"
}