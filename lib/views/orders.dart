import 'package:flutter/material.dart';
import 'package:flutter_final_exam/views/widgets/temTextFormField.dart';
import '../core/sales-order.dart';
import '../business-access/sales-order-service.dart';

class SalesOrderPage extends StatefulWidget {
  const SalesOrderPage({super.key});

  @override
  State<SalesOrderPage> createState() => _salesOrderPageStates();
}

class _salesOrderPageStates extends State<SalesOrderPage> {
  final SalesOrderService _service = SalesOrderService();

  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<SalesOrder> _saleOrders = [];

  void _addSaleOrder() async {
    final String customerName = _customerNameController.text;
    final String productName = _productNameController.text;
    final double price = double.tryParse(_priceController.text) ?? 0.0;
    final int quantity = int.tryParse(_quantityController.text) ?? 0;

    if (customerName.isNotEmpty &&
        productName.isNotEmpty &&
        price > 0 &&
        quantity > 0) {
      final SalesOrder newSaleOrder = SalesOrder(
        customerName: customerName,
        productName: productName,
        price: price,
        quantity: quantity,
      );
      await _service.addSaleOrder(newSaleOrder);

      setState(() {
        _saleOrders.add(newSaleOrder);
      });

      _customerNameController.clear();
      _productNameController.clear();
      _priceController.clear();
      _quantityController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter the  value of CustomerName , ProductName , Price & Quantity',
          ),
          duration: Duration(
            seconds: 15,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSaleOrders();
  }

  void _loadSaleOrders() async {
    final List<SalesOrder> saleOrders = await _service.getAllSaleOrders();
    setState(() {
      _saleOrders = saleOrders;
    });
  }

  Future<void> _deleteSaleOrder(int id) async {
    try {
      await _service.deleteSaleOrder(id);
      setState(() {
        _saleOrders.removeWhere((saleOrder) {
          return saleOrder.id == id;
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _customerNameController,
                decoration: const InputDecoration(hintText: 'Customer Name'),
              ),
              temTextFormField(
                controller: _productNameController,
                customHintText: 'Product Name',
                backgroundColor: Colors.red,
              ),
              TextField(
                controller: _priceController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(hintText: 'Price'),
              ),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Quantity'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addSaleOrder,
                child: const Text('Add Sale Order'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _saleOrders.length,
            itemBuilder: (BuildContext context, int index) {
              final SalesOrder saleOrder = _saleOrders[index];
              return ListTile(
                title: Text('${saleOrder.id} : ${saleOrder.customerName}'),
                subtitle: Text(
                    '${saleOrder.productName} - ${saleOrder.price} x ${saleOrder.quantity}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteSaleOrder(saleOrder.id ?? 0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
