class SalesOrder {
  final int? id;
  final String customerName;
  final String productName;
  final int quantity;
  final double price;

  SalesOrder({
    this.id,
    required this.customerName,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerName': customerName,
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }

  factory SalesOrder.fromMap(Map<String, dynamic> map) {
    return SalesOrder(
      id: map['id'],
      customerName: map['customerName'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }
}
