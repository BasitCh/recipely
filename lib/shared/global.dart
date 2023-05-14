String? validateEmail(String? val) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (val == null || val.isEmpty) {
    return 'Please enter your email address';
  } else if (!RegExp(emailRegex).hasMatch(val)) {
    return 'The email you entered is invalid';
  } else {
    return null;
  }
}
