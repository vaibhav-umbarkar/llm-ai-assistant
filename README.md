1. Diagram:
                         ┌─────────────────────┐
                         │      Browser        │
                         │   React / Next.js   │
                         └──────────┬──────────┘
                                    │ HTTPS
                                    ▼
                         ┌─────────────────────┐
                         │    API Gateway      │
                         │   / Reverse Proxy   │
                         └──────────┬──────────┘
                                    │
                  ┌─────────────────┼─────────────────┐
                  │                 │                 │
                  ▼                 ▼                 ▼
        ┌────────────────┐ ┌────────────────┐ ┌─────────────────┐
        │  Auth Service  │ │  Chat Service  │ │  User Service   │
        │                │ │                │ │                 │
        │ Login/Register │ │ Chat sessions  │ │ Profile         │
        │ JWT / sessions │ │ Messages       │ │ Preferences     │
        └───────┬────────┘ └───────┬────────┘ └────────┬────────┘
                │                  │                   │
                ▼                  ▼                   ▼
        ┌──────────────┐   ┌──────────────┐    ┌──────────────┐
        │ Auth/User DB │   │ Chat/Memory  │    │ User DB      │
        │ PostgreSQL   │   │ PostgreSQL   │    │ PostgreSQL   │
        └──────────────┘   └───────┬──────┘    └──────────────┘
                                   │
                                   │ context
                                   ▼
                         ┌─────────────────────┐
                         │    LLM Service      │
                         │                     │
                         │ Ollama API          │
                         │ Model management    │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   Ollama Runner     │
                         │                     │
                         │ qwen2.5:7b          │
                         │ llama / other model │
                         └─────────────────────┘


----------------------------------------------------------------------------------------------------------------


2. Folder Structure:

ai-project/
│
├── frontend/
│   ├── Dockerfile
│   └── src/
│
├── services/
│   │
│   ├── api-gateway/
│   │   ├── Dockerfile
│   │   └── src/
│   │
│   ├── auth-service/
│   │   ├── Dockerfile
│   │   └── src/
│   │
│   ├── user-service/
│   │   ├── Dockerfile
│   │   └── src/
│   │
│   ├── chat-service/
│   │   ├── Dockerfile
│   │   └── src/
│   │
│   └── llm-service/
│       ├── Dockerfile
│       └── src/
│
├── ollama/
│   └── Dockerfile
│
├── databases/
│   ├── auth-db/
│   └── chat-db/
│
├── docker-compose.yml
│
└── README.md




3. Kind Cluster Arch:

                         INTERNET
                             │
                             │ HTTP/HTTPS
                             ▼
                    ┌─────────────────┐
                    │ Ingress / NGINX │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   API Gateway   │
                    │                 │
                    │   Deployment    │
                    │   replicas: 2   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Chat Service   │
                    │                 │
                    │   Deployment    │
                    │   replicas: 2   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │     Ollama      │
                    │                 │
                    │   StatefulSet   │
                    │   replicas: 1   │
                    │                 │
                    │   qwen2.5:7b    │
                    └─────────────────┘



4. Project AWS Infra:


                         ┌──────────────────┐
                         │     Browser      │
                         │ React / Next.js  │
                         └────────┬─────────┘
                                  │ HTTPS
                                  ▼
                         ┌──────────────────┐
                         │    Route 53      │
                         └────────┬─────────┘
                                  ▼
                         ┌──────────────────┐
                         │    CloudFront    │
                         │      + S3        │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │  Application     │
                         │  Load Balancer   │
                         └────────┬─────────┘
                                  │
                                  ▼
              ┌─────────────────────────────────────┐
              │              AWS VPC                │
              │                                     │
              │       ┌─────────────────────┐       │
              │       │    EC2 Instance     │       │
              │       │                     │       │
              │       │     kind cluster    │       │
              │       │                     │       │
              │       │ ┌──────┐ ┌──────┐   │       │
              │       │ │ Auth │ │ Chat │   │       │
              │       │ │      │ │      │   │       │
              │       │ └──────┘ └──────┘   │       │
              │       │                     │       │
              │       │ ┌──────┐            │       │
              │       │ │ User │            │       │
              │       │ └──────┘            │       │
              │       │                     │       │
              │       │ ┌─────────────────┐ │       │
              │       │ │   LLM Service   │ │       │
              │       │ └────────┬────────┘ │       │
              │       │          ▼          │       │
              │       │       Ollama        │       │
              │       │          │          │       │
              │       └──────────┼──────────┘       │
              │                  ▼                  │
              │              LLM Model              │
              │                                     │
              └──────────────────┬──────────────────┘
                                 │
                                 ▼
                         ┌─────────────────┐
                         │  PostgreSQL     │
                         │  RDS / EC2      │
                         └─────────────────┘

