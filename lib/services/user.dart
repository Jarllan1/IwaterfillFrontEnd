class User{
  final String username;
  final String email;
  final String password;
  final String phone;

  User({required this.username,
    required this.email,
    required this.password,
    required this.phone,});

  Map<String, dynamic> toJson() =>{
    'username' : username,
    'email' : email,
    'password' : password,
    'phone' : phone,

  };
}