<a id="top"></a>

# Windows 11 DISA STIG Remediation Lab

## Overview

This project documents the assessment, remediation, and validation of **10 selected requirements** from the **DISA Microsoft Windows 11 Security Technical Implementation Guide (STIG)** in an authorized lab environment. Each selected requirement was evaluated using its documented check criteria, confirmed as non-compliant, remediated with PowerShell where appropriate, and rechecked to verify the resulting configuration.

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
  - [STIG 01](#stig-01)
  - [STIG 02](#stig-02)
  - [STIG 03](#stig-03)
  - [STIG 04](#stig-04)
  - [STIG 05](#stig-05)
  - [STIG 06](#stig-06)
  - [STIG 07](#stig-07)
  - [STIG 08](#stig-08)
  - [STIG 09](#stig-09)
  - [STIG 10](#stig-10)
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

### STIG 01 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting in one or two sentences.]`

#### Before Remediation

**Check performed:**

```powershell
# Enter the PowerShell command or validation procedure used to test the setting.
```

**Observed state:** `[Record the actual non-compliant value, output, or condition.]`

![Non-compliant state for STIG 01 before remediation](assets/STIG-01-before.png)

*Figure 2. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant value or state]`.*

#### Remediation

The PowerShell script `[briefly describe what it changes]` in accordance with the applicable STIG fix guidance.

📄 **PowerShell script:** [View the remediation script](scripts/STIG-01.ps1)

```powershell
# Optional: show the most important remediation command or how to run the script.
```

#### Verification

**Check repeated:** `[State that the same check procedure was rerun.]`

**Observed state:** `[Record the compliant value, output, or condition.]`

![Compliant state for STIG 01 after remediation](assets/STIG-01-after.png)

*Figure 3. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant value or state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

<a id="stig-02"></a>

### STIG 02 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 02 before remediation](assets/STIG-02-before.png)

*Figure 4. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-02.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 02 after remediation](assets/STIG-02-after.png)

*Figure 5. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`


---

<a id="stig-03"></a>

### STIG 03 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 03 before remediation](assets/STIG-03-before.png)

*Figure 6. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-03.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 03 after remediation](assets/STIG-03-after.png)

*Figure 7. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

<a id="stig-04"></a>

### STIG 04 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 04 before remediation](assets/STIG-04-before.png)

*Figure 8. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-04.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 04 after remediation](assets/STIG-04-after.png)

*Figure 9. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

<a id="stig-05"></a>

### STIG 05 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 05 before remediation](assets/STIG-05-before.png)

*Figure 10. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-05.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 05 after remediation](assets/STIG-05-after.png)

*Figure 11. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

<a id="stig-06"></a>

### STIG 06 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 06 before remediation](assets/STIG-06-before.png)

*Figure 12. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-06.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 06 after remediation](assets/STIG-06-after.png)

*Figure 13. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

<a id="stig-07"></a>

### STIG 07 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 07 before remediation](assets/STIG-07-before.png)

*Figure 14. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-07.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 07 after remediation](assets/STIG-07-after.png)

*Figure 15. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`


---

<a id="stig-08"></a>

### STIG 08 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 08 before remediation](assets/STIG-08-before.png)

*Figure 16. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-08.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 08 after remediation](assets/STIG-08-after.png)

*Figure 17. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

<a id="stig-09"></a>

### STIG 09 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 09 before remediation](assets/STIG-09-before.png)

*Figure 18. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

#### Remediation

`[Describe the configuration change.]`

📄 **PowerShell script:** [View the remediation script](scripts/STIG-09.ps1)

#### Verification

**Observed state:** `[Compliant value, output, or condition.]`

![Compliant state for STIG 09 after remediation](assets/STIG-09-after.png)

*Figure 19. Post-remediation validation for `[STIG-ID]`, confirming `[specific compliant state]`.*

**Final result:** `[Pass / Manual verification completed / Exception documented]`

---

<a id="stig-10"></a>

### STIG 10 — `[STIG-ID]`: `[Official Rule Title]`

| Field | Value |
| --- | --- |
| STIG ID | `[WN11-XX-000000]` |
| Vulnerability ID | `[V-######]` |
| Severity | `[CAT I / CAT II / CAT III]` |
| SRG ID | `[SRG-OS-######-GPOS-#####]` |
| CCI | `[CCI-######]` |
| Validation method | `[Registry / command / policy / service / manual]` |

**Requirement:** `[Concise description of the required configuration.]`

**Security rationale:** `[Explain the security risk addressed by this setting.]`

#### Before Remediation

```powershell
# Enter the validation command or procedure.
```

**Observed state:** `[Non-compliant value, output, or condition.]`

![Non-compliant state for STIG 10 before remediation](assets/STIG-10-before.png)

*Figure 20. Pre-remediation validation for `[STIG-ID]`, showing `[specific non-compliant state]`.*

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
