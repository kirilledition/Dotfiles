## 2024-05-22 - [SSH Hardening: Root Login]
**Vulnerability:** Direct root login via SSH was enabled (`PermitRootLogin = "yes"`), exposing the administrative account to potential brute-force or credential theft attacks.
**Learning:** Disabling password authentication is not enough; enabling root login still provides a high-value target for attackers. Forcing login via a standard user ensures accountability and leverages `sudo` for privilege escalation, adding a critical layer of defense.
**Prevention:** Enforce `services.openssh.settings.PermitRootLogin = "no"` in NixOS configurations to adhere to the principle of least privilege.
