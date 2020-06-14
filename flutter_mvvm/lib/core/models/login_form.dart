import 'dart:convert';

LoginForm loginFormFromJson(String str) => LoginForm.fromJson(json.decode(str));

String loginFormToJson(LoginForm data) => json.encode(data.toJson());

class LoginForm {
  LoginForm({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory LoginForm.fromJson(Map<String, dynamic> json) => LoginForm(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
