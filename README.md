# 🔊 Sound Swap Prank Tool

**A harmless prank tool** that replaces key Windows system sounds (Startup, Shutdown, USB Plug-in) with a custom funny sound (`alert.wav`). This prank is triggered automatically when a friend runs your `.exe` — making their PC play unexpected sounds during normal operations. Safe, non-destructive, and easily reversible.



## 🧠 Project Overview

This prank project was built using **PowerShell scripting** and then converted into an executable `.exe` for easier deployment. It modifies Windows sound settings by updating specific registry keys that control system sounds like:

- **Windows Logon (Startup sound)**
- **Windows Logoff (Shutdown sound)**
- **Device Connect (USB plug-in sound)**

The sound used (`alert.wav`) is copied to the user's Music folder to keep things clean and hidden in a non-suspicious location.

## 🔉 About Sound - `alert.wav`
This file is a 6-second sparking sound designed to create the illusion of a system short-circuit or electric spark when the system:

- **Starts up**
- **Shuts down**
- **Detects a USB device**

The prank causes mild panic and confusion without doing any harm.



## 🧱 How This Prank Was Made

### 1. ✅ Writing the PowerShell Script

We created a PowerShell script (`update_sounds.ps1`) that:

- Gets the current user's `Music` folder.
- Copies the prank sound (`alert.wav`) into that folder.
- Modifies the following registry paths:
  - `HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogon\.Current`
  - `HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogoff\.Current`
  - `HKCU:\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current`

These registry entries define which sound files play during those specific events.

---

### 2. 🧪 Testing the Script

The script was run manually on a test system using PowerShell to verify:

- That the correct sounds played for each system event.
- That it caused no harm to data, apps, or system performance.

---

### 3. 🗂️ Converting to Executable (`.exe`)

To make the prank easier to share and execute:

- The script was converted to an `.exe` using the [`ps2exe`](https://www.powershellgallery.com/packages/ps2exe/) PowerShell module.
  
Command used:
```powershell
Invoke-PS2EXE -InputFile update_sounds.ps1 -OutputFile SoundSwap.exe -noConsole
````

This created `SoundSwap.exe`, which can be executed like any program — even from a USB drive.

---

### 4. 🧯 Creating a Revert Script

A separate script (`revert_sounds.ps1`) was also created to remove the custom sounds and reset them back to default or silent. It can be run if the user wants to undo the prank.



## 📁 Folder Structure

```
SoundSwap-Prank/
├── alert.wav              # The prank sound file
├── update_sounds.ps1      # PowerShell script to set the prank sounds
├── revert_sounds.ps1      # Script to remove the prank sounds
├── SoundSwap.exe          # Executable prank file (converted from PS1)
└── README.md              # This documentation
```

---

## 🛠️ How to Use the Prank

### ✅ To Run the Prank

1. Copy the entire folder to a friend's PC or USB drive.
2. Double-click `SoundSwap.exe` to run it.
3. The prank sound is now set for:

   * Windows Startup
   * Windows Shutdown
   * USB plug-in events


## 🔄 How to Revert the Prank

### 🧪 Option 1: Use the Revert Script

1. Right-click `revert_sounds.ps1` → Select **Run with PowerShell**.
2. It removes the sound entries from the registry, restoring default system behavior.

---

### 🛠️ Option 2: Manually via Windows Control Panel

If the revert script fails or was deleted, follow these steps:

#### 🎛️ Control Panel Method

1. Open **Control Panel**.
2. Go to **Hardware and Sound** → **Sound**.
3. In the **Sound** dialog, go to the **Sounds** tab.
4. Under **Program Events**, scroll and select:

   * `Start Windows` → Choose `"Windows Logon.wav"` from the dropdown or **Browse**: `C:\Windows\Media\Windows Logon.wav`
   * `Exit Windows` → Choose `"Windows Logoff.wav"` or **Browse**: `C:\Windows\Media\Windows Logoff.wav`
   * `Device Connect` → Choose `"Windows Hardware Insert.wav"` or **Browse**: `C:\Windows\Media\Windows Hardware Insert.wav`
5. Click **Apply** → **OK**.

> This method ensures the correct default sounds are restored even if registry edits fail.

---

### 🧰 Option 3: Manually via Windows Registry (Advanced)

1. Press `Win + R` → Type `regedit` → Press Enter.
2. Navigate to:

```
HKEY_CURRENT_USER
└── AppEvents
    └── Schemes
        └── Apps
            └── .Default
                ├── WindowsLogon
                │   └── .Current
                ├── WindowsLogoff
                │   └── .Current
                └── DeviceConnect
                    └── .Current
```

3. Double-click the `(Default)` entry in each `.Current` folder.

4. Set its value to:

   * `C:\Windows\Media\Windows Logon.wav`
   * `C:\Windows\Media\Windows Logoff.wav`
   * `C:\Windows\Media\Windows Hardware Insert.wav`

5. Click OK and close Registry Editor.

6. Restart the computer to apply changes.

---

## 🤝 Safety & Disclaimer

* ✅ **Safe**: No files are deleted, no services are modified.
* ❌ **Not Malware**: It doesn't install or download anything.
* 🧼 **Reversible**: Easy to undo manually or with the script.
* 🙏 **Respect Others**: Only use this prank on friends with a sense of humor. Do not use in professional, academic, or public environments without consent.



## 👨‍💻 Author

**Yug Agarwal**
- 📧 [yugagarwal704@gmail.com](mailto:yugagarwal704@gmail.com)
- 🔗 GitHub – [@HelloYug](https://github.com/HelloYug)