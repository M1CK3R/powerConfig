# 
$banner = @"
  ****     ****  **    ******  **   **  ****  *******   
 /**/**   **/** ***   **////**/**  **  */// */**////**  
 /**//** ** /**//**  **    // /** **  /    /*/**   /**  
 /** //***  /** /** /**       /****      *** /*******   
 /**  //*   /** /** /**       /**/**    /// */**///**   
 /**   /    /** /** //**    **/**//**  *   /*/**  //**  
 /**        /** **** //****** /** //**/ **** /**   //** 
 //         // ////   //////  //   //  ////  //     //  
"@

if (Test-Path "Cargo.toml") {
    Write-Host "`n🦀 Nyan¬, M1CK3R-chan!" -ForegroundColor DarkCyan
    Write-Host $banner -ForegroundColor White
} else {
    Write-Host "`n💻 M1CK3R" -ForegroundColor Cyan
    Write-Host $banner -ForegroundColor White
}


# 🕒 Session Info
Write-Host "`n- Info de sesión -" -ForegroundColor Yellow
Write-Host "Iniciado: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" -ForegroundColor Gray
Write-Host "PowerShell: $($PSVersionTable.PSVersion)" -ForegroundColor Gray

# ⚡ Shortcuts
Write-Host "`n⚡ Accesos rapidos:" -ForegroundColor Cyan
Set-Alias visual "C:\Users\PC\AppData\Local\Programs\Microsoft VS Code\Code.exe"
Set-Alias dck "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Write-Host "visual, dck" -ForegroundColor DarkCyan

# Docker Status
Write-Host "`n🐳 Docker Status:" -ForegroundColor Yellow
try {
    $dockerStatus = docker ps
    if ($dockerStatus) {
        Write-Host "Contenedores activos" -ForegroundColor Green
    } else {
        Write-Host "No hay contenedores activos" -ForegroundColor DarkGray
    }
} catch {
    Write-Host "Docker no está disponible" -ForegroundColor Red
}

# 🎯 Prompt personalizado

function global:pregunta {
    param (
        [string]$prompt
    )

    $body = @{
        prompt = $prompt
        temperature = 0.7
        max_new_tokens = 300
    } | ConvertTo-Json -Depth 3

    $response = Invoke-RestMethod -Uri "http://localhost:1234/v1/completions" `
                                  -Method Post `
                                  -ContentType "application/json" `
                                  -Body $body

    $response.text
}

function obtenerModelosLM {
    Invoke-RestMethod -Uri "http://localhost:1234/v1/models" -Method Get
}

function chat {
    param (
        [string]$message,
        [string]$system = "Eres un asistente útil.",
        [float]$temperature = 0.7,
        [int]$max_tokens = 300
    )

    $body = @{
        messages = @(
            @{ role = "system"; content = $system },
            @{ role = "user"; content = $message }
        )
        temperature = $temperature
        max_tokens = $max_tokens
    } | ConvertTo-Json -Depth 3

    $response = Invoke-RestMethod -Uri "http://localhost:1234/v1/chat/completions" `
                                  -Method Post `
                                  -ContentType "application/json" `
                                  -Body $body

    $response.choices[0].message.content
}

function chatCreativo {
    param (
        [string]$message,
        [string]$system = "Eres un asistente útil.",
        [float]$temperature = 1.7,
        [int]$max_tokens = 300
    )

    $body = @{
        messages = @(
            @{ role = "system"; content = $system },
            @{ role = "user"; content = $message }
        )
        temperature = $temperature
        max_tokens = $max_tokens
    } | ConvertTo-Json -Depth 3

    $response = Invoke-RestMethod -Uri "http://localhost:1234/v1/chat/completions" `
                                  -Method Post `
                                  -ContentType "application/json" `
                                  -Body $body

    $response.choices[0].message.content
}

function chatConciso {
    param (
        [string]$message,
        [string]$system = "Eres un asistente útil.",
        [float]$temperature = 0.07,
        [int]$max_tokens = 2000
    )

    $body = @{
        messages = @(
            @{ role = "system"; content = $system },
            @{ role = "user"; content = $message }
        )
        temperature = $temperature
        max_tokens = $max_tokens
    } | ConvertTo-Json -Depth 3

    $response = Invoke-RestMethod -Uri "http://localhost:1234/v1/chat/completions" `
                                  -Method Post `
                                  -ContentType "application/json" `
                                  -Body $body

    $response.choices[0].message.content
}
