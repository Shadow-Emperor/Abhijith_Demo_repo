class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String profileUrl;

  UserModel({required this.id, required this.email, required this.firstName, required this.lastName, required this.profileUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profileUrl: json['avatar'],
    );
  }
}
