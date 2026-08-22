# DevOps / SRE / Platform

Focus: **CI/CD, containers, Kubernetes, IaC, observability, incident response, and reliability culture** — less LeetCode, more scenarios and system thinking.

## What interviewers probe

| Area | Signals |
| --- | --- |
| Linux | Processes, systemd, networking, permissions |
| CI/CD | Pipeline stages, immutable artifacts, rollback |
| Kubernetes | Pods, deployments, probes, RBAC, troubleshooting |
| IaC / GitOps | Terraform, declarative config, drift |
| Observability | Metrics vs logs vs traces; SLOs |
| Incidents | STAR stories with concrete commands |

## Sample questions

### Kubernetes

1. Explain control plane components (API server, etcd, scheduler, controllers).
2. Pod stuck in **CrashLoopBackOff** — debug steps?
3. **ImagePullBackOff** — common causes?
4. Liveness vs readiness probes — mistakes that cause outages.
5. How do NetworkPolicies and RBAC harden a cluster?

### CI/CD

1. Walk through a **production-grade pipeline** (lint → test → scan → deploy).
2. Blue/green vs canary vs rolling — tradeoffs.
3. CI vs CD (Delivery) vs CD (Deployment).
4. How do you implement automated rollback on error-rate spike?
5. Immutable artifacts — why rebuild per environment is an anti-pattern?

### Infrastructure as Code

1. Terraform state — why remote state matters.
2. GitOps (Argo CD / Flux) vs push-based deploy.
3. Detect and fix configuration drift.

### Observability & SRE

1. RED method (Rate, Errors, Duration) vs USE (Utilization, Saturation, Errors).
2. Define an SLO and error budget for a critical API.
3. What belongs in a postmortem? Blameless culture in practice.
4. Alert fatigue — how to reduce noise?

### Scenario-based (common)

1. Pipeline green but production broken after deploy — what do you check?
2. Node disk pressure evicting pods — mitigation.
3. Secret leaked in git history — response playbook.
4. 10× traffic overnight — scaling plan.

### Coding (lighter but real)

1. Parse logs and aggregate error counts (script).
2. Write a health-check endpoint spec for k8s probes.
3. Automate a repetitive ops task (idempotent script).

## Also study

- [../general/behavioral.md](../general/behavioral.md) — incident stories are critical
- [../general/system-design.md](../general/system-design.md) — reliability and scale language

## Sources

- [DevOps & SRE Interview Questions — AI Interview Masters](https://www.aiinterviewmasters.com/blogs/devops-sre-interview-questions) — accessed 2026-08-22
- [100 DevOps Interview Questions — DEV Community](https://dev.to/dev_tips/100-devops-interview-questions-and-answers-for-2025-3kh) — accessed 2026-08-22
- [DevOps Scenario-Based Questions — NareshIT](https://nareshit.com/blogs/devops-scenario-based-interview-questions-and-answers-2025-updated-guide) — accessed 2026-08-22
