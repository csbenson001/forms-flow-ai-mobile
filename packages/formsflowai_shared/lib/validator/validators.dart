class Validators {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Some text";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a valid password";
    }
    return null;
  }
}
