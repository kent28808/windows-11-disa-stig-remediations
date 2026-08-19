<a id="top"></a>

# Windows 11 DISA STIG Remediation Lab

## Overview

This project documents the assessment, remediation, and validation of **10 selected requirements** from the **Defense Information Systems Agency (DISA) Microsoft Windows 11 Security Technical Implementation Guide (STIG)** in an authorized lab environment. Each selected requirement was evaluated using its documented check criteria, confirmed as non-compliant, remediated with PowerShell where appropriate, and rechecked to verify the resulting configuration.

A credentialed Tenable compliance audit was performed before and after remediation using the same target, credentials, scan policy, and benchmark version. The repository contains PowerShell scripts, command output, screenshots, and exported scan reports that document the work.

> **Scope:** This lab demonstrates remediation and validation of 10 selected STIG requirements. It does not certify the entire system as STIG-compliant or represent an authorization decision for a production environment.

---

## Table of Contents

- [Objectives](#objectives)
- [Lab Environment](#lab-environment)
- [Lab Architecture](#lab-architecture)
- [Methodology](#methodology)
- [Phase 1: Baseline Compliance Assessment](#phase-1-baseline-compliance-assessment)
- [Phase 2: Individual STIG Remediations](#phase-2-individual-stig-remediations)
  - [STIG 01: WN11-AU-000500](#stig-01)
  - [STIG 02: WN11-AU-000050](#stig-02)
  - [STIG 03: WN11-CC-000066](#stig-03)
  - [STIG 04: WN11-CC-000326](#stig-04)
  - [STIG 05: WN11-CC-000315](#stig-05)
  - [STIG 06: WN11-CC-000180](#stig-06)
  - [STIG 07: WN11-CC-000252](#stig-07)
  - [STIG 08: WN11-CC-000197](#stig-08)
  - [STIG 09: WN11-CC-000010](#stig-09)
  - [STIG 10: WN11-CC-000330](#stig-10)
- [Phase 3: Post-Remediation Validation](#phase-3-post-remediation-validation)
- [Results Summary](#results-summary)
- [Skills Demonstrated](#skills-demonstrated)
- [Lessons Learned](#lessons-learned)
- [References](#references)
- [Disclaimer](#disclaimer)

---

## Objectives

- Establish a repeatable baseline-to-remediation workflow for Windows 11 configuration findings.
- Interpret official STIG check and fix guidance for 10 selected requirements.
- Develop clear and repeatable PowerShell remediation scripts where technically appropriate.
- Capture evidence of the non-compliant and remediated states.
- Use a credentialed Tenable audit to compare baseline and post-remediation results.
- Document limitations, manual checks, exceptions, and residual findings accurately.

---

## Lab Environment

| Component | Lab Configuration |
| --- | --- |
| Target system | `Ken-Win-11-STIGs` |
| Operating system | `Windows 11 Pro 25H2` |
| OS build | `26200.9168` |
| Deployment platform | `Azure` |
| Administrative access | `Local administrator` |
| Remediation tool | `Windows PowerShell 5.1.26100.9168` |
| Tenable platform | `Tenable Vulnerability Management` |
| Scanner engine | `Nessus 10.12.3` |
| Scan template | `Advanced Network Scan` |
| Scan name | `Win11-STIG-Implementation-KenT` |
| Audit file | `DISA_STIG_Microsoft_Windows_11_v2r7.audit` |
| DISA STIG release used | `Microsoft Windows 11 STIG, Version 2, Release 7 (V2R7)` |
| Baseline scan date | `08-16-2026` |
| Follow-up scan date | `08-18-2026` |

---

## Lab Architecture

The lab used a dedicated Windows 11 VM hosted in Microsoft Azure. Network access was restricted through an Azure Network Security Group (NSG), while authorized administrative access was used to perform PowerShell remediation and credentialed Tenable compliance assessments.

<img width="1401" height="787" alt="netarch" src="https://github.com/user-attachments/assets/4a7b4bdd-5f98-4156-be6b-7e6dde8ba810" />

*Architecture overview. Shared Log(N) Pacific Azure cyber-range environment used for this lab. Project scope was limited to the `Ken-Win-11-STIGs` Windows 11 VM and the credentialed Tenable scan path used to assess and validate the 10 selected DISA STIG requirements; the other services and member resources shown were outside the project scope.*

---

## Methodology

1. **Establish the baseline:** Run a credentialed Tenable compliance audit and record the initial result counts.
2. **Validate each finding:** Follow the applicable STIG check procedure and capture the observed non-compliant state.
3. **Remediate the setting:** Apply the required configuration with a documented PowerShell script or other approved method.
4. **Verify the change:** Rerun the same check and capture evidence that the expected value or state is present.
5. **Reassess the host:** Repeat the Tenable audit with the same target, credentials, policy, and benchmark version.
6. **Compare results:** Correlate the 10 selected STIG IDs with their final Tenable results and document any exceptions.

---

## Phase 1: Baseline Compliance Assessment

### Baseline Tenable Audit

The target was assessed with a credentialed Tenable compliance audit using **`DISA_STIG_Microsoft_Windows_11_v2r7`**. The scan identified the initial configuration state before the 10 selected requirements were remediated.

<img width="1606" height="1206" alt="initialoverview" src="https://github.com/user-attachments/assets/84f0221e-9378-40ac-9be0-e74f2d96b111" />

*Figure 1. Baseline Tenable compliance results for `Ken-Win-11-STIGs`, showing the result counts before the selected STIG remediations were applied.*

### Baseline Results

| Result | Count |
| --- | ---: |
| Passed | `100` |
| Failed | `151` |
| Warning | `12` |
| Total | `263` |

📄 **Baseline report:** [View the full Tenable baseline report](https://github.com/kent28808/windows-11-disa-stig-remediations/blob/main/assets/Win11-STIG-initialscan.pdf)

### Assessment Consistency Controls

The following conditions were kept consistent between the baseline and follow-up assessments:

- Same target host and operating-system build
- Same credential type and administrative privilege level
- Same Tenable scan template and policy settings
- Same audit file or benchmark version
- Successful authenticated/credentialed scan status
- No unrelated configuration changes during the comparison period

---

## Phase 2: Individual STIG Remediations

### Selected STIG Status

| # | STIG ID | Official Rule Title | Severity | Before | After | Script |
| ---: | --- | --- | --- | --- | --- | --- |
| 1 | `WN11-AU-000500` | The Application event log size must be configured to 32768 KB or greater. | `CAT II` | `Failed` | `Passed` | [View script](assets/WN11-AU-000500.ps1) |
| 2 | `WN11-AU-000050` | The system must be configured to audit Detailed Tracking - Process Creation successes. | `CAT II` | `Failed` | `Passed` | [View script](assets/WN11-AU-000050.ps1) |
| 3 | `WN11-CC-000066` | Command line data must be included in process creation events. | `CAT II` | `Failed` | `Passed` | [View script](assets/WN11-CC-000066.ps1) |
| 4 | `WN11-CC-000326` | PowerShell script block logging must be enabled on Windows 11. | `CAT II` | `Failed` | `Passed` | [View script](assets/WN11-CC-000326.ps1) |
| 5 | `WN11-CC-000315` | The Windows Installer feature "Always install with elevated privileges" must be disabled. | `CAT I` | `Failed` | `Passed` | [View script](assets/WN11-CC-000315.ps1) |
| 6 | `WN11-CC-000180` | Autoplay must be turned off for non-volume devices. | `CAT I` | `Failed` | `Passed` | [View script](assets/WN11-CC-000180.ps1) |
| 7 | `WN11-CC-000252` | Windows 11 must be configured to disable Windows Game Recording and Broadcasting. | `CAT II` | `Failed` | `Passed` | [View script](assets/WN11-CC-000252.ps1) |
| 8 | `WN11-CC-000197` | Microsoft consumer experiences must be turned off. | `CAT III` | `Failed` | `Passed` | [View script](assets/WN11-CC-000197.ps1) |
| 9 | `WN11-CC-000010` | The display of slide shows on the lock screen must be disabled. | `CAT II` | `Failed` | `Passed` | [View script](assets/WN11-CC-000010.ps1) |
| 10 | `WN11-CC-000330` | The Windows Remote Management (WinRM) client must not use Basic authentication. | `CAT I` | `Failed` | `Passed` | [View script](assets/WN11-CC-000330.ps1) |

<a id="stig-01"></a>

### STIG 01 - `WN11-AU-000500`: Application Event Log Size

| Field | Value |
| --- | --- |
| STIG ID | `WN11-AU-000500` |
| Vulnerability ID | `V-253337` |
| Severity | `CAT II` |
| SRG / CCI | `SRG-OS-000341-GPOS-00132` / `CCI-001849` |
| Validation | Registry |

**Requirement:** Configure the Application event log maximum size to at least `32,768 KB` (`32 MB`).

**Security rationale:** An undersized event log may overwrite audit records too quickly, reducing the evidence available for security investigations.

#### Before Remediation

```powershell
reg.exe query "HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" /v MaxSize
```

**Observed:** `MaxSize` was not configured.

<img width="1021" height="137" alt="before" src="https://github.com/user-attachments/assets/afbccc9b-600a-498a-b755-2643b559b278" />

*Figure 2. Pre-remediation validation showing that `MaxSize` was not configured.*

#### Remediation

The script creates the required registry path and configures `MaxSize` as a `REG_DWORD` with a value of `32768`.

📄 **Script:** [View the remediation script](assets/WN11-AU-000500.ps1)

```powershell
# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$valueData = 32768  # 0x00008000 in hexadecimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the MaxSize value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
```

#### Verification

The registry check was repeated after running the remediation script.

```powershell
reg.exe query "HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" /v MaxSize
```

**Observed:** `MaxSize` returned `REG_DWORD 0x8000`, equivalent to `32,768 KB`.

<img width="1046" height="125" alt="after" src="https://github.com/user-attachments/assets/84003417-68f4-401a-8156-3ebb037c5b4d" />

*Figure 3. Post-remediation validation confirming a compliant Application event log size.*

**Final result:** `Passed`

**Reference:** [WN11-AU-000500 — Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-AU-000500/)

---

<a id="stig-02"></a>

### STIG 02 - `WN11-AU-000050`: Audit Process Creation Successes

| Field | Value |
| --- | --- |
| STIG ID | `WN11-AU-000050` |
| Vulnerability ID | `V-253312` |
| Severity | `CAT II` |
| SRG ID | `SRG-OS-000064-GPOS-00033` |
| CCI | `CCI-000172`, `CCI-001814`, `CCI-003938` |
| Validation method | `Audit policy command` |

**Requirement:** Process Creation audit subcategory must record successful process-creation events.

**Security rationale:** Process-creation auditing provides evidence of programs executed on the system and supports incident detection, investigation, and forensic analysis.

#### Before Remediation

```powershell
auditpol /get /subcategory:"Process Creation"
```

**Observed state:** The baseline Tenable audit reported `No Auditing`, so successful process creation events were not being audited.

<img width="661" height="161" alt="before" src="https://github.com/user-attachments/assets/717cf108-508c-4a4f-ad0a-91ea3415df22" />

*Figure 4. Pre-remediation validation for `WN11-AU-000050`, showing that Process Creation success auditing was not enabled.*

#### Remediation

Enabled success auditing for the Process Creation subcategory.

📄 **PowerShell script:** [View the remediation script](assets/WN11-AU-000050.ps1)

```powershell
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
```

#### Verification

<img width="678" height="158" alt="after" src="https://github.com/user-attachments/assets/535f5f23-e680-4bbb-8cdc-f914433aebb1" />

*Figure 5. Post-remediation validation for `WN11-AU-000050`, confirming that Process Creation success auditing is enabled.*

**Final result:** `Passed`

**Reference:** [WN11-AU-000050 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-AU-000050/)

---

<a id="stig-03"></a>

### STIG 03 - `WN11-CC-000066`: Include Command-Line Data in Process Creation Events

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000066` |
| Vulnerability ID | `V-253367` |
| Severity | `CAT II` |
| SRG ID | `SRG-OS-000042-GPOS-00020` |
| CCI | `CCI-000135` |
| Validation method | `Registry / policy` |

**Requirement:** Windows must include command-line information in process creation audit events.

**Security rationale:** Command-line details provide additional context about how a process was started, improving the detection and investigation of suspicious or malicious activity.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit' `
    -Name 'ProcessCreationIncludeCmdLine_Enabled'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1095" height="309" alt="before" src="https://github.com/user-attachments/assets/f111976e-3bbe-430c-9e87-8e127276e660" />

*Figure 6. Pre-remediation validation for `WN11-CC-000066`, showing that `ProcessCreationIncludeCmdLine_Enabled` was not configured.*

#### Remediation

Created the required registry path if necessary and set `ProcessCreationIncludeCmdLine_Enabled` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000066.ps1)

```powershell
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
```

#### Verification

<img width="1203" height="329" alt="after" src="https://github.com/user-attachments/assets/1b709fa4-3657-4df0-a8d2-876bcbaa84ae" />

*Figure 7. Post-remediation validation for `WN11-CC-000066`, confirming `ProcessCreationIncludeCmdLine_Enabled = 1`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000066 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000066/)

---

<a id="stig-04"></a>

### STIG 04 - `WN11-CC-000326`: Enable PowerShell Script Block Logging

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000326` |
| Vulnerability ID | `V-253414` |
| Severity | `CAT II` |
| SRG ID | `SRG-OS-000042-GPOS-00020` |
| CCI | `CCI-000135` |
| Validation method | `Registry / policy` |

**Requirement:** PowerShell Script Block Logging must be enabled.

**Security rationale:** Script block logging records the content processed by PowerShell, providing valuable evidence for detecting and investigating malicious commands and scripts.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' `
    -Name 'EnableScriptBlockLogging'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1193" height="239" alt="before" src="https://github.com/user-attachments/assets/e64a1f6b-5ec2-44f7-a6fc-954d672c6ed9" />

*Figure 8. Pre-remediation validation for `WN11-CC-000326`, showing that `EnableScriptBlockLogging` was not configured.*

#### Remediation

Created the required registry path if necessary and set `EnableScriptBlockLogging` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000326.ps1)

```powershell
$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'
$name = 'EnableScriptBlockLogging'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 1 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 1) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Output '[PASS] WN11-CC-000326 is compliant.'
Write-Output "$name = $value (REG_DWORD)"
```

#### Verification

<img width="1209" height="307" alt="after" src="https://github.com/user-attachments/assets/4d6c96e6-759c-489f-8797-f7bfeaaa49e3" />

*Figure 9. Post-remediation validation for `WN11-CC-000326`, confirming `EnableScriptBlockLogging = 1`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000326 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000326/)

---

<a id="stig-05"></a>

### STIG 05 - `WN11-CC-000315`: Disable Always Install with Elevated Privileges

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000315` |
| Vulnerability ID | `V-253411` |
| Severity | `CAT I` |
| SRG ID | `SRG-OS-000362-GPOS-00149` |
| CCI | `CCI-003980`, `CCI-001812` |
| Validation method | `Registry / policy` |

**Requirement:** The Windows Installer policy named **Always install with elevated privileges** must be disabled.

**Security rationale:** Allowing Windows Installer packages to run with elevated privileges could enable a standard user or malicious application to gain administrative control of the system.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer' `
    -Name 'AlwaysInstallElevated'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1192" height="217" alt="before" src="https://github.com/user-attachments/assets/65199192-b578-43c9-98e8-d5d2dede41f3" />

*Figure 10. Pre-remediation validation for `WN11-CC-000315`, showing that `AlwaysInstallElevated` was not configured.*

#### Remediation

Created the required registry path if necessary and set `AlwaysInstallElevated` to `0` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000315.ps1)

```powershell
$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'
$name = 'AlwaysInstallElevated'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 0 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 0) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Output '[PASS] WN11-CC-000315 is compliant.'
Write-Output "$name = $value (REG_DWORD)"
```

#### Verification

<img width="1135" height="296" alt="after" src="https://github.com/user-attachments/assets/1e03a69f-64d2-4db5-ae6e-175b9b13652d" />

*Figure 11. Post-remediation validation for `WN11-CC-000315`, confirming `AlwaysInstallElevated = 0`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000315 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000315/)

---

<a id="stig-06"></a>

### STIG 06 - `WN11-CC-000180`: Disable Autoplay for Non-Volume Devices

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000180` |
| Vulnerability ID | `V-253386` |
| Severity | `CAT I` |
| SRG ID | `SRG-OS-000368-GPOS-00154` |
| CCI | `CCI-001764` |
| Validation method | `Registry / policy` |

**Requirement:** Autoplay must be disabled for non-volume devices, including Media Transfer Protocol devices.

**Security rationale:** Automatically reading content from connected devices can cause malicious code to execute without deliberate user action.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' `
    -Name 'NoAutoplayfornonVolume'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1200" height="230" alt="before" src="https://github.com/user-attachments/assets/52b412bb-6a92-464e-be99-08a6703fe848" />

*Figure 12. Pre-remediation validation for `WN11-CC-000180`, showing that `NoAutoplayfornonVolume` was not configured.*

#### Remediation

Created the required registry path if necessary and set `NoAutoplayfornonVolume` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000180.ps1)

```powershell
$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer'
$name = 'NoAutoplayfornonVolume'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 1 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 1) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Output '[PASS] WN11-CC-000180 is compliant.'
Write-Output "$name = $value (REG_DWORD)"
```

#### Verification

<img width="1152" height="293" alt="after" src="https://github.com/user-attachments/assets/f54d469f-2321-4b00-95ec-8a4f070ca1ff" />

*Figure 13. Post-remediation validation for `WN11-CC-000180`, confirming `NoAutoplayfornonVolume = 1`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000180 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000180/)

---

<a id="stig-07"></a>

### STIG 07 - `WN11-CC-000252`: Disable Windows Game Recording and Broadcasting

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000252` |
| Vulnerability ID | `V-253399` |
| Severity | `CAT II` |
| SRG ID | `SRG-OS-000095-GPOS-00049` |
| CCI | `CCI-000381` |
| Validation method | `Registry / policy` |

**Requirement:** Windows Game Recording and Broadcasting must be disabled. This requirement is not applicable to Windows 11 LTSC.

**Security rationale:** Game recording features could capture content from other applications and unintentionally expose sensitive information.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' `
    -Name 'AllowGameDVR'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1187" height="216" alt="before" src="https://github.com/user-attachments/assets/21d25c37-3e5d-415d-abd7-825f794914ae" />

*Figure 14. Pre-remediation validation for `WN11-CC-000252`, showing that `AllowGameDVR` was not configured.*

#### Remediation

Created the required registry path if necessary and set `AllowGameDVR` to `0` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000252.ps1)

```powershell
$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR'
$name = 'AllowGameDVR'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 0 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 0) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Output '[PASS] WN11-CC-000252 is compliant.'
Write-Output "$name = $value (REG_DWORD)"
```

#### Verification

<img width="1038" height="282" alt="after" src="https://github.com/user-attachments/assets/4097cec6-0ffa-49e8-8768-ff3d014c556c" />

*Figure 15. Post-remediation validation for `WN11-CC-000252`, confirming `AllowGameDVR = 0`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000252 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000252/)

---

<a id="stig-08"></a>

### STIG 08 - `WN11-CC-000197`: Disable Microsoft Consumer Experiences

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000197` |
| Vulnerability ID | `V-253390` |
| Severity | `CAT III` |
| SRG ID | `SRG-OS-000095-GPOS-00049` |
| CCI | `CCI-000381` |
| Validation method | `Registry / policy` |

**Requirement:** Microsoft consumer experiences must be turned off.

**Security rationale:** Disabling consumer experiences helps prevent unwanted suggestions, notifications, and installation of applications that are not controlled by the organization.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' `
    -Name 'DisableWindowsConsumerFeatures'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1195" height="213" alt="before" src="https://github.com/user-attachments/assets/4d450e7a-2ade-4a35-ba74-3a58c8e193d2" />

*Figure 16. Pre-remediation validation for `WN11-CC-000197`, showing that `DisableWindowsConsumerFeatures` was not configured.*

#### Remediation

Created the required registry path if necessary and set `DisableWindowsConsumerFeatures` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000197.ps1)

```powershell
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
```

#### Verification

<img width="1197" height="302" alt="after" src="https://github.com/user-attachments/assets/3628260b-ec82-49e1-b4a7-315e5918165b" />

*Figure 17. Post-remediation validation for `WN11-CC-000197`, confirming `DisableWindowsConsumerFeatures = 1`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000197 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000197/)

---

<a id="stig-09"></a>

### STIG 09 - `WN11-CC-000010`: Disable Lock-Screen Slide Shows

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000010` |
| Vulnerability ID | `V-253352` |
| Severity | `CAT II` |
| SRG ID | `SRG-OS-000095-GPOS-00049` |
| CCI | `CCI-000381` |
| Validation method | `Registry / policy` |

**Requirement:** The display of slide shows on the Windows lock screen must be disabled.

**Security rationale:** Lock-screen slide shows could expose sensitive images or information to people who have not authenticated to the system.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' `
    -Name 'NoLockScreenSlideshow'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1203" height="207" alt="before" src="https://github.com/user-attachments/assets/1a98ba4c-ac09-47c2-81a8-4ea2906fee7d" />

*Figure 18. Pre-remediation validation for `WN11-CC-000010`, showing that `NoLockScreenSlideshow` was not configured.*

#### Remediation

Created the required registry path if necessary and set `NoLockScreenSlideshow` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000010.ps1)

```powershell
$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'
$name = 'NoLockScreenSlideshow'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 1 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 1) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Output '[PASS] WN11-CC-000010 is compliant.'
Write-Output "$name = $value (REG_DWORD)"
```

#### Verification

<img width="1180" height="280" alt="after" src="https://github.com/user-attachments/assets/4645db1f-53c2-4ba4-9f9c-becb070affd5" />

*Figure 19. Post-remediation validation for `WN11-CC-000010`, confirming `NoLockScreenSlideshow = 1`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000010 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000010/)

---

<a id="stig-10"></a>

### STIG 10 - `WN11-CC-000330`: Disable Basic Authentication for the WinRM Client

| Field | Value |
| --- | --- |
| STIG ID | `WN11-CC-000330` |
| Vulnerability ID | `V-253416` |
| Severity | `CAT I` |
| SRG ID | `SRG-OS-000125-GPOS-00065` |
| CCI | `CCI-000877` |
| Validation method | `Registry / policy` |

**Requirement:** The Windows Remote Management client must not use Basic authentication.

**Security rationale:** Basic authentication can expose easily decoded credentials, increasing the risk of credential theft and unauthorized system access.

#### Before Remediation

```powershell
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' `
    -Name 'AllowBasic'
```

**Observed state:** The baseline Tenable audit returned `NULL`, indicating that the required registry value was not configured.

<img width="1179" height="210" alt="before" src="https://github.com/user-attachments/assets/f78ec7dd-41db-4bd8-9f0d-678bc4c181cc" />

*Figure 20. Pre-remediation validation for `WN11-CC-000330`, showing that `AllowBasic` was not configured.*

#### Remediation

Created the required registry path if necessary and set `AllowBasic` to `0` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](assets/WN11-CC-000330.ps1)

```powershell
$ErrorActionPreference = 'Stop'

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client'
$name = 'AllowBasic'

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

New-ItemProperty -Path $path -Name $name `
    -PropertyType DWord -Value 0 -Force | Out-Null

$value = Get-ItemPropertyValue -Path $path -Name $name

if ($value -ne 0) {
    throw "Remediation failed: $name is set to '$value'."
}

Write-Output '[PASS] WN11-CC-000330 is compliant.'
Write-Output "$name = $value (REG_DWORD)"
```

#### Verification

<img width="1083" height="278" alt="after" src="https://github.com/user-attachments/assets/d4734ffe-2030-4d73-85e4-18658ca32943" />

*Figure 21. Post-remediation validation for `WN11-CC-000330`, confirming `AllowBasic = 0`.*

**Final result:** `Passed`

**Reference:** [WN11-CC-000330 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000330/)

---

## Phase 3: Post-Remediation Validation

### Follow-Up Tenable Audit

A credentialed post-remediation audit was performed using the same target, credentials, scan configuration, and Windows 11 STIG V2R7 benchmark as the baseline assessment. The results were filtered to the 10 STIG requirements implemented in this project.

The follow-up audit confirmed that all 10 selected STIG requirements passed on the target system.

<img width="1605" height="798" alt="results" src="https://github.com/user-attachments/assets/6b490961-35e3-42ea-9bc1-5c9145f4e0f8" />

*Figure 22. Filtered post-remediation Tenable results confirming that all 10 selected Windows 11 STIG requirements passed.*

📄 **Detailed validation report:** [View the full Tenable follow-up report](assets/HostAuditsReport_08.18.2026.pdf)

### Per-STIG Tenable Correlation

| # | STIG ID | Baseline | Local Check | Follow-Up Tenable |
| ---: | --- | --- | --- | --- |
| 1 | `WN11-AU-000500` | Failed | Passed | **Passed** |
| 2 | `WN11-AU-000050` | Failed | Passed | **Passed** |
| 3 | `WN11-CC-000066` | Failed | Passed | **Passed** |
| 4 | `WN11-CC-000326` | Failed | Passed | **Passed** |
| 5 | `WN11-CC-000315` | Failed | Passed | **Passed** |
| 6 | `WN11-CC-000180` | Failed | Passed | **Passed** |
| 7 | `WN11-CC-000252` | Failed | Passed | **Passed** |
| 8 | `WN11-CC-000197` | Failed | Passed | **Passed** |
| 9 | `WN11-CC-000010` | Failed | Passed | **Passed** |
| 10 | `WN11-CC-000330` | Failed | Passed | **Passed** |

**Final result:** All **10 of 10 selected STIG requirements passed** the post-remediation Tenable audit.

📄 **Complete final scan report:** [View the Tenable final scan report](assets/Win11-STIG-finalscan.pdf)

---

## Results Summary

### Overall Compliance Results

The baseline and follow-up assessments used the same target, credentials, scan configuration, and Windows 11 STIG V2R7 benchmark.

| Result | Baseline | Follow-Up | Change |
| --- | ---: | ---: | ---: |
| Passed | `100` | `111` | `+11` |
| Failed | `151` | `140` | `-11` |
| Warning | `12` | `12` | `0` |
| **Total** | **`263`** | **`263`** | **`0`** |

> The aggregate result improved by 11 checks because the remediation for `WN11-AU-000050` also enabled `WN11-SO-000030`, the required advanced audit-policy prerequisite. The remaining 140 failed and 12 warning results were outside the scope of this project.


### Residual Findings and Limitations

- No selected STIG requirement remained failed or required manual validation after remediation.
- None of the 10 selected requirements were classified as not applicable to the Windows 11 Pro VM. The Windows 11 LTSC exception for `WN11-CC-000252` did not apply to this system.
- The detailed Host Audit report identified the target by its scanned asset address, `10.3.0.33`, rather than by the Azure VM display name.
- This lab used Windows 11 STIG V2R7 consistently for both assessments. V2R7 is now an archived release; the results demonstrate compliance with the 10 selected V2R7 requirements and should not be interpreted as validation against the latest Windows 11 STIG release.
- Registry and audit-policy checks confirmed the required local settings, while the follow-up Tenable audit provided independent scanner validation.  
- No risk exception or alternate disposition was required for the 10 selected requirements because all 10 passed the follow-up audit.
- These results demonstrate successful remediation of the selected requirements; they do not establish that the entire Windows 11 VM is fully STIG-compliant.

---

## Skills Demonstrated

- DISA Windows 11 STIG interpretation and control assessment
- Windows 11 security configuration and hardening
- Windows PowerShell 5.1 remediation scripting
- Windows registry and advanced audit-policy administration
- Repeatable and idempotent configuration changes
- Credentialed Tenable compliance auditing
- Tenable result filtering and per-STIG correlation
- Baseline and post-remediation result comparison
- Before-and-after evidence collection
- Technical documentation, scope definition, and limitation reporting

---

## Lessons Learned

- Each STIG check must be translated into a precise and testable configuration state, including the registry path, value name, data type, required value, or audit-policy setting.
- A missing registry value is a finding when the STIG requires an explicit configuration, even when Windows may appear to use a secure default behavior.
- PowerShell remediation scripts should create missing registry paths, configure the required value, and verify the resulting state instead of assuming that the command succeeded.
- Advanced audit subcategories depend on the policy that forces subcategory settings to override legacy audit-policy categories.
- Tenable may identify an asset by its scanned IP address rather than its operating-system or Azure VM name. The target therefore had to be correlated using `10.3.0.33`, the benchmark, and the individual STIG IDs.
- Local PowerShell checks demonstrated that the intended values were configured, while the filtered follow-up Host Audit report independently confirmed that all 10 selected STIG requirements passed.
- Aggregate compliance totals alone cannot prove that specific remediations succeeded. Each selected STIG ID must be individually correlated between the baseline and follow-up results.
- In an enterprise environment, these settings could be deployed centrally through Group Policy, Microsoft Intune, PowerShell Desired State Configuration, or another configuration-management platform. Changes should be tested in a pilot group before broader deployment.

---

## References

- [DISA STIGs Document Library](https://www.cyber.mil/stigs/downloads/)
- [STIG-A-View — Latest Windows 11 STIG (Unofficial Rule Viewer)](https://stigaview.com/products/win11/latest/)
- [STIG-A-View — Windows 11 STIG V2R7 (Unofficial Archived Rule Viewer)](https://stigaview.com/products/win11/v2r7/)
- [Tenable Scan Templates and Policy Compliance Documentation](https://docs.tenable.com/nessus/Content/ScanAndPolicyTemplates.htm)
- **Tenable audit file used:** `DISA_STIG_Microsoft_Windows_11_v2r7.audit`

---

## Disclaimer

This project was completed in an authorized lab environment for educational and portfolio purposes. The scripts and procedures should be tested before use in another environment. Applying STIG settings can affect system functionality, and production changes should follow organizational change-control, testing, and authorization processes.

[⬆️ Back to Top](#top)
