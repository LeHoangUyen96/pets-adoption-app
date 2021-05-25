class Login {
  final String email;
  final String password;

  factory Login.initial() {
    return Login(
      email: '',
      password: '',
    );
  }

  Login({this.email, this.password});

  Login copywith({
    String email,
    String password,
  }) {
    return Login(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
