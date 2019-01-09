import 'package:flutter/material.dart';

bool valueIsEmpty(String value) {
  return value.isEmpty || value.trim().length <= 0;
}

bool isEmail(String value) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value.trim());
}

bool isPasswordStrongEnough(String value) {
  return RegExp(
          r"(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$")
      .hasMatch(value);
}

bool isDateValid(String value) {
  return RegExp(
          r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
      .hasMatch(value);
}

bool isBetween(int min, int max, int nb) {
  return nb > min && nb < max;
}

bool isBetweenDouble(double min, double max, double nb) {
  return nb > min && nb < max;
}

bool isDuplicate(List<int> l, int n) {
  int nb = 0;
  
  l.forEach((e){
    if (e == n) {
      nb++;
    }
  });
  return nb > 1;
}

bool isTel(String s) {
  if (s == null) {
    return false;
  }
  try {
    int i = int.parse(s);
    if (i != null) {
      return true;
    }
    return false;
  } catch (err) {
    return false;
  }
}
