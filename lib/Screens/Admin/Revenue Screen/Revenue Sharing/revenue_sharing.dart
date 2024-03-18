import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_track/Utils/App%20Size/app_size.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';

import '../../../../Conrollers/Admin/Revenue Controller/revenue_controller.dart';

class RevenueSharing extends StatefulWidget {
  const RevenueSharing({super.key});

  @override
  State<RevenueSharing> createState() => _RevenueSharingState();
}

class _RevenueSharingState extends State<RevenueSharing> {
  final controller = Get.put(RevenueSharingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 20, right: 20),
      child: Obx(() {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Revenue Share',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppFont.poppinsBold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: controller.isPercentageVisible.value
                          ? AppColor.grey.withOpacity(0.3)
                          : AppColor.greenMedium1.withOpacity(0.4),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.togglePercentageVisibility();
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        color: controller.isPercentageVisible.value
                            ? AppColor.green.withOpacity(0.3)
                            : AppColor.green,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                      ),
                      child: Text(
                        'State Government Agency',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFont.poppinsMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: controller.isPercentageVisible.value,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.green),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 17,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isPercentageValueVisible.value,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.green),
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        '${"20"}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.poppinsBold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        'Nylon Production Company',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFont.poppinsMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: controller.isPercentageVisible.value,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.green),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 17,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isPercentageValueVisible.value,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.green),
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        '${"20"}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.poppinsBold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        'Environmental Consultants',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFont.poppinsMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: controller.isPercentageVisible.value,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.green),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 17,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isPercentageValueVisible.value,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.green),
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        '${"20"}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.poppinsBold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        'Waste management Agency',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFont.poppinsMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: controller.isPercentageVisible.value,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.green),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 17,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isPercentageValueVisible.value,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.green),
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        '${"20"}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.poppinsBold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        'Vendor Purchase',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFont.poppinsMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: controller.isPercentageVisible.value,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.green),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 17,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isPercentageValueVisible.value,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.green),
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        '${"20"}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.poppinsBold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        'Vendor Pickup',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFont.poppinsMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: controller.isPercentageVisible.value,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.green),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 17,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isPercentageValueVisible.value,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.green),
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        '${"20"}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.poppinsBold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        'Enforcement Team',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFont.poppinsMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: controller.isPercentageVisible.value,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.green),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 17,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isPercentageValueVisible.value,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.green),
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Text(
                        '${"20"}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.poppinsBold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: () async {
                  if (controller.isButtonEnabled.value) {
                    controller.isPercentageVisible.value = false;
                    Get.dialog(
                      CupertinoAlertDialog(
                        title: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColor.green,
                              ),
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                " Revenue Shared Updates",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    Future.delayed(Duration(seconds: 1), () {
                      Get.back();
                      controller.isPercentageValueVisible.value = true;
                    });
                  }
                },
                width: AppSize.getWidth(context),
                backgroundColor: !controller.isButtonEnabled.value
                    ? MaterialStateProperty.all<Color>(
                        AppColor.green.withOpacity(0.2))
                    : MaterialStateProperty.all<Color>(AppColor.green),
                buttonText: "Save Changes",
                textColor: AppColor.white,
              )
            ],
          ),
        );
      }),
    );
  }
}
