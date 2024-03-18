import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_track/App%20Routes/app_routes.dart';
import 'package:waste_track/Conrollers/Vendor/Order%20Management%20Controller/order_management_controller.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_textfield.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class OrderByNylon extends StatefulWidget {
  const OrderByNylon({super.key});

  @override
  State<OrderByNylon> createState() => _OrderByNylonState();
}

class _OrderByNylonState extends State<OrderByNylon> {
  final controller = Get.put(OrderManagementController());

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Obx(
          () {
            return Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Card(
                          elevation: 1,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "50",
                                      style: TextStyle(
                                          fontFamily: AppFont.poppinsBold,
                                          fontSize: 27,
                                          color: AppColor.green),
                                    ),
                                    Image.asset(
                                      AppImages.shoping,
                                      height: 45,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Nylon Rolls Available",
                                  style: TextStyle(
                                      fontFamily: AppFont.poppinsMedium,
                                      fontSize: 13,
                                      color: AppColor.grey1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(''),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Card(
                          elevation: 1,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Generate Nylon Rolls",
                                  style: TextStyle(
                                      fontFamily: AppFont.poppinsMedium,
                                      fontSize: 13,
                                      color: AppColor.black),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Image.asset(
                                  AppImages.bag,
                                  height: 120,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "₦ 379.00",
                                  style: TextStyle(
                                      fontFamily: AppFont.poppinsSemiBold,
                                      fontSize: 13,
                                      color: AppColor.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Enter Quantity",
                                      style: TextStyle(
                                          fontFamily: AppFont.poppinsMedium,
                                          fontSize: 12,
                                          color: AppColor.grey1),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Flexible(
                                      child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AppColor.greenLight
                                                  .withOpacity(0.3)),
                                          child: CustomTextField(
                                            onTap: () {
                                              controller.ButtonVisibility();
                                            },
                                          )),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          Navigator.pop(context);
                                        });

                                        return CupertinoAlertDialog(
                                          title: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: AppColor.green,
                                                ),
                                                child: Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "Nylon Generated Successfully",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: AppColor.green),
                                                ),
                                              ),
                                            ],
                                          ), // show pop-up
                                        );
                                      },
                                    );
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      !controller.isButtonEnabled.value
                                          ? ""
                                          : Navigator.pushNamed(context,
                                              AppScreen.byNylonDetailsScreen);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: !controller
                                                  .isButtonEnabled.value
                                              ? AppColor.green.withOpacity(0.3)
                                              : AppColor.green),
                                      padding: EdgeInsets.all(10),
                                      child: Center(
                                        child: Text(
                                          "By Nylon",
                                          style: TextStyle(
                                              fontFamily:
                                                  AppFont.poppinsSemiBold,
                                              fontSize: 13,
                                              color: AppColor.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(''),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
