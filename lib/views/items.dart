import 'package:flutter/material.dart';


class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  _itemsPageState createState() => _itemsPageState();
}

class _itemsPageState extends State<ItemsPage> {

  bool hideBody = false;
  String _buttonText = 'Show ProgressBar';
  @override
  Widget build(BuildContext context) {

    void hideProgress()
    {
      setState(() {
          hideBody = !hideBody;
          _buttonText = hideBody ? '' : '';
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children:
    [
      Visibility(
        visible: hideBody,
          child: Text("Default Widget"),
        replacement: CircularProgressIndicator(),
      ),
      ElevatedButton(
          onPressed: ()=> hideProgress(), child: hideBody ? Text('show progress') : Text('hide Progress') )
    ]
    );
  }
}