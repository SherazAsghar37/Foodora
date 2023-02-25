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
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
