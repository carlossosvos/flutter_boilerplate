# flutter_boilerplate

Creating an easy-to-start boilerplate for future personal projects. Based on Clean Architecture.

## Structure
Current folder strucuture would looks like this:
```
lib/
|-- auth/
|   |-- data/
|   |   |-- datasources/
|   |   |-- models/
|   |   |-- repositories/
|   |-- domain/
|   |   |-- entities/
|   |   |-- repositories/
|   |   |-- usecases/
|   |
|   |-- presentation/
|       |-- pages/
|       |-- widgets/
|       |-- blocs/
|       |-- cubits/
|       |-- theme/
|       |-- router/
|
|-- shared/
|   |-- data/
|   |   |-- datasources/
|   |   |-- models/
|   |   |-- repositories/
|   |
|   |-- domain/
|   |   |-- entities/
|   |   |-- repositories/
|   |   |-- usecases/
|   |
|   |-- presentation/
|   |   |-- pages/
|   |   |-- widgets/
|   |   |-- blocs/
|   |   |-- cubits/
|   |   |-- theme/
|   |   |-- router/
|   |
|   |-- core/
|   |   |-- errors/
|   |   |-- utils/
|   |   |-- theme/
|   |
|   |-- di/
|
|-- main.dart

```
