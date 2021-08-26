import 'package:flutter/cupertino.dart';

String? passwordValidator({
  required String password,
}) {
  if (password.isEmpty) {
    return ('Password empty');
  } else if (password.length < 6) {
    return ('Password too short');
  }
  return null;
}

String? emailValidator({
  required String email,
}) {
  const Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z](?:[a-zA-Z]"
      r'{0,253}[a-zA-Z])?(?:\.[a-zA-Z0-9](?:[a-zA-Z]'
      r'{0,253}[a-zA-Z0-9])?)*$';
  final RegExp regex = RegExp(pattern as String);

  if (!regex.hasMatch(email) || email == null)
    return ('email not valid');
  else
    return null;
}

String? confirmPasswordValidator(
    {required String password, String? confirmPassword}) {
  if (password.isEmpty) {
    return ('Password empty');
  } else if (password.length < 3) {
    return ('Password too short');
  } else if (password != confirmPassword) {
    return ('Password not matching');
  }
  return null;
}
