class UtilsFunctions {
  static String convertTime(String input) {
    // Extract the value and unit (either "min" or "sec")
    final parts = input.split(' ');
    final isSeason = parts[0].contains("S");
    final int value = int.parse(parts[0].toUpperCase().replaceAll("S", ""));
    final String unit = parts[1].toLowerCase();

    // Convert value to total minutes, rounding up for seconds >= 30
    int totalMinutes;
    if (unit == "sec") {
      totalMinutes = (value + 29) ~/ 60; // Add 29 to round up for seconds >= 30
    } else if (unit == "min") {
      totalMinutes = value; // Already in minutes
    } else {
      throw ArgumentError("Input must be in 'min' or 'sec' format");
    }

    // Calculate hours and remaining minutes
    final int hours = totalMinutes ~/ 60;
    final int minutes = totalMinutes % 60;

    // Build the formatted string
    if (hours > 0) {
      return '$hours hours $minutes minutes${isSeason ? " per episode" : ""}';
    } else {
      return '$minutes minutes${isSeason ? " per episode" : ""}';
    }
  }
}