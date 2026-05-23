# API Connections (Riverpod + REST + Flutter)

A sleek, robust Flutter application demonstrating modern asynchronous data fetching, state management with Riverpod, and clean UI design patterns. This application connects to a public REST API (`JSONPlaceholder`) to dynamically fetch, parse, and display user profiles.

## 📱 Screenshots

| Splash / Loading State | User Directory | Detailed Profile Workspace |
|---|---|---|
| <img src="T4.1.png" width="250"> | <img src="T4.2.png" width="250"> | <img src="T4.3.png" width="250"> |

---

## 🚀 Features<img width="1033" height="605" alt="T4 1" src="https://github.com/user-attachments/assets/f5e9ce3a-a222-40df-ada5-b09d99ae6327" />
<img width="1033" height="605" alt="T4 1" src="https://github.com/user-attachments/assets/06eb519e-35cc-422a-bd4a-93ab2be088b5" />



### 1. HTTP Requests & Robust JSON Parsing
* Integrates the standard `http` package to securely fetch raw data from external REST endpoints.
* Deserializes nested JSON response objects into strongly-typed Dart Model classes (`UserModel`) to eliminate runtime errors.

### 2. State Management with Riverpod
* Leverages Flutter Riverpod (`FutureProvider`) to seamlessly handle the lifecycle of asynchronous network requests.
* Separates data-fetching and business logic entirely from the presentation layer.

### 3. Dynamic UI & Error Safeguards
* **Loading Indicators:** A clean, custom centered loading spinner displays during network flight periods.
* **ListView Directory:** Renders active connections asynchronously using an efficient scrollable `ListView.builder`.
* **Deep-Dive Profile Workspace:** Tapping any list entry routes smoothly to a unique node reference workspace featuring detailed account specifications (Email, Username, and custom User Node ID tokens).

---

## 🛠️ Architecture & Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** Riverpod 
* **Networking:** HTTP Client
