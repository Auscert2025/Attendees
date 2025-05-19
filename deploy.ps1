function Invoke-EnvSubst {
  param (
      [Parameter(Mandatory=$true)]
      [string]$InputFile,
      
      [Parameter(Mandatory=$false)]
      [string]$OutputFile,
      
      [Parameter(Mandatory=$false)]
      [hashtable]$Variables = @{}
  )

  if (-not $OutputFile) {
      $OutputFile = $InputFile
  }

  $content = Get-Content -Path $InputFile -Raw

  foreach ($key in $Variables.Keys) {
      $placeholder = "`${$key}"
      $value = $Variables[$key]
      $content = $content -replace [regex]::Escape($placeholder), $value
  }

  $content | Set-Content -Path $OutputFile -NoNewline
}

Invoke-EnvSubst -InputFile "./k8s/deployment.yaml" -OutputFile "./k8s/deployment-updated.yaml" -Variables @{
  "NAMESPACE" = "<namespacenamehere>"
}

kubectl apply -f ./k8s/deployment-updated.yaml