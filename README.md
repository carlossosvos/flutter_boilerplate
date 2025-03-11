# flutter_boilerplate

Creating an easy-to-start boilerplate for future personal projects. Based on Clean Architecture.

## Structure
Current folder strucuture would looks like this:
```
lib/
├── core/
│   ├── error/
│   ├── usecases/
│   └── utils/
│   └── config/
│       └── flavors.dart
├── env/
│   └── env_config.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── datasources/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── cubits/
│   │       ├── pages/
│   │       └── widgets/
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── ...
├── generated/
│   └── intl/
│       └── messages_all.dart
├── l10n/
│   ├── intl_en.arb
│   ├── intl_es.arb
│   └── ...
├── shared/
|   ├── presentation/
│   │   ├── cubits/
│   │   ├── pages/
│   │   ├── router/
│   │   └── widgets/
│   └── di/
├── main.dart
├── initialize.dart
```
