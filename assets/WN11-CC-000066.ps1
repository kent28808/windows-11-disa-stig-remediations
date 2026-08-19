<#
.SYNOPSIS
    This PowerShell script remediates WN11-CC-000066 by including command-line data in process creation events.

.NOTES
    Author          : Ken T.
    LinkedIn        : linkedin.com/in/kent28808/
    GitHub          : github.com/kent28808
    Date Created    : 2026-18-08
    Last Modified   : 2026-18-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000066
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000066/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000066.ps1 
#>

$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit'
$name = 'ProcessCreationIncludeCmdLine_Enabled'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 1 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 1) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Host '[PASS] WN11-CC-000066 is compliant.' -ForegroundColor Green
Write-Host "$name = $value (REG_DWORD)"
