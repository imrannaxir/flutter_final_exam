import 'package:flutter/material.dart';
import 'package:flutter_final_exam/core/employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeePage extends StatefulWidget {
  @override
  _employeePageState createState() => _employeePageState();
}

class _employeePageState extends State<EmployeePage> {
  String _responseText = "";
  List<Employee> _employeeList = [];
  List<Employee> _filteredList = [];
  TextEditingController _editingController = TextEditingController();
  Future<void> getEmployeeList() async {
    String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

    try {
      List<Employee> _list = [];
      final response = await http.get(Uri.parse(apiUrl));
      final responseData = json.decode(response.body);

      responseData.forEach((employee) {
        _list.add(Employee.fromJson(employee));
      });
      setState(() {
        _employeeList = _list;
        _filteredList = _list;
      });
    } catch (error) {
      print(error);
    }
  }

  void textBox_Change(String textValue) {
    setState(() {
      _filteredList = _employeeList
          .where((employee) =>
              employee.title.toLowerCase().contains(textValue.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _editingController,
              onChanged: (changed_value) {
                textBox_Change(changed_value);
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(_filteredList[index].title),
                    subtitle: Text(_filteredList[index].body),
                    shape: Border.all(color: Colors.red, width: 2));
              },
            ),
          ),
        ],
      ),
    );
  }
}
