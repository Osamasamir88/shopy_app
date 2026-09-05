class LoginRequestBody {
  final String id;
  final String password;

  LoginRequestBody({required this.id, required this.password});

  Map<String, dynamic> toJson() {
    return {'identifier': id, 'password': password};
  }
}
