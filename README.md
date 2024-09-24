# Dev Challenge

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://dart.dev/guides/language/effective-dart)

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

This project uses the Very Good Analysis lint rules and follows
the [Effective Dart](https://dart.dev/guides/language/effective-dart) rules.

Please format your code (class-, file-, method-names and so on) that way and use the suggestions provided by Very Good
Analysis.
Enable
automatic [code formatting](https://docs.flutter.dev/development/tools/formatting#automatically-formatting-code-in-android-studio-and-intellij).

Widgets should be responsive and fixed pixel values should not be used.
Use LayoutBuilder and MediaQuery. More infos [here](https://docs.flutter.dev/development/ui/layout/adaptive-responsive).

Update the release_notes.txt file with the changes you have made.

This app uses a light and dark theme and supports English, German and Turkish.

---

## Tasks 📋
- Use the staging environment and please read the complete readme before starting!
- Enable GitHook. See command below.
- Show a list of ToDo items on the HomePage. You can use the ToDosBloc bloc to get the list of ToDo items.
- Display the name, done status and createdAt date of the ToDo items.
- If there was an error loading the list of ToDo items, show the error message.
- Use the AddToDoPage to add a new ToDo item. Create a cubit to manage the state for the new ToDo item.
- Create a text field for the name and a checkbox with the text "Done" for the status.
- To upload an item to the backend use the AddToDoBloc bloc.
- Show a loading indicator while uploading the item.
- If there was an error uploading the item, show the error message.
- If the upload was successful reload the list of ToDo items from the backend and navigate back to the HomePage.
- Create a pull request with your solution.
- Do not use setState and fix all warnings.

---

# Enable GitHook🪝

```sh
git config core.hooksPath .githooks/
```

## Update Assets 🏞️

```sh
# Update Assets
dart run build_runner build --delete-conflicting-outputs
```

## Update Localization 🇩🇪🇺🇸🇹🇷

```sh
# Update Localization
dart run easy_localization:generate -f keys -S assets/translations -o locale_keys.g.dart
```
# Format code 💻

```sh
dart format .
```

# Analyze code 🕵️

```sh
flutter analyze
```

# Fix code 🔧

```sh
dart fix --apply
```

---

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
