# Diskurs Remastered

Remake of the [Diskurs](https://github.com/sunderee/Diskurs) application more than a year later.

## Usage

This Flutter project requires the latest **stable** version installed (at the moment that's 2.5). You will have to provide `config.const.dart` file in `utils/constants` with the following contents:

```dart
const String host = 'XXX';
const String queryEndpoint = 'XXX';
const String corpusEndpoint = 'XXX';
```

## Motivation

This is not the fully-fledged app, like the original was, nor do I plan on updating the already published version with this one. Let's say that the project from a year ago serves as a relic of times before Flutter became 2.0, before Dart got null safety support, while this project serves as a testament of how the ecosystem evolved, and myself with it.

The original agreement with the developers behind [`kontekst.io`](https://kontekst.io) (service that brings this project alive) was to never expose the API endpoints. Given the open-source nature of the project, I will stay true to my word. The instructions above give you an idea of what piece of puzzle is missing.

## License

Just like the old guy, new kid on the bloc (see what I did there?) is open-sourced under MIT license.
