class LoginScreenMixin {
  String validateEmail(String value) {
    if (!value.contains('@gmail.com')) {
      return 'Please enter valid email address';
    }
    
  }

  String validatePassword(value) {
    if (!(value.length >= 4) || !(value.length <= 22)) {
      return 'Password length must be in between 4 to 22 characters';
    }
    
  }
}
