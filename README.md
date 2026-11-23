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
| Mac with Apple chip (M1, M2, M3, M4…) | [`RealtimeVoiceTranslator-1.0.0-mac-arm64.dmg`](https://github.com/shivamrj1035/realtime-voice-translator-releases/releases/latest/download/RealtimeVoiceTranslator-1.0.0-mac-arm64.dmg) |
| Mac with Intel chip | [`RealtimeVoiceTranslator-1.0.0-mac-x64.dmg`](https://github.com/shivamrj1035/realtime-voice-translator-releases/releases/latest/download/RealtimeVoiceTranslator-1.0.0-mac-x64.dmg) |
| Windows 10 / 11 (64-bit) | [`RealtimeVoiceTranslator-1.0.0-win-x64.exe`](https://github.com/shivamrj1035/realtime-voice-translator-releases/releases/latest/download/RealtimeVoiceTranslator-1.0.0-win-x64.exe) |

Not sure which Mac you have? Apple menu → **About This Mac**. "Chip: Apple M…" means Apple chip; "Processor: Intel" means Intel.

## 2. Install

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
   - **Mac:** BlackHole 2ch and BlackHole 16ch from <https://existential.audio/blackhole/>.
   - **Windows:** VB-CABLE and VB-CABLE A+B from <https://vb-audio.com/Cable/>. Run each setup as Administrator, then **restart Windows**.
3. **API keys:** the app uses two AI services. You create free accounts and paste a key from each. The app tests both keys immediately.
   - **Sarvam AI** (speech recognition + translation): <https://dashboard.sarvam.ai> → API Keys.
   - **Cartesia** (voice): <https://play.cartesia.ai> → API Keys → New key.
4. **Devices & languages:** pick your microphone, your headphones, *I speak* and *They speak*.
5. **Your voice:** read a short passage (~15 s) so the other side hears the translation in your voice. You can skip this and use a standard voice for now.
6. **Connect your call app:** exact settings for Zoom / Meet / Teams / FaceTime / WhatsApp, using the device names on your computer.
7. **Test:** say a sentence and hear your own translation.

You can rerun the guide any time: ⚙ Settings → **Setup guide**.

## 4. Before every call (30-second checklist)

- [ ] **Headphones on**, and selected as "Headphones" in the app.
- [ ] The app is open; **Translate me** and **Translate them** are on.
- [ ] **I speak / They speak** are correct for this call.
- [ ] In the call app: **Microphone = BlackHole 2ch** (Windows: *CABLE Output*) and **Speaker = BlackHole 16ch** (Windows: *CABLE-B Input*).
- [ ] The call app's **noise suppression is off** (Zoom: *Original sound* on).

While you talk, the bar at the top of the app always tells you what the other person is hearing:
- **"Call hears: your voice in …"** means they're hearing your translation now.
- **"LIVE: your raw mic goes to the call"** means translation is off and they hear you directly.

**Tips**
- Speak in normal sentences and pause briefly at the end; translation starts as soon as you pause. Mixing English words into Hindi, Marathi or Gujarati is fine.
- Use **⌘⌥T** (Windows: **Ctrl+Alt+T**) to switch translation of your voice on or off instantly.
- With no headphones, turn on **Push-to-talk** and hold the on-screen **Hold to talk** button (or the right **⌥ Option** key) while you speak.

## 5. Troubleshooting

| Problem | Fix |
|---|---|
| The other person can't hear me | The call app's **microphone** must be BlackHole 2ch / CABLE Output. On FaceTime: **Video menu → Microphone**. Check that **Translate me** is on and the top bar changes while you speak. |
| I can't hear them translated | The call app's **speaker** must be BlackHole 16ch / CABLE-B Input, and **Translate them** must be on. The second meter in the app should move when they talk. |
| They hear echoes / their own words | You're on laptop speakers. Use headphones, or turn on Push-to-talk. |
| "API key rejected" | Open ⚙ Settings → API keys, paste the key again (copy all of it), then **Check keys**. |
| "No virtual audio driver found" | Install the cables (step 3.2). On Windows, restart after installing. On Mac, also allow **microphone access**, otherwise the app can't see any audio devices. |
| Hold-to-talk key does nothing (Mac) | System Settings → Privacy & Security → **Accessibility** → enable Realtime Voice Translator. Meanwhile, use the on-screen button or ⌘⇧Space. |
| Robotic or choppy voice for the other side | Turn off the call app's noise suppression / enable *Original sound*. |
| Anything else | Click **⏱** in the app, then **Log**, to open the log folder. Send `app.log` and `errors.log` to whoever gave you the app. |

## 6. Privacy and costs

- Audio is sent to Sarvam AI (speech recognition + translation) and Cartesia (voice) **only while translation is on**.
- Your API keys are encrypted with your computer's keychain and never leave it except to call those two services.
- Your cloned voice is created only after you tick the consent box, and it's stored in **your** Cartesia account.
- Usage is billed to your own Sarvam and Cartesia accounts, both of which have free tiers. Check your usage on their dashboards.

## 7. Uninstall

- **Mac:** drag the app from Applications to the Trash. To remove the audio cables, see the BlackHole site.
- **Windows:** Settings → Apps → Realtime Voice Translator → Uninstall.
