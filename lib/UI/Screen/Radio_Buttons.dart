import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';

class MyRadioButtons extends StatefulWidget {
  @override
  _MyRadioButtonsState createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('radio Page')),
    body: Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text('Option 1'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text('Option 2'),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // do something with the selected radio button value
              print('Selected radio value: $_radioValue');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    ),
    );

  }
}