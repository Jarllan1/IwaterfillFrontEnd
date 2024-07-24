class Product {
  int id;
  String paymentId;
  String productName;
  int quantity;
  DateTime paymentDate;
  String location;
  double price;

  Product({
    required this.id,
    required this.paymentId,
    required this.productName,
    required this.quantity,
    required this.paymentDate,
    required this.location,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      return Product(
        id: json['id'],
        paymentId: json['paymentId'],
        productName: json['productName'],
        quantity: json['quantity'],
        paymentDate: DateTime.parse(json['paymentDate']),
        location: json['location'],
        price: json['price'],
      );
    } catch (e) {
      throw FormatException('Unable to load payment: ${e.toString()}');
    }
  }
}
