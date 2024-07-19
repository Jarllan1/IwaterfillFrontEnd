  class Userdetail{

  final String phoneNumber;
  final String address;


  Userdetail({

  required this.phoneNumber,
    required this.address,});

  Map<String, dynamic> toJson() =>{

    'username' : phoneNumber,
    'email' : address,


  };
}