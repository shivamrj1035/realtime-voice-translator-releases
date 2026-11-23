# Realtime Voice Translator

**[⬇ Download the latest version](https://github.com/shivamrj1035/realtime-voice-translator-releases/releases/latest)**

Talk on any call (Zoom, Google Meet, Teams, FaceTime, WhatsApp, Slack…) in **English, हिन्दी, मराठी or ગુજરાતી**:
- The other person hears you **translated into their language, in your own voice**.
- You hear them **translated into yours**.

Setup takes about 5 minutes the first time.

---

## 1. Download the right file

| Your computer | File |
|---|---|
| Mac with Apple chip (M1, M2, M3, M4…) | [`RealtimeVoiceTranslator-mac-arm64.dmg`](https://github.com/shivamrj1035/realtime-voice-translator-releases/releases/latest/download/RealtimeVoiceTranslator-mac-arm64.dmg) |
| Mac with Intel chip | [`RealtimeVoiceTranslator-mac-x64.dmg`](https://github.com/shivamrj1035/realtime-voice-translator-releases/releases/latest/download/RealtimeVoiceTranslator-mac-x64.dmg) |
| Windows 10 / 11 (64-bit) | [`RealtimeVoiceTranslator-win-x64.exe`](https://github.com/shivamrj1035/realtime-voice-translator-releases/releases/latest/download/RealtimeVoiceTranslator-win-x64.exe) |

Not sure which Mac you have? Apple menu → **About This Mac**. "Chip: Apple M…" means Apple chip; "Processor: Intel" means Intel.

## 2. Install

### Easiest: one command (no security warnings)

**Mac:** open **Terminal** (press ⌘ Space, type *Terminal*, press Enter), paste this line and press Enter:
```
curl -fsSL https://raw.githubusercontent.com/shivamrj1035/realtime-voice-translator-releases/main/install.sh | bash
```

**Windows:** open **PowerShell** (Start menu, type *PowerShell*), paste this line and press Enter:
```
irm https://raw.githubusercontent.com/shivamrj1035/realtime-voice-translator-releases/main/install.ps1 | iex
```

The command picks the right version for your computer, checks the download against the published SHA-256 checksum, installs the app and opens it. You can read exactly what it does first: [install.sh](install.sh) · [install.ps1](install.ps1).

### Or: download the file manually

### macOS
1. Double-click the `.dmg` and drag **Realtime Voice Translator** into **Applications**.
2. Open it from Applications. The first time, macOS says it *"cannot be opened because Apple cannot check it"*. This is expected: the app isn't from the App Store yet.
   - Open **System Settings → Privacy & Security**, scroll down, and click **Open Anyway** next to the message about Realtime Voice Translator.
   - Confirm with your password or Touch ID.
   - If no "Open Anyway" button appears, open **Terminal** and run the command below, then open the app again:
     ```
     xattr -dr com.apple.quarantine "/Applications/Realtime Voice Translator.app"
     ```
3. When asked, **allow microphone access**.
4. If macOS asks to use your keychain, click **Always Allow**. That's where your API keys are stored, encrypted.

### Windows
1. Double-click the `.exe`. If **"Windows protected your PC"** appears, click **More info → Run anyway**. The app isn't code-signed yet.
2. Follow the installer. It creates a desktop and Start-menu shortcut.

## 3. First launch: the setup guide

The app opens a step-by-step guide that checks each step before you move on:

1. **Welcome:** what you'll need.
2. **Audio cables:** install two free virtual audio cables. These let the app act as your microphone in any call app.
   - Easiest: click **Install cables for me**. The app downloads the official installers and opens them; you just click through (Mac: enter your password; Windows: click *Yes*, then **restart Windows**).
   - Or manually. **Mac:** BlackHole 2ch and 16ch from <https://existential.audio/blackhole/>. **Windows:** VB-CABLE and Hi-Fi Cable from <https://vb-audio.com/Cable/>; run each setup as Administrator, then restart.
3. **Access:** paste the **invite code** you were given (looks like `RVT-XXXX-XXXX`). That's all; no accounts needed.
   - No code? Choose **Use my own API keys** and create free accounts at **Sarvam AI** (<https://dashboard.sarvam.ai> → API Keys) and **Cartesia** (<https://play.cartesia.ai> → API Keys). The app tests both keys immediately.
4. **Devices & languages:** pick your microphone, your headphones, *I speak* and *They speak*.
5. **Your voice:** read a short passage (~15 s) so the other side hears the translation in your voice. You can skip this and use a standard voice for now.
6. **Connect your call app:** exact settings for Zoom / Meet / Teams / FaceTime / WhatsApp, using the device names on your computer.
7. **Test:** say a sentence and hear your own translation.

You can rerun the guide any time: ⚙ Settings → **Setup guide**.

## 4. Before every call (30-second checklist)

- [ ] **Headphones on**, and selected as "Headphones" in the app.
- [ ] The app is open and you've pressed **Start translating**.
- [ ] **I speak / They speak** are correct for this call.
- [ ] In the call app: **Microphone = BlackHole 2ch** (Windows: *CABLE Output*) and **Speaker = BlackHole 16ch** (Windows: *Hi-Fi Cable Input*).
- [ ] The call app's **noise suppression is off** (Zoom: *Original sound* on).

While you talk, the status box under the button always tells you what's happening, for example **"They hear you in English"** or **"They hear your normal voice"** (translation off).

**Tips**
- Speak in normal sentences and pause briefly at the end; translation starts as soon as you pause. Mixing English words into Hindi, Marathi or Gujarati is fine.
- Use **⌘⌥T** (Windows: **Ctrl+Alt+T**) to switch translation of your voice on or off without touching the app.
- No headphones? It still works: wait for their translation to finish before you reply. Or turn on **Push-to-talk** (⚙ Settings → Advanced) and hold the on-screen button while you speak.

## 5. Troubleshooting

| Problem | Fix |
|---|---|
| The other person can't hear me | The call app's **microphone** must be BlackHole 2ch / CABLE Output. On FaceTime: **Video menu → Microphone**. Check that you pressed **Start translating** and the status says *They hear you in …* while you speak. |
| I can't hear them translated | The call app's **speaker** must be BlackHole 16ch / Hi-Fi Cable Input. The second meter in the app should move when they talk. |
| They hear echoes / their own words | You're on laptop speakers. Use headphones, or turn on Push-to-talk (⚙ Settings → Advanced). |
| "Invite code not accepted" / "API key rejected" | ⚙ Settings → Access: paste the code (or keys) again, copying all of it, then check. |
| "Today's free minutes are used up" | Your invite code has a daily limit; it resets at midnight UTC. Ask for a higher limit, or use your own API keys. |
| "No virtual audio driver found" | Install the cables (step 3.2). On Windows, restart after installing. On Mac, also allow **microphone access**, otherwise the app can't see any audio devices. |
| Hold-to-talk key does nothing (Mac) | System Settings → Privacy & Security → **Accessibility** → enable Realtime Voice Translator. Meanwhile, use the on-screen button or ⌘⇧Space. |
| Robotic or choppy voice for the other side | Turn off the call app's noise suppression / enable *Original sound*. |
| Anything else | ⚙ Settings → Advanced → turn on *latency numbers*, then click **Log** on the main screen to open the log folder. Send `app.log` and `errors.log` to whoever gave you the app. |

## 6. Privacy and costs

- Audio is sent to Sarvam AI (speech recognition + translation) and Cartesia (voice) **only while translation is on**.
- Your invite code or API keys are encrypted with your computer's keychain. With an invite code, audio goes through the app's relay server, which forwards it to Sarvam and Cartesia and stores only how many minutes you used, never the audio.
- Your cloned voice is created only after you tick the consent box, and it's stored in **your** Cartesia account.
- With an **invite code**, usage is covered by whoever gave you the code. With **your own keys**, it's billed to your Sarvam and Cartesia accounts (both have free tiers).

## 7. Uninstall

- **Mac:** drag the app from Applications to the Trash. To remove the audio cables, see the BlackHole site.
- **Windows:** Settings → Apps → Realtime Voice Translator → Uninstall.
