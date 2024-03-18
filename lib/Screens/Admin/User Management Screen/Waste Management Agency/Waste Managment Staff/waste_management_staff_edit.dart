import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waste_track/Utils/App%20Size/app_size.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_button.dart';
import 'package:waste_track/Utils/Components/custom_textfield.dart';
import 'package:waste_track/Utils/Components/text_heading.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';
import 'package:waste_track/Utils/validation.dart';

class WasteManagementStaffEdit extends StatefulWidget {
  const WasteManagementStaffEdit({super.key});

  @override
  State<WasteManagementStaffEdit> createState() =>
      _WasteManagementStaffEditState();
}

class _WasteManagementStaffEditState extends State<WasteManagementStaffEdit> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
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
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Edit Waste Management Staff Details',
                style: TextStyle(
                    color: AppColor.green,
                    fontSize: 15,
                    fontFamily: AppFont.poppinsBold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Center(
                      child: Card(
                        elevation: 1,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        textHeading(text: 'First Name'),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextField(
                                      controller: firstNameController,
                                      hintText: "First Name",
                                      hintStyle: TextStyle(
                                          color: AppColor.lightGrey,
                                          fontSize: 13,
                                          fontFamily: AppFont.poppinsRegular),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter fist name';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        textHeading(text: 'Last Name'),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextField(
                                      controller: lastNameController,
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(
                                          color: AppColor.lightGrey,
                                          fontSize: 13,
                                          fontFamily: AppFont.poppinsRegular),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter last name';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        textHeading(text: 'Email'),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextField(
                                      validator: Validation.validateEmail,
                                      controller: emailController,
                                      hintText: "Enter Email ID",
                                      hintStyle: TextStyle(
                                          color: AppColor.lightGrey,
                                          fontSize: 13,
                                          fontFamily: AppFont.poppinsRegular),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        textHeading(text: 'Contact Number'),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextField(
                                      validator: Validation.validateMobile,
                                      hintText: "Enter Mobile Number",
                                      hintStyle: TextStyle(
                                          color: AppColor.lightGrey,
                                          fontSize: 13,
                                          fontFamily: AppFont.poppinsRegular),
                                      maxLength: 10,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r"\d"), // allow only numbers
                                        )
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: mobileController,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });

                            return CupertinoAlertDialog(
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
                                      " Changes Saved Successfully",
                                      style: TextStyle(
                                          fontSize: 15, color: AppColor.green),
                                    ),
                                  ),
                                ],
                              ), // show pop-up
                            );
                          },
                        );
                      },
                      width: AppSize.getWidth(context),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColor.green),
                      buttonText: "Save Changes",
                      textColor: AppColor.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
