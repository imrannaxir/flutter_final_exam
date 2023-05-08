import 'package:flutter/material.dart';

class CustomersPage extends StatelessWidget {
  @override
  Widget build(BuildContext _context) {
    return TextButton(
      child: Container(
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.all(6),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black12, width: 1)),
        child: Text(
          'TWO BUTTON DIALOG',
          style: TextStyle(fontSize: 20),
        ),
      ),
      onPressed: () => showDialog(
          context: _context,
          builder: (BuildContext buildContext) {
            return AlertDialog(
              title: Text(
                'Alert Dialog',
                style: TextStyle(),
              ),
              content: Text('Are you sure you want to delete this Item'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(buildContext),
                    child: Text('OK')),
                TextButton(
                    onPressed: () => Navigator.pop(buildContext),
                    child: Text('Cancel'))
              ],
            );
          }),
    );

    /*
    return Center(
        child: ListView(
          children: [
            SizedBox(height:20),
            Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)
              ),
              child: ListTile(
                title: Text('Huawei Honor 8x'),
                subtitle: Text('Honor 8X Android smartphone'),
                trailing: Text('PKR 19,999.00'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)
              ),
              child: ListTile(
                title: Text('Iphone 14 Max Pro'),
                subtitle: Text('IPhone iOS smartphone'),
                trailing: Text('PKR 23,999.00'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)
              ),
              child: ListTile(
                title: Text('Lenovo Yougyan'),
                subtitle: Text('Lenovo Yougya plus tab'),
                trailing: Text('PKR 49,999.00'),
              ),
            )
          ],
        )
    );*/
  }
}
