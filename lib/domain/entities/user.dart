

class User {
  String? uid;
  late String name;
  late String email;
  late String username;
  String? photoURL;

  User({
    this.uid,
    required this.name,
    required this.email,
    required this.username,
    this.photoURL
  });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'name': name,
    'username': username,
    'photoURL': photoURL,
  };
}