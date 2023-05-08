import '../core/sales-order.dart';
import '../data-access/sales-order-repository.dart';

class SalesOrderService {
  final _repository = SalesOrderRepository();

  Future<int> addSaleOrder(SalesOrder saleOrder) async {
    return await _repository.insert(saleOrder);
  }

  Future<List<SalesOrder>> getAllSaleOrders() async {
    return await _repository.getAll();
  }

  Future<int> updateSaleOrder(SalesOrder saleOrder, int id) async {
    return await _repository.update(saleOrder, id);
  }

  Future<int> deleteSaleOrder(int id) async {
    return await _repository.delete(id);
  }
}
