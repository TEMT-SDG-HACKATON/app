class AuthService {
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;

  String get email => _email ?? '';
  String get phoneNumber => _phoneNumber ?? '';
  String get lastName => _lastName ?? '';
  String get firstName => _firstName ?? '';

  void setEmail(String value) {
    _email = value;
  }

  void setAuthInfo(String firstName, String lastName, String phoneNumber) {
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
  }
}
