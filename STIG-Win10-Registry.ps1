# STIG: 
# Tite: Disable TLS RC4 cipher in .Net
# ID: SV-225238r615940
# CCI: CCI-001762 (NIST SP 800-53 Rev 4: CM-7(1)(b))

#You can add -Force flag at the end after DWORD if something else exists
Set-Location -Path "HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\" | 
New-Item -Name SchUseStrongCrypto |
New-ItemProperty -Name SchUseStrongCrypto -Value 1 -PropertyType DWORD


Set-Location -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319\" | 
New-Item -Name SchUseStrongCrypto |
New-ItemProperty -Name SchUseStrongCrypto -Value 1 -PropertyType DWORD
