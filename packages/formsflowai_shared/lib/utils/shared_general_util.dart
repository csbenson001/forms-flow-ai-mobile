class SharedGeneralUtil {
  static bool isStringEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return false;
  }
}
