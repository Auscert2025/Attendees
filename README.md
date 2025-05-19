# Using Kubernetes to evolve your infrastructure and deprive attackers


## Prerequisites

To deploy this you are going to need the following:

* Git (if you don't have it installed you can follow the [install instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git))
* [Kubectl](https://kubernetes.io/docs/tasks/tools/)
* [VS Code](https://code.visualstudio.com/download) (or something similar)


## Steps

1. Clone the Attendees repo or run the following command

`git clone https://github.com/Auscert2025/Attendees.git`

2. Open a command line terminal and change directory to the repo you just downloaded

`cd Attendees`

3. Depending which operating system you are using you can choose either the PowerShell or Bash script. Note the PowerShell script works with PowerShell Cross Platform. 
Once you have choosen the script for your platform you need to set your own namespace name (make sure it is unique as if it matches someone elses you won't have your own environment):

#### Bash

```bash
invoke_envsubst --input "./k8s/deployment.yaml" --output "./k8s/deployment-updated.yaml" --var "NAMESPACE=<namespacenamehere>"
```

#### Powershell

```powershell
Invoke-EnvSubst -InputFile "./k8s/deployment.yaml" -OutputFile "./k8s/deployment-updated.yaml" -Variables @{
  "NAMESPACE" = "<namespacenamehere>"
}
```

4. Once you have added your namespace you can run the script using the following:

#### Bash

```bash
chmod +x deploy.sh
./deploy.sh
```

#### Powershell

```powershell
deploy.ps1
```