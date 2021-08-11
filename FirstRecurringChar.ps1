<#
	Create a powershell function or cmdlet that takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns the first recurring character in that Input string.
	In 'abcdedcba', 'd' would be the first recurring character, so the cmdlet/function should return 'd' for that sample input.

#>

## take input 
$inputString = Read-Host -Prompt 'Enter any string'

[char[]]$inputChars = $inputString;
$rcObject = $null; ## empty object
$rcObject = $inputChars | Select-object $_ | Group-Object $_; ## construct object with input string characters

## check if a character appears more than 1 time and exit if found.
$rcChar = foreach ($rchar in $rcObject)
{
	if ($rChar.Count -gt 1)
	{
		$rChar.Name;
		
		## - first recurring character found. exit from loop
		break
	}
};

## print found character
if (!$rcChar) { 
	Write-Host "No recurring character in '$inputString'";
} else {
	Write-Host "First Recurring character is: '$($rcChar)'";
}