class User{
  final String username;
  final String email;
  final String phone;
  final String password;


  User({required this.username,
    required this.email,
    required this.phone,
    required this.password,});

  Map<String, dynamic> toJson() =>{
    'username' : username,
    'email' : email,
    'phone' : phone,
    'password' : password,


  };
}