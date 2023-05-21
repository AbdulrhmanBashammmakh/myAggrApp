import 'package:flutter/material.dart';

class AfterPage extends StatelessWidget {
  const AfterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('after Page')),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text('hello succssfully login '),
            ],
          ),
        ),
      ),
    );
  }
}
