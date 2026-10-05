# Black Eagle Assessment Methodology

## Overview

The Black Eagle cybersecurity assessment used a structured, evidence-driven methodology designed to identify, validate, and prioritize security weaknesses across the assessed digital ecosystem.

The engagement combined offensive and defensive security practices while maintaining legal, ethical, and operational safety. The methodology integrated reconnaissance, technical validation, exploit testing, forensic investigation, and risk analysis.

## Assessment Phases

1. Reconnaissance and Open-Source Intelligence (OSINT)
2. Social Engineering Risk Assessment
3. Vulnerability Assessment
4. Authorized Penetration Testing
5. Malware Analysis
6. Digital Forensics Investigation
7. Cryptography Assessment
8. Application Security Assessment
9. Risk Prioritization and Remediation Planning

## Domain Methodologies

### OSINT

Activities included domain intelligence collection, DNS record analysis, public employee profiling, email intelligence, infrastructure footprint discovery, and technology-stack fingerprinting. Sources included institutional websites, search engines, professional networking platforms, public DNS infrastructure, and certificate-transparency records.

### Social Engineering

The assessment evaluated human-targeted exposure through staff-role profiling, email exposure analysis, executive targeting analysis, phishing susceptibility assessment, and Business Email Compromise (BEC) risk analysis.

### Vulnerability Assessment

Activities included host discovery, service enumeration, version fingerprinting, protocol analysis, configuration review, and vulnerability validation. Findings were classified by severity, exploitability, business impact, and exposure level.

### Penetration Testing

Authorized testing examined SQL Injection, Cross-Site Scripting (XSS), authentication bypass, request/parameter tampering, input-validation bypass, and session-handling weaknesses. Testing was controlled to avoid service disruption, data corruption, or unauthorized collateral impact.

### Malware and Network Forensics

Suspicious artifacts were classified and examined for indicators of compromise, suspicious communications, and behavioral evidence. Where executable analysis was not appropriate, analysis pivoted to packet-level network inspection.

### Digital Forensics

Forensic procedures included evidence-acquisition validation, disk-image analysis, deleted-file recovery, file carving, metadata inspection, and artifact reconstruction. Evidence was analyzed in controlled read-only environments.

### Cryptography

The assessment examined TLS protocol support, SSL certificate validation, cipher suites, secure-transport enforcement, and credential-transmission security.

### Application Security

Testing covered input validation, script injection, authentication workflows, session security, and backend request manipulation, aligned with OWASP testing categories including injection, broken access control, and insecure design.

## Tools

Tools documented in the report included Maltego; Whois/Nslookup; Nmap/Zenmap; WhatWeb/Curl; OWASP ZAP; Burp Suite; Wireshark/Tshark; Autopsy; FTK Imager; and Kali Linux.

## Evidence Validation

Evidence sources included screenshots, tool outputs, scanner results, packet captures, forensic disk images, and extracted artifacts. Validation involved cross-tool verification, false-positive elimination, artifact classification, and manual review of automated findings. Only validated evidence was used for risk scoring and remediation planning.

## Risk Scoring

Risk was calculated using:

**Risk Score = Likelihood × Impact**

Each factor used a 1–5 scale.

| Score | Risk Band |
|---:|---|
| 16–25 | Critical |
| 10–15 | High |
| 5–9 | Medium |
| 1–4 | Low |

Likelihood considered exploit availability, attack complexity, authentication requirements, and external exposure. Impact considered confidentiality, integrity, availability, and business, regulatory, or reputational consequences.

## Referenced Frameworks and Standards

- NIST SP 800-115
- NIST SP 800-30
- MITRE ATT&CK Enterprise Matrix
- OWASP Testing Guide v4 / OWASP Top 10 (2021)
- CVSS v3.1
- CIS Critical Security Controls v8
- RFC 6797 (HSTS)
- RFC 5321 (SMTP)
- RFC 3501 (IMAP4)
- Nigeria Data Protection Act (NDPA) 2023

## Scope and Safety

Testing was performed as an authorized, controlled engagement. Destructive exploitation, unnecessary production disruption, unauthorized collateral impact, and publication of sensitive raw evidence were excluded from the portfolio repository.

This methodology file is a portfolio summary derived from the Black Eagle Cybersecurity Assessment Report; it does not replace the full report.
