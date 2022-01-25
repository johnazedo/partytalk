class UserResponse {
  String email;
  String name;
  String username;
  String? photoURL;

  UserResponse({required this.email,
    required this.name,
    required this.username,
    this.photoURL});

  UserResponse.fromJSON(Map<String, dynamic> json)
      : name = json["name"],
        username = json["username"],
        email = json["email"],
        photoURL = json["photoURL"];
}