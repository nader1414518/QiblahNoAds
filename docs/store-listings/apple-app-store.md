# Apple App Store Listing

> Copy each field into [App Store Connect](https://appstoreconnect.apple.com) → Your app → App Information / Version Information.
> Character limits are noted. Replace placeholder URLs and contact details before publishing.

---

## App identity

| Field | Value |
|-------|-------|
| Bundle ID | `com.ec.qiblahNoAds` |
| SKU | `qiblah-no-ads` (your choice) |
| Version | `1.0.0` |
| Build | `1` |
| Primary language | English (U.S.) |
| Display name (on device) | `Al-Qiblah` |

---

## App Information

| Field | Value |
|-------|-------|
| Name | See below |
| Subtitle | See below |
| Category (Primary) | Lifestyle |
| Category (Secondary) | Reference (optional) |
| Content rights | Does not contain third-party content requiring rights |
| Age rating | 4+ |

---

## Version Information (English — en-US)

### Name
**Limit: 30 characters** · Current: 30

```
Al-Qiblah & Prayer Companion
```

### Subtitle
**Limit: 30 characters** · Current: 28

```
Qiblah, Prayer Times & Azkar
```

### Promotional text
**Limit: 170 characters** · Can be updated without a new build

```
Completely free — no ads ever. Accurate Qiblah compass, localized prayer times with countdown, Hisn al-Muslim Azkar, and a Tasbih counter. Works in 24 languages.
```

### Description
**Limit: 4,000 characters**

```
Al-Qiblah & Prayer Companion is a clean, completely free app to help Muslims stay connected to daily worship — with no ads, no subscriptions, and no clutter.

FIND THE QIBLAH
• Real-time compass toward the Kaaba in Makkah
• Clear feedback when you are facing the Qiblah
• GPS location or manual city picker
• Calibration guidance for better compass accuracy

PRAYER TIMES
• Fajr, Dhuhr, Asr, Maghrib, Isha, and Sunrise
• Live countdown to the next prayer in your timezone
• Calculation methods: Muslim World League, ISNA, Umm al-Qura, Egyptian, Karachi
• Shafi and Hanafi Asr options
• Per-prayer minute adjustments to match your mosque
• Optional notifications for each salah
• Offline monthly cache — times available without internet

AZKAR & TASBIH
• Morning, evening, and post-prayer adhkar from Hisn al-Muslim
• Arabic with English translation and hadith/Quran references
• Tasbih counter with haptic taps and milestone feedback

DESIGNED FOR DAILY WORSHIP
• Tab bar: Qiblah, Prayer Times, Azkar
• Dark Mode support
• Interface in 24 languages
• Settings on every tab
• Privacy-first: data stays on your device

PERMISSIONS
• Location (When In Use) — Qiblah bearing and prayer time calculation
• Notifications — optional prayer reminders

Free. No ads. No in-app purchases.

If this app helps you, a kind review is greatly appreciated.
```

### Keywords
**Limit: 100 characters** · Comma-separated, no spaces after commas, no duplicate words from app name

```
qiblah,qibla,prayer,salah,athan,azkar,tasbih,muslim,islam,compass,ramadan,masjid,free
```

**Character count:** 88

### Support URL

```
https://example.com/support
```

### Marketing URL (optional)

```
https://example.com
```

### Privacy Policy URL

```
https://example.com/privacy
```

---

## What's New (version 1.0.0)

**Limit: 4,000 characters**

```
Welcome to Al-Qiblah & Prayer Companion!

• Qiblah compass with real-time direction
• Prayer times, countdown, and optional notifications
• Azkar and Tasbih counter
• 24 languages
• 100% free with no ads
```

---

## App Privacy (Privacy Nutrition Labels)

Configure in App Store Connect → App Privacy:

| Data type | Collected? | Linked to user? | Used for tracking? | Purpose |
|-----------|------------|-----------------|-------------------|---------|
| Precise location | Yes | No | No | App functionality (Qiblah & prayer times) |
| Coarse location | Yes | No | No | App functionality |
| All other types | No | — | — | — |

Notes for review:
- Location is read for calculation only and stored locally via `SharedPreferences`
- No analytics, advertising, or third-party SDKs that collect personal data
- No account system

---

## Age rating questionnaire (summary)

| Topic | Answer |
|-------|--------|
| Cartoon or fantasy violence | None |
| Realistic violence | None |
| Sexual content | None |
| Profanity | None |
| Horror | None |
| Medical/treatment info | None |
| Gambling | None |
| Unrestricted web access | No |
| User-generated content | No |

**Expected rating:** 4+

---

## Review notes (optional, for App Review team)

```
This app provides a Qiblah compass (device magnetometer via flutter_qiblah), prayer time calculations (adhan library, on-device), and Islamic supplication text (bundled JSON assets).

Location is requested to compute prayer times and Qiblah bearing. Users can deny location and select a city manually.

Notifications are local only (flutter_local_notifications) for optional prayer reminders.

No login, no server, no ads, no IAP.

To test:
1. Grant location or pick a city (e.g. Makkah, Cairo, London)
2. Open Qiblah tab — compass should point toward Makkah
3. Open Prayer Times — schedule and countdown should appear
4. Open Settings (gear icon) to change language or calculation method
```

---

## Graphic assets checklist

Prepare in App Store Connect (not included in this file):

- [ ] App icon — 1024 × 1024 PNG (no alpha channel)
- [ ] iPhone 6.7" screenshots — required (1290 × 2796)
- [ ] iPhone 6.5" screenshots — required (1284 × 2778 or 1242 × 2688)
- [ ] iPhone 5.5" screenshots — if supporting older displays
- [ ] iPad Pro 12.9" screenshots — if `supportsTablet` is enabled

**Suggested screenshot titles (overlay text):**
1. Accurate Qiblah Direction
2. Prayer Times & Countdown
3. Daily Azkar
4. Tasbih Counter
5. 24 Languages — Settings

---

## Localized metadata (optional)

Add in App Store Connect → App Information → Localizable Information.

| Locale | Name (≤30) | Subtitle suggestion |
|--------|------------|---------------------|
| ar | القبلة ورفيق الصلاة | القبلة والصلاة والأذكار |
| fr | Al-Qiblah et Compagnon de Prière | Qiblah, prières et Azkar |
| de | Al-Qiblah & Gebetsbegleiter | Qibla, Gebetszeiten, Azkar |
| es | Al-Qiblah y Compañero de Oración | Qiblah, oración y Azkar |
| tr | Kıble ve Namaz Rehberi | Kıble, namaz vakitleri |
| id | Al-Qiblah & Pendamping Shalat | Kiblat, shalat, azkar |
| ur | القبلہ اور نماز کا ساتھی | قبلہ، نماز، اذکار |

Source localized app names from `lib/l10n/app_*.arb` → `appTitle`.

---

## Export compliance

| Question | Answer |
|----------|--------|
| Uses encryption? | Yes (HTTPS only / standard iOS encryption) |
| Qualifies for exemption? | Yes — standard app encryption only (submit annual self-classification if required) |
