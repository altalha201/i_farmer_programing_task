import 'dart:math';

extension StringExtension on String {
  String get capitalize =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  bool get isAvailable => this != "N/A";

  bool get isNotAvailable => this == "N/A";
}

extension ListExtension<T> on List<T> {
  T random() {
    if (isEmpty) {
      throw StateError('Cannot get a random element from an empty list.');
    }
    final random = Random();
    return this[random.nextInt(length)];
  }

  List<T> randomElements(int count) {
    if (isEmpty) {
      throw StateError('Cannot get random elements from an empty list.');
    }
    if (count <= 0) {
      throw ArgumentError('Count must be greater than 0.');
    }

    final random = Random();
    return toList()..shuffle(random)..length = min(count, length);
  }
}