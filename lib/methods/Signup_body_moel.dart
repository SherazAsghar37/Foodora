class SignupBody {
  final String name;
  final String phone;
  final String email;
  final String password;
  SignupBody(
      {required this.email,
      required this.name,
      required this.password,
      required this.phone});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
