# Define the current directory for file paths
$currentDir = Get-Location

# Đảm bảo đường dẫn ngrok đúng
$ngrokPath = "$currentDir\ngrok.exe"

# Kiểm tra nếu ngrok.exe có tồn tại
if (-Not (Test-Path $ngrokPath)) {
    Write-Host "Ngrok executable not found at $ngrokPath" -ForegroundColor Red
    Exit 1
}

# Khởi động ngrok
Write-Host "Starting Ngrok..." -ForegroundColor Green
Start-Process $ngrokPath -ArgumentList "http https://localhost:7049"

# Chờ ngrok khởi động
Start-Sleep -Seconds 5

# Lấy URL ngrok từ API
$response = Invoke-RestMethod -Uri "http://127.0.0.1:4040/api/tunnels" -Method Get
$ngrokUrl = $response.tunnels[0].public_url

# Kiểm tra nếu URL Ngrok không tìm thấy
if (-Not $ngrokUrl) {
    Write-Host "Failed to retrieve Ngrok URL from web interface!" -ForegroundColor Red
    Exit 1
} else {
    Write-Host "Ngrok URL: $ngrokUrl" -ForegroundColor Green
}

# Cập nhật appSettings.json với URL ngrok
$appSettingsPath = "$currentDir\appsettings.json"
$appSettingsDevPath = "$currentDir\appsettings.Development.json"

function Update-BaseUrl {
    param(
        [string]$filePath,
        [string]$newBaseUrl
    )
    if (Test-Path $filePath) {
        Write-Host "Updating BaseUrl in $filePath..." -ForegroundColor Cyan
        $json = Get-Content $filePath -Raw | ConvertFrom-Json

        # Cập nhật giá trị BaseUrl
        $json.AppSettings.BaseUrl = $newBaseUrl

        # Ghi lại file JSON với giá trị mới
        $json | ConvertTo-Json -Depth 3 | Set-Content $filePath
        Write-Host "BaseUrl updated successfully in $filePath!" -ForegroundColor Green
    } else {
        Write-Host "$filePath not found!" -ForegroundColor Red
        Exit 1
    }
}

# Cập nhật BaseUrl trong appsettings.json và appsettings.Development.json
Update-BaseUrl -filePath $appSettingsPath -newBaseUrl $ngrokUrl
Update-BaseUrl -filePath $appSettingsDevPath -newBaseUrl $ngrokUrl

Write-Host "Ngrok and configuration files have been updated successfully." -ForegroundColor Green
