class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? profilePhoto;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profilePhoto,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      name: map["name"],
      username: map["username"],
      email: map["email"],
      profilePhoto: map["profile_photo"],
      phoneNumber: map["phone_number"],
    );
  }

  factory User.dummy() {
    return User(
      id: 001,
      name: "Elsa Maharani Sermana",
      username: "elsaamhr",
      email: "2006145@itg.ac.id",
      profilePhoto:
          "https://i.pinimg.com/564x/f1/39/63/f13963c024d3b1e8fe55d78b0654b985.jpg",
      phoneNumber: "0838621797876",
    );
  }
}