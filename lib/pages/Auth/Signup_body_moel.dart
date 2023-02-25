class SignupBody {
  final String name;
  final String phone;
  final String email;
  final String password;
  SignupBody(this.email, this.name, this.password, this.phone);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
