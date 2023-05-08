import 'package:flutter/material.dart';

import '../views/customers.dart';
import '../views/employeePage.dart';
import '../views/items.dart';
import '../views/orders.dart';
import '../views/shared-prefs.dart';

class applicationPages {
  /*final Widget view;
  final String title;
  final IconData icon;

  applicationPages({required this.view, required this.title, required this.icon});*/

  static final List<Map<String, dynamic>> _pages = [
  {'view': ItemsPage(), 'title': 'Items'},
  {'view': CustomersPage(), 'title': 'Customers'},
  {'view': SalesOrderPage(), 'title': 'Sales Orders'},
  {'view': EmployeePage(), 'title': 'Employee'},
  {'view': SharedPrefes(), 'title': 'Settings'},
  ];

  static List<Map<String, dynamic>> get pages => _pages;

}