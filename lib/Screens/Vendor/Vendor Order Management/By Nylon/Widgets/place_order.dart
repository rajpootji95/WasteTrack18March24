import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_track/Conrollers/Vendor/Order%20Management%20Controller/order_management_controller.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class NylonPlaceOrder extends StatefulWidget {
  const NylonPlaceOrder({super.key});

  @override
  State<NylonPlaceOrder> createState() => _NylonPlaceOrderState();
}

class _NylonPlaceOrderState extends State<NylonPlaceOrder> {
  bool isButtonSelected = false;
  final controller = Get.put(OrderManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 7),
                Text(
                  'Waste Track',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFont.poppinsBold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 1,
                margin: EdgeInsets.zero,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payment Details",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsBold, fontSize: 15)),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("₦37,900.00",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Revised Commissions (10%)",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("₦2,842.00",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                          Text("₦40,742.00",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                elevation: 1,
                margin: EdgeInsets.zero,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payment Method",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsBold, fontSize: 15)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          "Please select the preferred payment method to use on this order.",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 12)),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRadioButton(
                            label: 'Pay Now',
                            isSelected: isButtonSelected,
                            onChanged: (value) {
                              setState(() {
                                isButtonSelected = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.PayOnPickupVisibility();
                            },
                            child: CustomRadioButton(
                              label: 'Pay On Pickup',
                              isSelected: isButtonSelected,
                              onChanged: (value) {
                                setState(() {
                                  isButtonSelected = value;
                                  controller.PayOnPickupVisibility();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      !controller.isPayOnPickupVisible.value ? "" : "";
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, right: 40, left: 40, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: !controller.isPayOnPickupVisible.value
                              ? AppColor.green.withOpacity(0.3)
                              : AppColor.green),
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFont.poppinsSemiBold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
