class UserInfo {
  final String name;
  final String avatar;
  final String phone;
  final String location;
  final String gender;
  final String age;
  final String email;
  final String password;
  UserInfo(
      {this.name,
      this.avatar,
      this.phone,
      this.location,
      this.gender,
      this.age,
      this.email,
      this.password});
  factory UserInfo.initialState() {
    return UserInfo(
      name: "Miroslava Savitskaya",
      avatar: "assets/images/avatar.jpg",
      age: "25",
      gender: "Female",
      phone: "03520995801",
      location: "Kyiv, Ukraine",
      email: "demo@gmail.com",
      password: "demo123",
    );
  }
  UserInfo copyWith(
      {String name,
      String avatar,
      String phone,
      String location,
      bool gender,
      String age,
      String email,
      String password}) {
    return UserInfo(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  List<Object> get props =>
      [name, avatar, phone, gender, location, age, email, password];
}
