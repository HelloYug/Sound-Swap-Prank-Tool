$soundKeys = @(
    "HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogon\.Current",
    "HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogoff\.Current",
    "HKCU:\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"
)

foreach ($key in $soundKeys) {
    if (Test-Path $key) {
        # Remove custom sound path to revert to system default
        Remove-ItemProperty -Path $key -Name "(default)" -ErrorAction SilentlyContinue
    }
}
Write-Host "🔁 Sounds reverted to default (silent if no original backup)."
