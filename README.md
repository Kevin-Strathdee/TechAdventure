# japomo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Generate Graphql Code

This app use Artemis(https://pub.dev/documentation/artemis/latest/) to generate dart code
based on graphql schema file. To generate the dart files execute:

flutter pub run build_runner build

The generated dart files can be found in /lib/graphql/generated
