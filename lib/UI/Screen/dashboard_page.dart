import 'package:flutter/material.dart';
import 'package:myaggr/UI/Constant/colors_constant.dart';
import 'package:myaggr/UI/Widget/custom_button_expanded.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard Page')),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomButtonExpanded(
                onPress: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 400,
                          child: Center(
                            child: ElevatedButton(
                              child: const Text("got it down"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      });
                },
                padding: 8,
                color: Constants.thirdColor2,
                textname: 'click to apper the bottom Nav',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
