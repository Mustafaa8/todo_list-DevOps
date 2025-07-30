# To-Do List Web Application DevOps Pipeline

A complete DevOps solution for containerizing a To-Do list application with automated CI using GitHub Actions, configuration management with Ansible, and infrastructure provisioning with Vagrant.

## 🏗️ Project Architecture

```
┌─────────────┐    ┌──────────────┐    ┌─────────────┐    ┌──────────────┐
│   GitHub    │───▶│ GitHub       │───▶│   Docker    │───▶│   Vagrant    │
│ Repository  │    │ Actions      │    │  Registry   │    │Infrastructure│
└─────────────┘    └──────────────┘    └─────────────┘    └──────────────┘
                           │                                       │
                           ▼                                       ▼
                   ┌──────────────┐                        ┌──────────────┐
                   │    Build     │                        │   Ansible    │
                   │              │                        │ Deployment   │
                   └──────────────┘                        └──────────────┘
```

## 📋 Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (v20.10+)
- [Node.js](https://nodejs.org/) (v16+)
- [Vagrant](https://www.vagrantup.com/downloads) (v2.2+)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) or VMware
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) (v2.9+)
- Git

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd nodejs-devops-pipeline
   ```

2. **Set up infrastructure**
   ```bash
   vagrant up
   ```

3. **Deploy the application**
   ```bash
   ansible-playbook -i inventory/hosts deploy.yml
   ```

## 📁 Project Structure

```
.
├── .github
|   └─ docker-image.yml
├── Dockerfile
├── README.md
├── Vagrantfile
├── ansible
│   ├── inventory
│   ├── machine_key
│   ├── playbook.yml
│   └── vault_vars.yml
├── assets
│   ├── css
│   │   ├── alltask.css
│   │   ├── completedtask.css
│   │   ├── dashboard.css
│   │   └── home.css
│   └── js
│       ├── dashboard.js
│       └── home.js
├── compose.yml
├── config
│   └── mongoose.js
├── controllers
│   ├── alltaskController.js
│   ├── completedtaskController.js
│   ├── dashboardController.js
│   ├── homeController.js
│   └── registerController.js
├── index.js
├── models
│   ├── dashboard.js
│   ├── login.js
│   └── register.js
├── package-lock.json
├── package.json
├── routes
│   └── index.js
├── tree.txt
└── views
    ├── alltask.ejs
    ├── completedtask.ejs
    ├── dashboard.ejs
    ├── home.ejs
    └── register.ejs
```

## 🔄 CI Pipeline

### GitHub Actions Workflow

The pipeline consists of one main workflows:

#### Continuous Integration (`.github/workflows/docker-image.yml`)
- Triggers on push to `main` and pull requests
- Builds Docker image
- Pushes to Docker registry


### Required Secrets

Configure these secrets in your GitHub repository:

```
DOCKER_USERNAME  
DOCKER_PASSWORD 
```

## 🏗️ Infrastructure with Vagrant

### Infrastructure Commands

```bash
# Create and provision VMs
vagrant up

# SSH into the VM
vagrant ssh web-server

# Destroy infrastructure
vagrant destroy -f

# Check VM status
vagrant status
```

## 🎭 Ansible Configuration


```bash
ansible-playbook -i ansible/inventory ansible/playbook.yml --ask-vault-pass

```

## 🔧 Configuration

### Environment Variables

Create a `.env` file for local development:

```env
mongoDbUrl=
```

### Ansible Variables (`ansible/group_vars/all.yml`)

```yaml
docker_username: 
docker_password: 
mongoDbUrl: nodejs
```

## 🚀 Development

### Running the Application

```bash
# Install dependencies
npm install

# Start the application
npm start

```

### Building with Docker

```bash
# Build and run locally
docker build -t image_name .
docker run -p 4000:4000 image_name

# Or use docker-compose
docker-compose up -d
```

## 📊 Monitoring & Logging

### Application Logs

```bash
# View application logs
docker logs todo_list_app_container

# Follow logs in real-time
docker logs -f todo_list_app_container

# View logs with Ansible
ansible todo -i ansible/inventory -m shell -a "docker logs todo_list_app_container"
```

## 🔒 Security

### Docker Security
- Uses non-root user in container
- Scans images for vulnerabilities in CI pipeline

### Ansible Security
- SSH key-based authentication
- Encrypted variables with Ansible Vault



## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
