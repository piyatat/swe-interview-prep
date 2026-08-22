# Mobile engineer (iOS / Android)

Focus: **platform SDKs, app lifecycle, UI performance, offline/sync, and mobile-specific system constraints** (battery, network, store policies).

## What interviewers probe

| Area | Signals |
| --- | --- |
| Platform | Activity/Fragment or UIViewController lifecycle |
| UI | Layout, lists, navigation, state restoration |
| Concurrency | Main thread rules; structured concurrency / coroutines |
| Networking | REST/GraphQL clients, caching, retries |
| Storage | SQLite, Core Data, Room; migration |
| Quality | Crashes, ANRs, memory leaks, profiling |

## Sample questions

### iOS (Swift)

1. Explain ARC and common retain cycles; weak vs unowned.
2. UIViewController lifecycle — where to start network calls?
3. DiffableDataSource vs manual UITableView updates.
4. GCD vs Swift concurrency (`async/await`, actors).
5. App background modes and push notification flow.

### Android (Kotlin)

1. Activity vs Fragment lifecycle; configuration changes.
2. Coroutines — scope, dispatcher, structured concurrency.
3. Jetpack Compose recomposition vs RecyclerView performance.
4. Room migrations and offline cache.
5. ANR causes and StrictMode debugging.

### Cross-platform (React Native / Flutter)

1. Bridge vs native modules — when drop to native?
2. List performance — virtualization, image caching.
3. OTA updates vs store release tradeoffs.

### System design (mobile)

1. Design offline-first note sync with conflict resolution.
2. Design push notification pipeline (topics, dedupe, quiet hours).
3. Design image upload with background retry and bandwidth awareness.
4. Design a feed with pagination and prefetch.

### Behavioral

1. Ship blocked by App Store review — how handled?
2. Crash spike after release — rollback and hotfix process.

## Prep tips

- One **platform deep** + awareness of the other for full-stack mobile roles.
- Prepare a **profiling story** (Instruments, Android Profiler).
- Review your own app’s architecture diagram aloud.

## Sources

- [Software Engineer Interview Guide — Interview Pilot](https://www.interviewpilot.app/interview-guides/software-engineer) — accessed 2026-08-22
- General mobile prep: Apple/Google official architecture guides (linked in [../resources/books-and-courses.md](../resources/books-and-courses.md))
