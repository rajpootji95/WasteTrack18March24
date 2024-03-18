import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_textfield.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class NylonGeneration extends StatefulWidget {
  const NylonGeneration({super.key});

  @override
  State<NylonGeneration> createState() => _NylonGenerationState();
}

class _NylonGenerationState extends State<NylonGeneration> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "50",
                                style: TextStyle(
                                    fontFamily: AppFont.poppinsBold,
                                    fontSize: 27,
                                    color: AppColor.green),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColor.greenMedium1),
                                  child: Center(
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: AppColor.green,
                                      size: 27,
                                    ),
                                  ))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "₦ 500",
                                  style: TextStyle(
                                      fontFamily: AppFont.poppinsBold,
                                      fontSize: 25,
                                      color: AppColor.green),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColor.greenMedium1),
                                  child: Center(
                                      child: Image.asset(
                                    AppImages.cash,
                                    height: 27,
                                  )))
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Current Nylon Price",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.greenLight
                                            .withOpacity(0.3)),
                                    child: CustomTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter quantity';
                                        }
                                        return null;
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
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.pop(context);
                                    // setState(() {

                                    // });
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
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.green),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "Generate",
                                  style: TextStyle(
                                      fontFamily: AppFont.poppinsSemiBold,
                                      fontSize: 13,
                                      color: AppColor.white),
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
                  child: Card(
                    elevation: 1,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 10),
                      child: Column(
                        children: [
                          Text(
                            "Set Nylon Roll Price",
                            style: TextStyle(
                                fontFamily: AppFont.poppinsMedium,
                                fontSize: 13,
                                color: AppColor.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            AppImages.doller,
                            height: 120,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Set Price",
                                style: TextStyle(
                                    fontFamily: AppFont.poppinsMedium,
                                    fontSize: 12,
                                    color: AppColor.grey1),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Flexible(
                                child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.greenLight
                                            .withOpacity(0.3)),
                                    child: CustomTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter price name';
                                        }
                                        return null;
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
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.pop(context);
                                    // setState(() {

                                    // });
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
                                            "Nylon Price Set Successfully",
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
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.green),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "set",
                                  style: TextStyle(
                                      fontFamily: AppFont.poppinsSemiBold,
                                      fontSize: 13,
                                      color: AppColor.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
