class UserFields {
  static final String id = 'id';
  static final String fullname = 'fullname';
  static final String email = 'email';
  static final String address = 'address';
  static final String isworker = 'isworker';
  static final String isemployer = 'isemployer';

  static List<String> getFields() =>
      [id, fullname, email, address, isworker, isemployer];
}

class User {
  final int? id;
  final String fullname;
  final String email;
  final String address;
  final bool isworker;
  final bool isemployer;

  const User(
      {this.id,
      required this.fullname,
      required this.email,
      required this.address,
      required this.isworker,
      required this.isemployer});

  User copy({
    int? id,
    String? fullname,
    String? email,
    String? address,
    bool? isworker,
    bool? isemployer,
  }) =>
      User(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        address: address ?? this.address,
        isworker: isworker ?? this.isworker,
        isemployer: isemployer ?? this.isemployer,
      );

  static User fromJson(Map<String, dynamic> json) => User(
      id: json[UserFields.id],
      fullname: json[UserFields.fullname],
      email: json[UserFields.email],
      address: json[UserFields.address],
      isworker: json[UserFields.isworker],
      isemployer: json[UserFields.isemployer]);

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.fullname: fullname,
        UserFields.email: email,
        UserFields.address: address,
        UserFields.isworker: isworker,
        UserFields.isemployer: isemployer
      };
}

class UserProfile{
  final String imagePath;
  final String name;
  final String email;
  final String phone;
  final String about;
  final bool isDarkmode;

  const UserProfile({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phone,
    required this.about,
    required this.isDarkmode,
});
}