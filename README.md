
#  flutter_boilerplate
Creating an easy-to-start boilerplate for future personal projects, using Clean Architecture and Atomic Design as references.  
##  Structure
```
lib/
├── core/
│ ├── error/
│ ├── usecases/
│ └── utils/
│ └── config/
│ └── flavors.dart
├── env/
│ └── env_config.dart
├── features/
│ ├── auth/
│ │ ├── data/
│ │ │ ├── models/
│ │ │ ├── repositories/
│ │ │ └── datasources/
│ │ ├── domain/
│ │ │ ├── entities/
│ │ │ ├── repositories/
│ │ │ └── usecases/
│ │ └── presentation/
│ │ ├── cubits/
│ │ ├── pages/
│ │ └── widgets/
│ ├── home/
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
│ └── ...
├── generated/
│ └── intl/
│ └── messages_all.dart
├── l10n/
│ ├── intl_en.arb
│ ├── intl_es.arb
│ └── ...
├── shared/
| ├── presentation/
│ │ ├── cubits/
│ │ ├── pages/
│ │ ├── router/
│ │ └── widgets/
│ └── di/
├── main.dart
├── initialize.dart
```

##  How to Run
_**Make sure you have your configuration files ready!!!**_

### Install dependencies
```
fvm flutter pub get
```
### Generate Files
```
dart run build_runner build
```
### Generate Localization & Strings
```
flutter gen-l10n --template-arb-file=intl_en.arb
dart run intl_utils:generate
```

### Run
```
fvm flutter run -d <device-name> --dart-define=FLAVOR=<flavor>
```

Available Flavors: 
- prod
- dev
- stage