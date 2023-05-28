String? emailValidation(String email) {
  bool isContain = ['com', 'net', 'org', 'tr', 'edu']
      .any((listElement) => email.contains(listElement));
  if (email.isEmpty || !email.contains('@') || !isContain) {
    return "Lütfen geçerli bir e-posta adresi giriniz.";
  }
  return null;
}

String? passwordValidation(String password) {
  bool isPasswordContainsNumber = password.contains(RegExp(r'[0-9]'));
  bool isPasswordContainsUpperCase = password.contains(RegExp(r'[A-Z]'));
  bool isPasswordContainsLowerCase = password.contains(RegExp(r'[a-z]'));
  // bool isPasswordContainsSpecialCharacter =
  //     password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  if (password.isEmpty ||
      password.length < 8 ||
      !isPasswordContainsNumber ||
      !isPasswordContainsUpperCase ||
      !isPasswordContainsLowerCase) {
    return "Parolanız en az 8 karakter, 1 büyük, 1 küçük harf ve 1 sayı içermelidir.";
  }
  return null;
}
