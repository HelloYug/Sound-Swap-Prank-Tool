# Step 1: Get Music folder path
$musicFolder = [Environment]::GetFolderPath("MyMusic")
$audioSource = ".\alert.wav"
$audioTarget = Join-Path $musicFolder "alert.wav"

# Step 2: Copy sound to Music folder
Copy-Item $audioSource $audioTarget -Force

# Step 3: Set Registry paths
$sounds = @{
    "WindowsLogon"   = "HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogon\.Current"
    "WindowsLogoff"  = "HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogoff\.Current"
    "DeviceConnect"  = "HKCU:\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"
}

foreach ($name in $sounds.Keys) {
    $path = $sounds[$name]
    if (-not (Test-Path $path)) {
        $base = $path.Substring(0, $path.LastIndexOf("\"))
        $leaf = $path.Substring($path.LastIndexOf("\") + 1)
        New-Item -Path $base -Name $leaf -Force | Out-Null
    }
    Set-ItemProperty -Path $path -Name "(default)" -Value $audioTarget
}

# Optional: Play sound immediately
Add-Type -AssemblyName presentationCore
$player = New-Object system.media.soundplayer
$player.soundlocation = $audioTarget
$player.playsync()

Write-Host "✅ System sounds updated to use alert.wav"
