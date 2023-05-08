import 'package:flutter/material.dart';
import 'package:flutter_final_exam/views/employeePage.dart';
import 'package:flutter_final_exam/views/shared-prefs.dart';
import 'cloud-messaging.dart';
import 'constant.dart';
import 'customers.dart';
import 'firestore-view.dart';
import 'items.dart';
import 'orders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const ItemsPage(),
    CustomersPage(),
    SalesOrderPage(),
    EmployeePage(),
    SharedPrefes(),
    FirestoreView(),
    CloudMessaging()
  ];

  int _selectedIndex = 0;
  String _appBarTitle = 'Items';
  void _onItemTapped(int index, String titleName) {
    setState(() {
      _selectedIndex = index;
      _appBarTitle = titleName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _appBarTitle,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(
                      'assets/images/logo.png',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'ThreeEM Technologies',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Items'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0, 'Items');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Customers'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1, 'Customers');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2, 'Orders');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Archive Orders'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3, 'Archive Orders');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Shared Preferences'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(4, 'Shared Preferences');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Firestore Db View'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(5, 'Firestore View');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Could Messaging'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(5, 'Could Messaging');
              },
            )
          ],
        ),
      ),
      //body:_pages[_selectedIndex],
      body: Center(
        child: _pages[_selectedIndex],
      ),
    );
  }
}
