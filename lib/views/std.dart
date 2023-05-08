import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  bool hideBody = false;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            "MY CUSTOM APPBAR",
          ),
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(
          child: Center(
            child: Column(
                children:
                [
                  Center(
                    child: hideBody ?
                    Text('SilverApp Bar Page', style: TextStyle(
                        fontSize:26
                    ),) : Text('hideBody is false'),
                  ),
                  ElevatedButton(
                      onPressed: ()=>{
                        hideBody = true
                      }, child: Text('Hide Text'))
                ]
            ),
          ),
        ),
      ],
    );

    /*return Column(
    children:
    [
      Center(
      child: hideBody ?
        Text('Items Page', style: TextStyle(
          fontSize:26
      ),) : Text('hideBody is false'),
      ),
      ElevatedButton(
          onPressed: ()=>{
            hideBody = true
      }, child: Text('Hide Text'))
    ]
    );*/
  }
}