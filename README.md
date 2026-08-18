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
| Compliance scanner | `Tenable Nessus 10.12.3` |
| Scan template | `Advanced Network Scan/Win11-STIG-Implementation-KenT` |
| Audit file or benchmark | `DISA_STIG_Microsoft_Windows_11_v2r7` |
| DISA STIG release used | `Microsoft Windows 11 STIG, Version 2, Release 7 (V2R7)` |
| Baseline scan date | `08-16-2026` |
| Follow-up scan date | `[YYYY-MM-DD]` |

---

## Lab Architecture

The lab used a dedicated Windows 11 VM hosted in Microsoft Azure. Network access was restricted through an Azure Network Security Group (NSG), while authorized administrative access was used to perform PowerShell remediation and credentialed Tenable compliance assessments.

<img width="1401" height="787" alt="netarch" src="https://github.com/user-attachments/assets/4a7b4bdd-5f98-4156-be6b-7e6dde8ba810" />

*Figure 1. Windows 11 DISA STIG lab architecture showing controlled administrative access and credentialed Tenable compliance assessment of the dedicated Azure VM.*

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
| Warning| `12` |
| Total| `263` |

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
| 1 | `WN11-AU-000500` | The Application event log size must be configured to 32768 KB or greater. | `CAT II` | `Failed` | `Pending` | [View script](scripts/WN11-AU-000500.ps1) |
| 2 | `WN11-AU-000050` | The system must be configured to audit Detailed Tracking - Process Creation successes. | `CAT II` | `Failed` | `Pending` | [View script](scripts/WN11-AU-000050.ps1) |
| 3 | `WN11-CC-000066` | Command line data must be included in process creation events. | `CAT II` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000066.ps1) |
| 4 | `WN11-CC-000326` | PowerShell script block logging must be enabled on Windows 11. | `CAT II` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000326.ps1) |
| 5 | `WN11-CC-000315` | The Windows Installer feature "Always install with elevated privileges" must be disabled. | `CAT I` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000315.ps1) |
| 6 | `WN11-CC-000180` | Autoplay must be turned off for non-volume devices. | `CAT I` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000180.ps1) |
| 7 | `WN11-CC-000252` | Windows 11 must be configured to disable Windows Game Recording and Broadcasting. | `CAT II` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000252.ps1) |
| 8 | `WN11-CC-000197` | Microsoft consumer experiences must be turned off. | `CAT III` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000197.ps1) |
| 9 | `WN11-CC-000010` | The display of slide shows on the lock screen must be disabled. | `CAT II` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000010.ps1) |
| 10 | `WN11-CC-000330` | The Windows Remote Management (WinRM) client must not use Basic authentication. | `CAT I` | `Failed` | `Pending` | [View script](scripts/WN11-CC-000330.ps1) |

<a id="stig-01"></a>

### STIG 01-`WN11-AU-000500`: Application Event Log Size

| Field | Value |
| --- | --- |
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

**Observed:** `MaxSize` was missing or did not meet the required minimum of `32,768 KB`.

<img width="1021" height="137" alt="before" src="https://github.com/user-attachments/assets/afbccc9b-600a-498a-b755-2643b559b278" />

*Figure 2. Pre-remediation validation showing that `MaxSize` did not meet the required minimum.*

#### Remediation

The script creates the required registry path and configures `MaxSize` as a `REG_DWORD` with a value of `32768`.

📄 **Script:** [View STIG-01.ps1](/assets/WN11-AU-000500.ps1)

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

**Final result:** `Pass`

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

**Requirement:** The Detailed Tracking - Process Creation audit subcategory must record successful process-creation events.

**Security rationale:** Process-creation auditing provides evidence of programs executed on the system and supports incident detection, investigation, and forensic analysis.

#### Before Remediation

```powershell
auditpol /get /subcategory:"Process Creation"
```

**Observed state:** The baseline Tenable audit reported `No Auditing`, so successful process creation events were not being audited.

![Process Creation auditing disabled before remediation](assets/STIG-02-before.png)

*Figure 4. Pre-remediation validation for `WN11-AU-000050`, showing that Process Creation success auditing was not enabled.*

#### Remediation

Enabled success auditing for the Process Creation subcategory.

📄 **PowerShell script:** [View the remediation script](scripts/WN11-AU-000050.ps1)

#### Verification

Repeat the same `auditpol` command. The required output must show `Success` for Process Creation.

![Process Creation success auditing enabled after remediation](assets/STIG-02-after.png)

*Figure 5. Post-remediation validation for `WN11-AU-000050`, confirming that Process Creation success auditing is enabled.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![Command-line process auditing not configured before remediation](assets/STIG-03-before.png)

*Figure 6. Pre-remediation validation for `WN11-CC-000066`, showing that `ProcessCreationIncludeCmdLine_Enabled` was not configured.*

#### Remediation

Created the required registry path if necessary and set `ProcessCreationIncludeCmdLine_Enabled` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000066.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `ProcessCreationIncludeCmdLine_Enabled = 1`.

![Command-line process auditing enabled after remediation](assets/STIG-03-after.png)

*Figure 7. Post-remediation validation for `WN11-CC-000066`, confirming `ProcessCreationIncludeCmdLine_Enabled = 1`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![PowerShell Script Block Logging not configured before remediation](assets/STIG-04-before.png)

*Figure 8. Pre-remediation validation for `WN11-CC-000326`, showing that `EnableScriptBlockLogging` was not configured.*

#### Remediation

Created the required registry path if necessary and set `EnableScriptBlockLogging` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000326.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `EnableScriptBlockLogging = 1`.

![PowerShell Script Block Logging enabled after remediation](assets/STIG-04-after.png)

*Figure 9. Post-remediation validation for `WN11-CC-000326`, confirming `EnableScriptBlockLogging = 1`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![AlwaysInstallElevated not configured before remediation](assets/STIG-05-before.png)

*Figure 10. Pre-remediation validation for `WN11-CC-000315`, showing that `AlwaysInstallElevated` was not configured.*

#### Remediation

Created the required registry path if necessary and set `AlwaysInstallElevated` to `0` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000315.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `AlwaysInstallElevated = 0`.

![AlwaysInstallElevated disabled after remediation](assets/STIG-05-after.png)

*Figure 11. Post-remediation validation for `WN11-CC-000315`, confirming `AlwaysInstallElevated = 0`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![Autoplay for non-volume devices not disabled before remediation](assets/STIG-06-before.png)

*Figure 12. Pre-remediation validation for `WN11-CC-000180`, showing that `NoAutoplayfornonVolume` was not configured.*

#### Remediation

Created the required registry path if necessary and set `NoAutoplayfornonVolume` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000180.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `NoAutoplayfornonVolume = 1`.

![Autoplay for non-volume devices disabled after remediation](assets/STIG-06-after.png)

*Figure 13. Post-remediation validation for `WN11-CC-000180`, confirming `NoAutoplayfornonVolume = 1`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![Windows Game Recording not disabled before remediation](assets/STIG-07-before.png)

*Figure 14. Pre-remediation validation for `WN11-CC-000252`, showing that `AllowGameDVR` was not configured.*

#### Remediation

Created the required registry path if necessary and set `AllowGameDVR` to `0` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000252.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `AllowGameDVR = 0`.

![Windows Game Recording disabled after remediation](assets/STIG-07-after.png)

*Figure 15. Post-remediation validation for `WN11-CC-000252`, confirming `AllowGameDVR = 0`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![Microsoft consumer experiences not disabled before remediation](assets/STIG-08-before.png)

*Figure 16. Pre-remediation validation for `WN11-CC-000197`, showing that `DisableWindowsConsumerFeatures` was not configured.*

#### Remediation

Created the required registry path if necessary and set `DisableWindowsConsumerFeatures` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000197.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `DisableWindowsConsumerFeatures = 1`.

![Microsoft consumer experiences disabled after remediation](assets/STIG-08-after.png)

*Figure 17. Post-remediation validation for `WN11-CC-000197`, confirming `DisableWindowsConsumerFeatures = 1`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![Lock-screen slide shows not disabled before remediation](assets/STIG-09-before.png)

*Figure 18. Pre-remediation validation for `WN11-CC-000010`, showing that `NoLockScreenSlideshow` was not configured.*

#### Remediation

Created the required registry path if necessary and set `NoLockScreenSlideshow` to `1` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000010.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `NoLockScreenSlideshow = 1`.

![Lock-screen slide shows disabled after remediation](assets/STIG-09-after.png)

*Figure 19. Post-remediation validation for `WN11-CC-000010`, confirming `NoLockScreenSlideshow = 1`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

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

![WinRM client Basic authentication not disabled before remediation](assets/STIG-10-before.png)

*Figure 20. Pre-remediation validation for `WN11-CC-000330`, showing that `AllowBasic` was not configured.*

#### Remediation

Created the required registry path if necessary and set `AllowBasic` to `0` (`REG_DWORD`).

📄 **PowerShell script:** [View the remediation script](scripts/WN11-CC-000330.ps1)

#### Verification

Repeat the same registry query. The required compliant value is `AllowBasic = 0`.

![WinRM client Basic authentication disabled after remediation](assets/STIG-10-after.png)

*Figure 21. Post-remediation validation for `WN11-CC-000330`, confirming `AllowBasic = 0`.*

**Final result:** `Pending - confirm with PowerShell and the follow-up Tenable scan.`

**Reference:** [WN11-CC-000330 - Microsoft Windows 11 STIG V2R7](https://stigaview.com/products/win11/v2r7/WN11-CC-000330/)


#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-10.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 10 after remediation](assets/STIG-10-after.png)

*Figure 21. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

## Phase 3: Post-Remediation Validation

### Follow-Up Tenable Audit

After the 10 selected remediations were implemented and manually verified, the same credentialed Tenable compliance audit was rerun against the target.

![Follow-up Tenable compliance results for the Windows 11 lab VM](assets/tenable-follow-up-summary.png)

*Figure 22. Follow-up Tenable compliance results for `[hostname]`, showing the result counts after the selected STIG remediations were applied.*

📄 **Follow-up report:** [View the full Tenable follow-up report](reports/tenable-follow-up-report.pdf)

### Per-STIG Tenable Correlation

| # | STIG ID | Baseline Result | Follow-Up Result | Evidence or Notes |
| ---: | --- | --- | --- | --- |
| 1 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 2 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 3 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 4 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 5 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 6 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 7 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 8 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 9 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |
| 10 | `[STIG ID]` | `Failed` | `[Passed/Manual/etc.]` | `[Finding title, plugin ID, or report page]` |

> Do not infer that all 10 remediations passed solely because the aggregate failure count decreased by 10. Confirm the follow-up result for each selected STIG ID.

---

## Results Summary

### Overall Compliance Results

| Result | Baseline | Follow-Up | Change |
| --- | ---: | ---: | ---: |
| Passed | `[number]` | `[number]` | `[+/- number]` |
| Failed | `[number]` | `[number]` | `[+/- number]` |
| Manual review | `[number]` | `[number]` | `[+/- number]` |
| Not applicable | `[number]` | `[number]` | `[+/- number]` |
| Errors or incomplete checks | `[number]` | `[number]` | `[+/- number]` |

### Selected-Requirement Outcome

- Selected STIG requirements assessed: **10**
- Confirmed failed before remediation: **`[number]`**
- Confirmed passed after remediation: **`[number]`**
- Requiring manual validation: **`[number]`**
- Remaining failed or excepted: **`[number]`**

### Residual Findings and Limitations

- `[Document any selected STIG that remained failed or required manual verification.]`
- `[Document any requirements that were not applicable to the VM.]`
- `[Document any scanner, credential, benchmark, or lab-environment limitation.]`
- `[State the approved lab disposition for any unresolved item; do not claim an exception was approved unless it actually was.]`

---


## Skills Demonstrated

- DISA STIG interpretation and configuration assessment
- Windows 11 security hardening
- PowerShell scripting and repeatable remediation
- Windows registry, local policy, service, and security-setting validation
- Credentialed Tenable compliance auditing
- Before-and-after evidence collection
- Technical documentation and residual-risk reporting


---

## Lessons Learned

- `[Describe what you learned about translating STIG check and fix text into a testable configuration change.]`
- `[Describe one challenge involving Windows policy, registry paths, permissions, or scan behavior.]`
- `[Explain how the follow-up evidence confirmed—or failed to confirm—the intended result.]`
- `[Describe how you would scale the remediation through Group Policy, Intune, configuration management, or another enterprise control.]`

---

## References

- [DISA STIGs Document Library](https://www.cyber.mil/stigs/downloads/)
- [Windows 11 STIG Latest](https://www.cyber.mil/stigs/downloads/](https://stigaview.com/products/win11/latest/))
- [DISA Security Content Automation Protocol (SCAP) Benchmarks](https://www.cyber.mil/stigs/scap/)
- [Tenable Policy Compliance Auditing Documentation](https://docs.tenable.com/nessus/Content/ScanAndPolicyTemplates.htm)
- `[Add the exact Windows 11 STIG release, audit-file page, or course/lab reference used.]`

---

## Disclaimer

This project was completed in an authorized lab environment for educational and portfolio purposes. The scripts and procedures should be tested before use in another environment. Applying STIG settings can affect system functionality, and production changes should follow organizational change-control, testing, and authorization processes.

[⬆️ Back to Top](#top)
