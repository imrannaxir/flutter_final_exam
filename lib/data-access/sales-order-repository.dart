
import '../core/sales-order.dart';
import 'base-repository.dart';

class SalesOrderRepository extends BaseRepository<SalesOrder> {
  @override
  String get tableName => 'salesorders';

  @override
  SalesOrder fromMap(Map<String, dynamic> map) {
    return SalesOrder(
      id: map['id'],
      customerName: map['customerName'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }

  @override
  Map<String, dynamic> toMap(SalesOrder item) {
    return {
      'customerName': item.customerName,
      'productName': item.productName,
      'quantity': item.quantity,
      'price': item.price,
    };
  }

}