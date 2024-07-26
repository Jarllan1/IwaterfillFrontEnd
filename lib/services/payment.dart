class Payment {
  int id;
  int userId;
  String paymentId;
  String productName;
  int quantity;
  DateTime paymentDate;
  String location;
  double price;

  Payment({
    required this.id,
    required this.userId,
    required this.paymentId,
    required this.productName,
    required this.quantity,
    required this.paymentDate,
    required this.location,
    required this.price,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    try {
      return Payment(
        id: json['id'],
        userId: json['userId'],
        paymentId: json['paymentId'],
        productName: json['productName'],
        quantity: json['quantity'],
        paymentDate: DateTime.parse(json['paymentDate']),
        location: json['location'],
        price: (json['price'] as num).toDouble(),
      );
    } catch (e) {
      throw FormatException('Unable to load payment: ${e.toString()}');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'paymentId': paymentId,
      'productName': productName,
      'quantity': quantity,
      'paymentDate': paymentDate.toIso8601String(),
      'location': location,
      'price': price,
    };
  }
}