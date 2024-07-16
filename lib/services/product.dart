class Product {
  int id;
  String productName;
  double price;
  String url;


  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.url});

  factory Product.fromJson(Map<String, dynamic>json){
    return switch(json){
      {
      'id' : int id,
      'productName' : String productName,
      'price' : double price,
      'url' : String url,

      } =>
          Product (
            id: id,
            productName: productName,
            price: price,
            url: url,

          ),
      _=> throw const FormatException
        ('Failed to load products'),

    };
  }
}