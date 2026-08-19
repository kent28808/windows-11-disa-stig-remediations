<#
.SYNOPSIS
    This PowerShell script remediates WN11-CC-000197 by disabling Microsoft consumer experiences.

.NOTES
    Author          : Ken T.
    LinkedIn        : linkedin.com/in/kent28808/
    GitHub          : github.com/kent28808
    Date Created    : 2026-08-18
    Last Modified   : 2026-08-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000197
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000197/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000197.ps1 
#>

$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent'
$name = 'DisableWindowsConsumerFeatures'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 1 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 1) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Output '[PASS] WN11-CC-000197 is compliant.'
Write-Output "$name = $value (REG_DWORD)"
