import 'package:flutter/material.dart';

class FetchPage extends StatelessWidget {
  const FetchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('fetch from api'),
        ),
        body: Text('try fetch'));
  }
}
