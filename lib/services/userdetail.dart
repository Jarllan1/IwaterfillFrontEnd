  class Userdetail{

  final String phoneNumber;
  final String address;


  Userdetail({

  required this.phoneNumber,
    required this.address,});

  Map<String, dynamic> toJson() =>{

    'phoneNumber' : phoneNumber,
    'address' : address,


  };
}