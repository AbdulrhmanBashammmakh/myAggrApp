import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myaggr/UI/Constant/colors_constant.dart';
import 'package:myaggr/UI/Screen/dashboard_page.dart';
import 'package:myaggr/UI/Screen/login_page.dart';
import 'package:myaggr/UI/Screen/my_home_page.dart';
import 'package:myaggr/UI/Screen/register_page.dart';
import 'package:myaggr/UI/Widget/custom_button.dart';
import 'package:myaggr/UI/Widget/custom_text.dart';
import 'package:myaggr/UI/Widget/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('home page')),
          backgroundColor: Constants.textColorSecondary),
      body: Center(
        child: Container(
          color: Constants.primaryColor,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        CustomButton(
                            text: '1 ',
                            onPress: () {
                              Get.to(MyHomePage(
                                title: "asdf",
                              ));
                            },
                            color: Constants.secondaryColor),
                        SizedBox(width: 20),
                        CustomButton(
                            text: '2',
                            onPress: () {
                              Get.to(LoginPage());
                            },
                            color: Constants.secondaryColor),
                        SizedBox(width: 20),
                        CustomButton(
                            text: '3',
                            onPress: () {
                              Get.to(SignUpPage());
                            },
                            color: Constants.secondaryColor),
                        SizedBox(width: 20),
                        CustomButton(
                            text: '4',
                            onPress: () {
                              Get.to(DashboardPage());
                            },
                            color: Constants.secondaryColor),
                        SizedBox(width: 20),
                        CustomButton(
                            text: '5',
                            onPress: () {
                              Get.to(LoginPage());
                            },
                            color: Constants.secondaryColor),
                        SizedBox(width: 20)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: const CustomText(
                  text: "hello Every one ",
                  alignment: Alignment.center,color: Constants.primaryColor2,fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(child: CustomTextFormField(onSave: (value){},validator: (value){},hint: "this is Search bar ...",text:"" ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
