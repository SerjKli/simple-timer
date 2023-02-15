class ValidationService {
  /// Check if field is filled
  static String requiredField() {
    return "This field is required";
  }

  /// Compare two string are equal
  static String? stringIsEqual(
    String str,
    String compareTo, [
    String? customMessage,
  ]) {
    if (str != compareTo) {
      if (customMessage != null) {
        return customMessage;
      }
      return "Strings should be equal";
    }

    return null;
  }

  /// Check if string is valid with conditions
  static dynamic stringIsValid(
    String str, [
    String? fieldName,
    int minLength = 1,
    int maxLength = 0,
  ]) {
    final prefix = fieldName ?? "String";

    if (str.length < minLength && maxLength != 0 && str.length > maxLength) {
      return "$prefix} should be from $minLength to $maxLength in length";
    }

    if (str.length < minLength) {
      return "$prefix should have at least $minLength symbols";
    }

    if (maxLength != 0 && str.length > maxLength) {
      return "$prefix can be maximum $maxLength symbols";
    }

    return null;
  }

  /// Check if value is valid integer
  static dynamic isValidInteger(dynamic value, [int min = 0, int max = 0]) {
    int parsed;
    try {
      parsed = int.parse(value);
    } catch (ex) {
      return "Field should have a valid integer";
    }
    if (min == 0 && max == 0) {
      return null;
    }

    if (min != 0 && parsed < min) {
      return "Value can be minimum $min";
    }
    if (max != 0 && parsed > max) {
      return "Value can be maximum $max";
    }
  }
}
