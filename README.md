# 📊 User Expense Tracker Application (Multi-Tier AWS & PostgreSQL Deployment)

[![AWS Infrastructure](https://img.shields.io/badge/Infrastructure-AWS%20EC2%20%26%20RDS-orange?style=for-the-badge&logo=amazon-aws)](https://aws.amazon.com/)
[![Database Tier](https://img.shields.io/badge/Database-PostgreSQL-blue?style=for-the-badge&logo=postgresql)](https://www.postgresql.org/)
[![Web Server](https://img.shields.io/badge/Server-Apache%20Tomcat%2010-red?style=for-the-badge&logo=apache-tomcat)](https://tomcat.apache.org/)
[![Version Control](https://img.shields.io/badge/VCS-Git%20%26%20GitHub-black?style=for-the-badge&logo=github)](https://github.com/)

An enterprise-ready Multi-Tier Full-Stack Web Application dynamically hosted on Amazon Web Services (AWS). This architecture showcases decoupling strategies by isolating the frontend web compute layer from the persistent relational database layer using AWS EC2, AWS RDS PostgreSQL, secure network group boundaries, and automated server-side workspace synchronization.

---

## 🏗️ Architectural Topology & Component Mapping

The application enforces strict resource segregation to minimize cross-layer dependencies and maximize data tier protection:

```text
  [ Client Web Browser Requests ]
                 │
                 ▼  (Inbound HTTP Traffic via Port 8080)
  ┌────────────────────────────────────────────────────────┐
  │  AWS EC2 Cloud Compute Node (Ubuntu Server OS)         │
  │  ├── Apache Tomcat 10 Dynamic Servlet Container        │
  │  └── Hosted Logic Modules (index.jsp / dashboard.jsp)  │
  └──────────────────────────────┬─────────────────────────
                                 │
                                 ▼  (Secure Private Inbound JDBC Port 5432)
  ┌────────────────────────────────────────────────────────┐
  │  AWS RDS Managed DB Instance (PostgreSQL Engine)       │
  │  └── Relational User Schemas & Transactional Ledgers   │
  └────────────────────────────────────────────────────────┘
🛠️ Core Technology Stack
Compute Tier Hosting: AWS EC2 Node running a headless Linux Ubuntu Server.

Managed Database Tier: AWS RDS Instance powered by the PostgreSQL Relational Engine.

Web Server & Servlet Middleware: Apache Tomcat 10 Container.

Backend Framework Logic: Java Server Pages (JSP), Java Servlets, and PostgreSQL JDBC Driver integrations.

Version Control Pipeline: Hardened Git Workflow utilizing Encrypted Classic Token Authentication helpers.

⚡ Key Infrastructure & System Engineering Features
1. Decoupled Relational Persistence (AWS RDS)
Configured enterprise relational structures inside a managed PostgreSQL database, fully isolated within custom network loops.

Connectivity is locked down via inbound Security Group rules allowing query interactions exclusively from the web server's internal EC2 IP over port 5432.

Real-time accounting logic to securely process, categorize, and sum transaction datasets matching specific user login tokens.

2. POSIX Directory Privilege Hardening
Enforced rigid user directory boundaries over the server deployment context root (/var/lib/tomcat10/webapps/ROOT) to protect production web assets against host-level file system manipulation.

3. Automated Configuration Synchronization
Bypassed persistent authorization caching drops during high-volume server testing by embedding explicitly-scoped Classic Personal Access Tokens (ghp_) within inline terminal links.

Automated upstream force-update pipelines to map local configuration variations directly from the live terminal context smoothly without downtime.

📂 Repository Blueprint
The repository structure follows standard production web application deployment requirements:

Plaintext
├── src/                    # Enterprise Java Backend Logic & DB Access Drivers
│   └── com/                # Source packages for processing user workflows
├── WEB-INF/                # Server Context, Web Descriptors & Secure Resources
│   ├── web.xml             # Deployment Descriptor mapping Servlet allocations
│   └── lib/                # Shared dependency libraries (PostgreSQL JDBC Driver)
├── index.jsp               # Central Portal Gatekeeper & Authentication Layout
├── dashboard.jsp           # Core Analytical View & Expense Processing Panel
├── .gitignore              # Production Workspace/Dependency Filter Profiles
└── README.md               # Advanced Architecture & Infrastructure Documentation
🔧 Production Troubleshooting Ledger (Lessons Learned)
During the cloud deployment phase, critical infrastructure hurdles were addressed and resolved directly within the server shell:

1. Relational Connection Interceptions (EC2 to RDS PostgreSQL)
The Issue: Early initialization loops threw driver context faults and communication breaks when bridging JSP files with the PostgreSQL tier, caused by rigid security group boundaries.

The Resolution: Configured incoming rules over port 5432 bound precisely to the EC2 interface traffic and streamlined the PostgreSQL JDBC connection path strings.

2. Multi-User Server Directory Lockouts (Git Ownership Bypass)
The Issue: Initializing version control trees within standard system application directories triggered an operating system permission check conflict (fatal: detected dubious ownership in repository).

The Resolution: Injected explicit location exemptions into the global architecture Git configuration matrix to declare the active workspace sound:

Bash
sudo git config --global --add safe.directory /var/lib/tomcat10/webapps/ROOT
3. Dynamic Write Permission Dropouts (HTTP 403 Forbidden)
The Issue: Modern fine-grained token architectures generated accidental access blocks mid-stream due to strict remote validation refresh cycles.

The Resolution: Shifted transmission methods onto an explicitly-scoped Classic Personal Access Token Blueprint to enable unbroken transport pipelines directly from the terminal.

🚀 Live Server Deployment Workflow
To reproduce or manage the live state from the server shell workspace context, execute the following timeline:

Bash
# Transition straight to the operational Tomcat deployment folder
cd /var/lib/tomcat10/webapps/ROOT

# Initialize local server tracking boundaries
sudo git init

# Register repository workspace exemptions
sudo git config --global --add safe.directory /var/lib/tomcat10/webapps/ROOT

# Stage active assets and initialize system commits
sudo git add .
sudo git commit -m "Deployment Payload Tracking Sync"

# Secure transport mapping utilizing embedded tokens for remote push validation
sudo git remote add origin [https://github.com/dushantraja0/User-Expense-Tracker-AWS.git](https://github.com/dushantraja0/User-Expense-Tracker-AWS.git)
sudo git push -u origin main --force
Maintained and Architected for Multi-Tier Cloud Environments by Dushant Raja.
