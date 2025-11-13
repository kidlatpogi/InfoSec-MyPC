# schedule_commit_3_0_0.ps1
# Script to create branch, commit changes, and push to origin
# Location: D:\Codes\Web Dev\InfoSec-MyPC
# Commit message: Add Employee and Superadmin Dashboard

$ErrorActionPreference = 'Stop'
$logFile = "D:\Codes\Web Dev\InfoSec-MyPC\schedule_commit_3_0_0.log"

function Log { param($m) Add-Content -Path $logFile -Value ("$(Get-Date -Format o) - $m") }

try {
    Log "Script started"
    Set-Location -Path "D:\Codes\Web Dev\InfoSec-MyPC"

    Log "Fetching origin"
    git fetch origin 2>&1 | Out-String | ForEach-Object { Log $_ }

    $branchName = '3.0.0'

    # Create or checkout branch
    $branchExists = (git rev-parse --verify $branchName 2>$null) -ne $null
    if (-not $branchExists) {
        Log "Creating and checking out branch $branchName"
        git checkout -b $branchName 2>&1 | Out-String | ForEach-Object { Log $_ }
    } else {
        Log "Branch $branchName already exists locally. Checking out."
        git checkout $branchName 2>&1 | Out-String | ForEach-Object { Log $_ }
    }

    Log "Staging changes"
    git add -A 2>&1 | Out-String | ForEach-Object { Log $_ }

    # Commit if there are staged changes
    $status = git status --porcelain
    if ($status) {
        Log "Committing changes"
        git commit -m "Add Employee and Superadmin Dashboard" 2>&1 | Out-String | ForEach-Object { Log $_ }
    } else {
        Log "No changes to commit"
    }

    Log "Pushing branch $branchName to origin"
    git push -u origin $branchName 2>&1 | Out-String | ForEach-Object { Log $_ }

    Log "Script finished successfully"
} catch {
    Log "ERROR: $($_.Exception.Message)"
    throw
}
