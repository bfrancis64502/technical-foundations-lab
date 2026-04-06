Local Development & GitHub Integration Guide
This guide documents the procedures for configuring a Linux-based development environment (Raspberry Pi 5) and establishing a secure link to GitHub for version control.

1. SSH Identity Configuration
To facilitate secure communication without manual password entry, an SSH key pair was generated using the Ed25519 algorithm.

Key Generation: ssh-keygen -t ed25519 -C "REDACTED"

Public Key Retrieval: cat ~/.ssh/id_ed25519.pub

GitHub Integration: The public key was deployed to GitHub's authorized keys to allow hardware-level authentication.

2. GitHub CLI (gh) Implementation
The GitHub CLI was utilized to manage repositories and simplify the authentication handshake.

Authentication Flow: gh auth login

Protocol: SSH (using the Ed25519 key mentioned above).

Verification: Web-based device code authorization via github.com/login/device.

3. Directory & Repository Management
Standard Linux file system operations were used to organize the project structure.

Repository Deployment: gh repo clone <username>/<repo-name>

Directory Scoping: Moving to the user home directory (cd ~) ensures proper permissions for local work trees.

Organization: * mkdir labs projects: Established logical separation for academic and development work.

mv: Relocated files into the appropriate sub-directories.

4. Continuous Integration Workflow
To ensure local progress is backed up to the cloud, the following "Triple Threat" workflow is followed:

Stage: git add . (Prepare all modified files for a snapshot).

Commit: git commit -m "Descriptive Change Message" (Label the snapshot).

Push: git push (Upload the local snapshot to the GitHub repository).

5. Troubleshooting & Permission Notes
Work Tree Permissions: Ensure operations are not performed in the root directory (/) to avoid "Permission Denied" errors.

Case Sensitivity: GitHub repository names are case-sensitive; use gh repo list to verify exact naming conventions before cloning.