
```markdown
# 📊 User Expense Tracker Application (AWS Cloud Deployment)

[![AWS Deployment](https://img.shields.io/badge/Deployment-AWS%20EC2-orange?style=for-the-badge&logo=amazon-aws)](https://aws.amazon.com/)
[![Web Server](https://img.shields.io/badge/Server-Apache%20Tomcat%2010-red?style=for-the-badge&logo=apache-tomcat)](https://tomcat.apache.org/)
[![Version Control](https://img.shields.io/badge/VCS-Git%20%26%20GitHub-black?style=for-the-badge&logo=github)](https://github.com/)

An enterprise-ready Full-Stack Web Application dynamically hosted on an active AWS EC2 cloud infrastructure instance. This system showcases rigorous cloud security configurations, web servlet container hosting, continuous workspace synchronization, automated network deployment flows, and POSIX file-system management within a multi-user Linux environment.

The system handles real-time personal finance calculations, expense categorization, and metrics parsing, maintaining clean runtime data separation across individual user sessions while operating natively inside a live Apache Tomcat container.

---

## 🏗️ Architectural Overview

The application architecture maps an enterprise dynamic lifecycle pattern where dynamic servlet containers interact with Linux file systems under hardened boundary controls:

```text
  [ User Client / Browser ]
             │
             ▼
    [ AWS EC2 Instance ] ──► Security Groups (Port 8080 Open)
             │
             ▼
 [ Apache Tomcat 10 Linux Container ]
             │
             ▼
  [ Dynamic Web Services ] ──► (index.jsp / dashboard.jsp)
             │
             ▼
[ Deployment Root: /var/lib/tomcat10/webapps/ROOT ] (Hardened Boundaries)

```

### 🛠️ Core Technology Stack

* **Infrastructure Hosting:** Amazon Web Services (AWS) EC2 Cloud Compute Node.
* **Operating System Server Base:** Linux Ubuntu Server Edition.
* **Servlet Container Engines:** Apache Tomcat 10 Web Application Architecture.
* **Backend Framework Logic:** Java Server Pages (JSP), Servlets, and Java Enterprise Web Architecture blueprints.
* **Frontend Interface:** Custom UI styling integrated dynamically with modern viewport layouts.
* **Version Control Automation:** Git Enterprise Source Control utilizing Encrypted Classic Token Authentication.

---

## ⚡ Key Application & System Engineering Features

### 1. Dynamic Expense Computation Engine

* Fully operational backend logic to process real-time additions, subtractions, totals, and structural tracking of operational costs.
* State management preservation across runtime interactions via Tomcat Session Tracking HTTP APIs.
* Dynamic responsive inputs for adding individual category expenses with automatic dynamic indexing.

### 2. Multi-User Security Isolation (POSIX Bound)

* Configured advanced security mapping strategies to allow secure administrative interactions over specific Tomcat file boundaries without breaching underlying system restrictions.
* Preserved file system permissions to guarantee that web requests cannot execute arbitrary host-level OS tasks.

### 3. Dynamic State Synchronization

* Implemented advanced upstream overriding mechanisms (`git push --force`) to achieve structural parity between target server repositories and remote profiles instantly.
* Bypassed persistent authorization caching blocks by moving deployment targets into inline dynamic authentication blocks via Classic Personal Access Tokens (`ghp_`).

---

## 📂 Repository Blueprint

The structure follows standard production webapp constraints directly synchronized from the cloud instance's functional tracking system:

```text
├── src/                    # Enterprise Java Backend Logic & Source Classes
│   └── com/                # Source packages for processing application workflows
├── WEB-INF/                # Server Context, Web Descriptors & Secure Resources
│   ├── web.xml             # Deployment Descriptor mapping Servlet allocations
│   └── lib/                # Shared dependency libraries for runtime execution
├── index.jsp               # Central Portal Gatekeeper & Authentication Layout
├── dashboard.jsp           # Core Analytical View & Expense Processing Panel
├── .gitignore              # Production Workspace/Dependency Filter Profiles
└── README.md               # Advanced Engineering & Infrastructure Blueprint

```

---

## 🔧 Production Troubleshooting Ledger (Lessons Learned)

During the live cloud migration phase, two major system design hurdles were intercepted and engineered to a resolution:

### 1. Dubious Ownership Restrictions (Git Security Bypass)

* **The Issue:** Running Git operations as the base administrative user within standard application directories (`/var/lib/tomcat10/webapps/ROOT`) triggered immediate file-system isolation blocks due to unexpected security ownership mismatches (`fatal: detected dubious ownership in repository`).
* **The Resolution:** Applied systemic variable exemptions directly to the global infrastructure Git system schema to declare the working root directory structurally sound:
```bash
sudo git config --global --add safe.directory /var/lib/tomcat10/webapps/ROOT

```



### 2. Fine-Grained Token Permission Incompatibilities (HTTP 403)

* **The Issue:** Standard fine-grained token mappings dropped structural write scopes during high-volume server mutations, generating unexpected `HTTP 403: Forbidden` access errors due to rigid API cache refresh cycles.
* **The Resolution:** Migrated target synchronization methods to an explicit, isolated **Classic Personal Access Token Blueprint** mapped precisely with full `repo` workflow control privileges.

---

## 🚀 Live Server Execution Strategy

To spin up, trace, or re-verify structural sync parameters over the target platform environment from scratch, execute the following workflow directly within the server console:

```bash
# Move straight to the active webapps context directory
cd /var/lib/tomcat10/webapps/ROOT

# Initialize local server tracking boundaries
sudo git init

# Clear existing workspace conflicts
sudo git config --global --add safe.directory /var/lib/tomcat10/webapps/ROOT

# Stage changes cleanly and initialize system commits
sudo git add .
sudo git commit -m "Deployment Payload Tracking Sync"

# Force push directly upstream using the Classic Personal Access Token framework
sudo git remote add origin https://dushantraja0:<YOUR_CLASSIC_TOKEN_HERE>@[github.com/dushantraja0/User-Expense-Tracker-AWS.git](https://github.com/dushantraja0/User-Expense-Tracker-AWS.git)
sudo git push -u origin main --force

```

---

*Maintained and Architected for Production Cloud Environments by [Dushant Raja](https://github.com/dushantraja0).*

```

```
