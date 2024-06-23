<#Error handling in PowerShell is a process of analyzing your code for 
where exceptions could occur, anticipating what exceptions could happen, 
and then writing code that handles those exceptions. #>
<#To implement error handling in PowerShell, you can follow three steps:

1. Identify where an error may occur: Identify the command or line of code where the error might occur.
2. Put the command inside a try { } block: This block will run the command and catch any exceptions that occur.
3. Put inside a catch { } block what should be done if the error happens:
   This block will specify what actions to take if an exception occurs.#>

# There are some ways of error handling with try-catch
# We can wrap the whole method inside this try-catch so 
# we can see the error message

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

<#In this example, the try block runs the commands to retrieve information about the computer and operating system.
 If an exception occurs, the catch block will execute and print an error message to the console.#>
 <#It’s also important to note that you can use the -ErrorAction parameter to specify how PowerShell should handle errors.
  For example, you can set -ErrorAction Stop to stop the script if an error occurs, or -ErrorAction Continue 
  to continue running the script if an error occurs.#>

###$ErrorActionPreference
# Another way of try-catch 

$ErrorActionPreference="Stop"

try {
    $folderPath="/home/home/PC01/PS//ErrorHandling01"
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

<#The finally block in PowerShell is used to execute a set of statements regardless of 
whether an error occurred or not. It is not mandatory to use the finally block, 
but it can be useful in certain situations.#>

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