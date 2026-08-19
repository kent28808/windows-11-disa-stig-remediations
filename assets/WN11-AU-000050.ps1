<#
.SYNOPSIS
    This PowerShell script remediates WN11-AU-000050 by enabling success auditing for process creation events.  Also enables the WN11-SO-000030 advanced audit-policy prerequisite.

.NOTES
    Author          : Ken T.
    LinkedIn        : linkedin.com/in/kent28808/
    GitHub          : github.com/kent28808
    Date Created    : 2026-08-18
    Last Modified   : 2026-08-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000050
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000050/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-AU-000050.ps1 
#>

$ErrorActionPreference = 'Stop'

# Enable advanced audit subcategories over legacy audit categories.
New-ItemProperty `
    -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' `
    -Name 'SCENoApplyLegacyAuditPolicy' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

# Enable Process Creation success auditing.
& auditpol.exe /set "/subcategory:Process Creation" /success:enable

if ($LASTEXITCODE -ne 0) {
    throw "Failed to configure Process Creation auditing."
}

# Display the resulting configuration.
& auditpol.exe /get "/subcategory:Process Creation"
