import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefes extends StatefulWidget {
  @override
  _sharedPrefesState createState() => _sharedPrefesState();
}

class _sharedPrefesState extends State<SharedPrefes> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? "";
    setState(() {
      _username = username;
    });
  }

  Future<void> _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Username: $_username'),
          TextField(
            onChanged: (value) => _saveUsername(value),
            decoration: InputDecoration(hintText: 'Enter username'),
          ),
        ],
      ),
    );
  }
}
