# Product Requirement Document (PRD)

## Project Overview

* **Product Name:** Al-Qiblah & Prayer Companion
* **Platform:** iOS and Android (Cross-platform)
* **Technology Stack:** Flutter, `flutter_qiblah` plugin
* **Monetization:** 100% Free (No ads, no paywalls, focused on clean UX)

---

## 1. Executive Summary

The **Al-Qiblah & Prayer Companion** app is a lightweight, intuitive, and completely free mobile application designed to help Muslims fulfill their daily spiritual obligations. The core value proposition is to provide an accurate Qiblah compass, precise localized prayer times, and a built-in Azkar (supplications) counter without the clutter of invasive ads or premium paywalls.

---

## 2. Target Audience & Personas

* **The Muslim Traveler:** Frequently moves across cities/countries and needs an immediate, reliable way to find the Qiblah direction and local prayer times without configuring complex settings.
* **The Daily Commuter:** Needs quick access to morning/evening Azkar and accurate countdowns to the next prayer while on the go.

---

## 3. Core Features & Functional Requirements

### 3.1 Qiblah Finder (Core Feature)

* **Description:** A real-time visual compass pointing toward the Kaaba in Makkah.
* **Technical Implementation:** Utilizes the `flutter_qiblah` package to leverage the device's magnetometer and accelerometer.
* **Requirements:**
* Smooth, auto-rotating compass UI.
* Clear indication (e.g., haptic feedback or color change to green) when the user is perfectly aligned with the Qiblah.
* Error handling for missing sensors or required calibration (prompting the user to do the "Figure 8" motion if accuracy is low).



### 3.2 Precise Prayer Times

* **Description:** Displays the 5 daily prayers (Fajr, Dhuhr, Asr, Maghrib, Isha) plus Sunrise.
* **Requirements:**
* **Location-Based Calculations:** Automatically fetch coordinates via GPS (using `geolocator`) to calculate highly accurate local prayer times.
* **Offline Mode:** Cache prayer times for the current month so the app works without an active internet connection.
* **Calculation Methods:** Settings toggle to choose standard calculation authorities (e.g., Umm al-Qura, ISNA, Muslim World League).
* **Countdown Timer:** A prominent visual widget showing the time remaining until the next prayer.



### 3.3 Azkar & Tasbih Counter

* **Description:** A dedicated section for daily supplications and a digital counter.
* **Requirements:**
* **Categorized Azkar:** Sections for "Morning", "Evening", and "Post-Prayer" supplications.
* **Digital Tasbih Counter:** A simple tap-to-count screen with haptic feedback on every tap and a distinct vibration when reaching milestones (e.g., 33, 100).
* **Reset functionality** to clear the current session count.



### 3.4 Notifications & Alerts

* **Description:** Reminders for prayer times.
* **Requirements:**
* Local push notifications at the exact time of Adhan.
* Option to toggle notifications on/off per individual prayer.



---

## 4. Technical Architecture & Constraints

```
+-------------------------------------------------------+
|                     Flutter UI                        |
|   (Qiblah Compass | Prayer Times | Azkar & Tasbih)    |
+-------------------+-------------------+---------------+
                    |                   |
                    v                   v
        +-------------------+   +-----------------------+
        |  flutter_qiblah   |   |   Geolocator / GPS    |
        |  & Device Sensors |   |   & Adhan Time Engine |
        +-------------------+   +-----------------------+

```

* **State Management:** Riverpod or BLoC for clean, predictable state changes (especially important for real-time compass streams).
* **Location Permissions:** The app must gracefully ask for location permissions (Foreground location). If denied, it must fall back to a manual city selection screen.
* **Sensor Dependencies:** Since `flutter_qiblah` relies on a device magnetometer, devices lacking this hardware must display a clean, informative error message explaining why the compass feature is unavailable.

---

## 5. UI/UX Design Guidelines

* **Minimalist & Clean:** Zero clutter. Avoid deep, confusing menus. Use a tab-bar navigation (Qiblah, Prayer Times, Azkar).
* **Dark Mode Support:** Essential for night-time readings (especially during Isha or Fajr prayers).
* **Feedback Loops:** Subtle animations on the compass needle and crisp haptic clicks on the Tasbih counter to make the app feel highly responsive.

---

## 6. Non-Functional Requirements

* **Privacy First:** No personal user data or precise tracking locations should be sent to external servers. All coordinate storage/calculations happen locally on the device.
* **Performance:** The app should launch in under 2 seconds and have zero lag on the compass animation.
* **Battery Optimization:** Limit GPS polling. Fetch the user's location once upon open (or when a significant location change occurs) rather than keeping a continuous background GPS lock.

---

## 7. Future Scope (Phase 2)

* Home screen widgets for quick access to prayer countdowns.
* Wear OS / Apple Watch companion apps for the Tasbih counter and prayer times.
* Audio playback for the Azkar recitations.