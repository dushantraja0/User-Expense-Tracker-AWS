# 📊 User Expense Tracker Application (AWS Cloud Deployment)

[![AWS Deployment](https://img.shields.io/badge/Deployment-AWS%20EC2-orange?style=for-the-badge&logo=amazon-aws)](https://aws.amazon.com/)
[![Web Server](https://img.shields.io/badge/Server-Apache%20Tomcat%2010-red?style=for-the-badge&logo=apache-tomcat)](https://tomcat.apache.org/)
[![Version Control](https://img.shields.io/badge/VCS-Git%20%26%20GitHub-black?style=for-the-badge&logo=github)](https://github.com/)

An enterprise-grade Full-Stack Web Application dynamically hosted on an active AWS EC2 cloud infrastructure instance. This system showcases rigorous security configurations, continuous workspace synchronization, automated network deployment flows, and POSIX file-system management within a multi-user Linux environment.

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
