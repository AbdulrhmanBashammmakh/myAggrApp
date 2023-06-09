import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myaggr/Controllers/my_controller_check_internet_connection.dart';
import 'package:myaggr/UI/Constant/colors_constant.dart';
import 'package:myaggr/UI/Screen/dashboard_page.dart';
import 'package:myaggr/UI/Screen/list_view_page.dart';
import 'package:myaggr/UI/Screen/lists_products_page.dart';
import 'package:myaggr/UI/Screen/login_page.dart';
import 'package:myaggr/UI/Screen/my_home_page.dart';
import 'package:myaggr/UI/Screen/pass_data_example/First_Page.dart';
import 'package:myaggr/UI/Screen/pass_data_example/Second_Page.dart';
import 'package:myaggr/UI/Screen/register_page.dart';
import 'package:myaggr/UI/Widget/custom_button_expanded.dart';
import 'package:myaggr/UI/Widget/custom_text.dart';
import 'package:myaggr/UI/Widget/custom_text_field.dart';

import 'Radio_Buttons.dart';
import 'fetch_page_api.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('home page')),
          backgroundColor: Constants.textColorSecondary),
      body: Center(
        child: Container(
          color: Constants.primaryColor,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: CustomTextFormField(
                      onSave: (value) {},
                      validator: (value) {},
                      hint: "this is Search bar ...",
                      text: ""),
                ),
              ),
              Container(
                child: const CustomText(
                  text: "hello Every one ",
                  alignment: Alignment.center,
                  color: Constants.primaryColor2,
                  fontSize: 30,
                ),
              ),
              Center(
                child: Obx(() => Text(myController.internetStatus.value)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //    padding: EdgeInsets.all(2),
                      //  scrollDirection: Axis.vertical,
                      children: [
                        //    SizedBox(width: 20),
                        // Expanded(
                        //   child: Container(
                        //     margin: const EdgeInsets.all(8.0),
                        //     child: CustomButton(
                        //         text: '1111',
                        //         onPress: () {
                        //           Get.to(MyHomePage(
                        //             title: "asdf",
                        //           ));
                        //         },
                        //         color: Constants.secondaryColor),
                        //   ),
                        // ),
                        // //      SizedBox(width: 20),
                        // Expanded(
                        //   child: Container(
                        //     margin: const EdgeInsets.all(8.0),
                        //     child: CustomButton(
                        //         text: '2222',
                        //         onPress: () {
                        //           Get.to(LoginPage());
                        //         },
                        //         color: Constants.secondaryColor),
                        //   ),
                        // ),
                        // //    SizedBox(width: 20),
                        // Expanded(
                        //   child: Container(
                        //     margin: const EdgeInsets.all(8.0),
                        //     child: CustomButton(
                        //         text: '3333',
                        //         onPress: () {
                        //           Get.to(SignUpPage());
                        //         },
                        //         color: Constants.secondaryColor),
                        //   ),
                        //   //  SizedBox(width: 20),
                        // ),
                        // Expanded(
                        //   child: Container(
                        //     margin: const EdgeInsets.all(8.0),
                        //     child: CustomButton(
                        //         text: '4444',
                        //         onPress: () {
                        //           Get.to(DashboardPage());
                        //         },
                        //         color: Constants.secondaryColor),
                        //   ),
                        // ),
                        //SizedBox(width: 20),
                        CustomButtonExpanded(
                          onPress: () {
                            Get.to(DashboardPage());
                          },
                          padding: 8,
                          color: Constants.secondaryColor,
                          textname: 'Dashboard',
                        ),
                        CustomButtonExpanded(
                          onPress: () {
                            Get.to(LoginPage());
                          },
                          padding: 8,
                          color: Constants.secondaryColor,
                          textname: 'login',
                        ),
                        CustomButtonExpanded(
                          onPress: () {
                            Get.to(SignUpPage());
                          },
                          padding: 8,
                          color: Constants.secondaryColor,
                          textname: 'register',
                        ),
                        CustomButtonExpanded(
                          onPress: () {
                            Get.to(MyHomePage(
                              title: 'Home',
                            ));
                          },
                          padding: 8,
                          color: Constants.secondaryColor,
                          textname: 'Home',
                        ),

                        // SizedBox(width: 20)
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonExpanded(
                      onPress: () {
                        Get.to(ListAddProducts());
                      },
                      padding: 8,
                      color: Constants.secondaryColor,
                      textname: 'List Add Products',
                    ),
                    CustomButtonExpanded(
                      onPress: () {
                        Get.to(MyApp());
                      },
                      padding: 8,
                      color: Constants.secondaryColor,
                      textname: 'list view test',
                    ),
                    CustomButtonExpanded(
                      onPress: () {
                        Get.to(FetchPage());
                      },
                      padding: 8,
                      color: Constants.secondaryColor,
                      textname: "fetch",
                    )
                  ],
                ),
              ),
              Container(
                  child: Wrap(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    //flex: 1,
                    child: Container(
                      //  width: 200,
                      child: CustomButtonExpanded(
                        onPress: () {
                          Get.to(FirstPage());
                        },
                        padding: 8,
                        color: Constants.secondaryColor,
                        textname: 'FirstPage',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: 200,
                      child: CustomButtonExpanded(
                        onPress: () {
                          Get.to(SecondPage());
                        },
                        padding: 8,
                        color: Constants.secondaryColor,
                        textname: 'SecondPage',
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // direction: Axis.horizontal,
                children: [
                  Container(
                    width: 200,
                    child: CustomButtonExpanded(
                      onPress: () {},
                      padding: 8,
                      color: Constants.secondaryColor,
                      textname: '1010',
                    ),
                  ),
                  Container(
                    width: 200,
                    child: CustomButtonExpanded(
                      onPress: () {
                        Get.to(MyRadioButtons());
                      },
                      padding: 8,
                      color: Constants.secondaryColor,
                      textname: 'radio button',
                    ),
                  ),
                ],
              )),
              Center(
                child: Wrap(
                  // direction: Axis.vertical,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.black12,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.black12,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.black12,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.black12,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.black12,
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
