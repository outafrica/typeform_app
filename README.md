# typeform_app

# Build environment

Application supports several build environments: `STAGING, DEVELOPMENT,  PRODUCTION`. You can specify environment by --dart-define flag. Default value is `STAGING`.

We support only two flavors: `staging` & `production`.

```
flutter run --flavor staging --dart-define=ENVIRONMENT=STAGING
```

## Build Runner

```
flutter pub run build_runner build --delete-conflicting-outputs
```