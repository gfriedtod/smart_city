// Import statements are omitted as they are not part of the provided snippet.

class RegisterRequest {
  String? username;
  String? email;
  String? password;

  // Builder constructor equivalent in Dart
  RegisterRequest({this.username, this.email, this.password});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}