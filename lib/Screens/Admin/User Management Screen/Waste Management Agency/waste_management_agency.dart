import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waste_track/App%20Routes/app_routes.dart';
import 'package:waste_track/Conrollers/Admin/User%20Management%20Controller/user_management_controller.dart';
import 'package:waste_track/Utils/App%20Size/app_size.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_button.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/Components/custom_sanckbar.dart';
import 'package:waste_track/Utils/Components/custom_textfield.dart';
import 'package:waste_track/Utils/Components/text_heading.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';
import 'package:waste_track/Utils/validation.dart';

import '../../../../Conrollers/Admin/User Management Controller/waste_angency_controller.dart';

class WasteManagementAgency extends StatefulWidget {
  const WasteManagementAgency({super.key});

  @override
  State<WasteManagementAgency> createState() => _WasteManagementAgencyState();
}

class _WasteManagementAgencyState extends State<WasteManagementAgency> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var companyNameController = TextEditingController();
  var companyAddressController = TextEditingController();
  var websiteController = TextEditingController();
  var passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isButtonSelected = false;
  final wasteManagementVisibilityController =
      Get.put(WasteManagementController());

  bool _isObscure = true;
  ImagePicker picker = ImagePicker();

  File? _image;
  XFile? imagefile;

  opengallery() async {
    var cameraStatus = await Permission.camera.status;
    var storageStatus = await Permission.storage.status;

    PermissionStatus? cameraShowAlert;
    PermissionStatus? storageShowAlert;

    if (!cameraStatus.isGranted) {
      cameraShowAlert = await Permission.camera.request();
    }

    if (!storageStatus.isGranted) {
      storageShowAlert = await Permission.storage.request();
    }

    if (await Permission.camera.isGranted) {
      if (await Permission.storage.isGranted) {
        imagefile = await picker.pickImage(
            source: ImageSource.gallery, imageQuality: 20);
        if (imagefile != null) {
          setState(() {
            _image = File(imagefile!.path);
          });

          // if (mounted) {
          //   showToast('Profile photo upadted successfully!...');
          // }
        }
      } else {
        print("Camera needs to access your storage, please provide permission");
      }
    } else {
      if (cameraShowAlert == PermissionStatus.permanentlyDenied ||
          storageShowAlert == PermissionStatus.permanentlyDenied) {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Requires Camera Permission'),
                content: const Text(
                    'This application requires access to your camera and storage'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Allow'),
                    onPressed: () async {
                      await openAppSettings();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      } else {
        print("Camera access denied!.. $cameraStatus and $storageStatus");
      }
    }
  }

  opencamera() async {
    var cameraStatus = await Permission.camera.status;
    var storageStatus = await Permission.storage.status;

    PermissionStatus? cameraShowAlert;
    PermissionStatus? storageShowAlert;

    if (!cameraStatus.isGranted) {
      cameraShowAlert = await Permission.camera.request();
    }

    if (!storageStatus.isGranted) {
      storageShowAlert = await Permission.storage.request();
    }

    if (await Permission.camera.isGranted) {
      if (await Permission.storage.isGranted) {
        imagefile = await picker.pickImage(
            source: ImageSource.camera, imageQuality: 20);
        if (imagefile != null) {
          setState(() {
            _image = File(imagefile!.path);
          });

          //if (mounted) showToast("Profile photo upadted successfully!...");
        }
      } else {
        print("Camera needs to access your storage, please provide permission");
      }
    } else {
      if (cameraShowAlert == PermissionStatus.permanentlyDenied ||
          storageShowAlert == PermissionStatus.permanentlyDenied) {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Requires Camera Permission'),
                content: const Text(
                    'This application requires access to your camera and storage'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Allow'),
                    onPressed: () async {
                      await openAppSettings();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      } else {
        print("Provide Camera permission to use camera.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
   /* return Obx(
      () {
        return
          Container(
          height: MediaQuery.of(context).size.height * 0.68,
          padding: EdgeInsets.only(top: 5, left: 15, right: 15),
          child: Column(
            children: [
              Visibility(
                visible: wasteManagementVisibilityController
                    .isAddStaffVisible.isFalse,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5, left: 7),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomSearchTextField(
                          hintText: 'Search  here...',
                          hintStyle: TextStyle(
                              fontSize: 12,
                              color: AppColor.grey1.withOpacity(0.5)),
                          suffixIcon: Icon(
                            Icons.search,
                            color: AppColor.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            backgroundColor: Colors.white,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImages.union,
                                                    height: 15,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    "Filter By",
                                                    style: TextStyle(
                                                        fontFamily: AppFont
                                                            .poppinsSemiBold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Name'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  CustomRadioButton(
                                                    isSelected:
                                                        isButtonSelected,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isButtonSelected =
                                                            value;
                                                      });
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black
                                                  .withOpacity(0.59),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Email'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  CustomRadioButton(
                                                    isSelected:
                                                        isButtonSelected,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isButtonSelected =
                                                            value;
                                                      });
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black
                                                  .withOpacity(0.59),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Date Added'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  CustomRadioButton(
                                                    isSelected:
                                                        isButtonSelected,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isButtonSelected =
                                                            value;
                                                      });
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ])
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColor.green),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: AppColor.green,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 1,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        Row(
                          children: [
                            Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              padding: const EdgeInsets.all(2),
                              clipBehavior: Clip.hardEdge,
                              height: 70,
                              width: 70,
                              child: _image != null
                                  ? Image.file(
                                      _image!,
                                      // File(image?.path),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(AppImages.profileImg,
                                      // image:
                                      //     "http://192.168.0.73/e-commerce/storage/app/public/" +
                                      //         data.profile.toString(),
                                      fit: BoxFit.cover),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Waste Management Agency",
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 13,
                                  fontFamily: AppFont.poppinsBold),
                            )
                          ],
                        ),
                        Positioned(
                          left: 45,
                          top: 45,
                          child: GestureDetector(
                            onTap: () {
                              showBottomSheet(
                                backgroundColor: AppColor.white,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 5),
                                            child: Text(
                                              "Change  Profile",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.black),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.photo_album_rounded,
                                              ),
                                              color: AppColor.green,
                                              iconSize: 30,
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                opengallery();
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                  Icons.camera_alt_rounded),
                                              color: AppColor.green,
                                              iconSize: 30,
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                opencamera();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColor.green),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 11,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            color: AppColor.green,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            " Lorem Ipsum",
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 13,
                                fontFamily: AppFont.poppinsMedium),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.email_outlined, color: AppColor.green),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            " wastmanagement@gmail.com",
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 13,
                                fontFamily: AppFont.poppinsMedium),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  AppScreen.WasteManagementDetailsScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 7, bottom: 7, right: 12, left: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColor.darkBlue.withOpacity(0.1)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 20,
                                    color: AppColor.darkBlue,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "VIEW",
                                    style: TextStyle(
                                        color: AppColor.darkBlue,
                                        fontSize: 12,
                                        fontFamily: AppFont.poppinsSemiBold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppScreen.WasteManagementEditScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 7, bottom: 7, right: 12, left: 14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColor.orange.withOpacity(0.1)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit_outlined,
                                    size: 20,
                                    color: AppColor.orange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "EDIT",
                                    style: TextStyle(
                                        color: AppColor.orange,
                                        fontSize: 13,
                                        fontFamily: AppFont.poppinsSemiBold),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    title: Column(
                                      children: [
                                        Text(
                                          "Are you sure you want to Delete this User?",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColor.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(9),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: AppColor.green,
                                                ),
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          AppFont.poppinsLight,
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    Future.delayed(
                                                        Duration(seconds: 1),
                                                        () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    });

                                                    return CupertinoAlertDialog(
                                                      title: Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: AppColor
                                                                  .green,
                                                            ),
                                                            child: Icon(
                                                              Icons.done,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              " User Deleted Successfully",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: AppColor
                                                                      .green),
                                                            ),
                                                          ),
                                                        ],
                                                      ), // show pop-up
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    bottom: 10,
                                                    top: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: AppColor.green,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'yes',
                                                    style: TextStyle(
                                                        fontFamily: AppFont
                                                            .poppinsLight,
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ), // show pop-up
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 7, bottom: 7, right: 12, left: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.red.withOpacity(0.1)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_outline_outlined,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "DELETE",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontFamily: AppFont.poppinsSemiBold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: wasteManagementVisibilityController
                    .isAddStaffVisible.isFalse,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '    Waste Management Staff Details',
                    style: TextStyle(
                        color: AppColor.green,
                        fontFamily: AppFont.poppinsBold,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Visibility(
                visible: wasteManagementVisibilityController
                    .isAddStaffVisible.isTrue,
                child: Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, right: 10, left: 10, bottom: 10),
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView(
                        children: [
                          Center(
                            child: Card(
                              elevation: 1,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              clipBehavior: Clip.hardEdge,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Form(
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
                                      Row(
                                        children: [
                                          textHeading(
                                              text: 'Temporary Password'),
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
                                      StatefulBuilder(
                                          builder: (context, setTextField) {
                                        return CustomTextField(
                                          obscureText: _isObscure,
                                          fillColor: AppColor.white,
                                          hintText:
                                              "Enter 8 characters or more",
                                          hintStyle: TextStyle(
                                              color: AppColor.lightGrey,
                                              fontSize: 13,
                                              fontFamily:
                                                  AppFont.poppinsRegular),
                                          validator: Validation.validatePass,
                                          controller: passwordController,
                                          suffixIcon: IconButton(
                                              icon: Icon(
                                                  _isObscure
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: AppColor.black,
                                                  size: 14),
                                              onPressed: () {
                                                setTextField(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              }),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            // isLoading: authController.buttonLoader.value,
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.pop(context);
                                    setState(() {
                                      wasteManagementVisibilityController
                                          .AddStaffVisibility();
                                    });
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
                                        Flexible(
                                          child: Text(
                                            " Changes Saved Successfully",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColor.green),
                                          ),
                                        ),
                                      ],
                                    ), // show pop-up
                                  );
                                },
                              );
                            },
                            width: AppSize.getWidth(context),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.green),
                            buttonText: "Add Staff",
                            textColor: AppColor.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: wasteManagementVisibilityController
                    .isAddStaffVisible.isFalse,
                child: Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        print('index=>${index}');
                        return Obx(
                          () {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Card(
                                    elevation: 1,
                                    margin: EdgeInsets.zero,
                                    shape: ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    clipBehavior: Clip.hardEdge,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: const Text(
                                                  "Name",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: const Text(
                                                  " Sub-Admin Name",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: AppColor.black,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: const Text(
                                                  "Email",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: const Text(
                                                  "subAdmin@gmail.com",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: AppColor.black,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: const Text(
                                                  "Contact Number",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: const Text(
                                                  "+234 09-234-4000",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: AppColor.black,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: const Text(
                                                  "Date Added",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: const Text(
                                                  "10 oct 2023",
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          AppFont.poppinsLight),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 270,
                                  top: -8,
                                  child: GestureDetector(
                                    onTap: () {
                                      wasteManagementVisibilityController
                                          .toggleVisibility(index);
                                    },
                                    child: Image.asset(
                                      AppImages.opestion,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 173,
                                  top: -8,
                                  child: Visibility(
                                    visible: wasteManagementVisibilityController
                                        .areOptionVisibleList[index],
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context,
                                            AppScreen
                                                .WasteManagementStaffDetailsScreen);
                                      },
                                      child: Container(
                                        child: Image.asset(
                                          AppImages.eye,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 205,
                                  top: -8,
                                  child: Visibility(
                                    visible: wasteManagementVisibilityController
                                        .areOptionVisibleList[index],
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context,
                                            AppScreen
                                                .WasteManagementStaffEditScreen);
                                      },
                                      child: Container(
                                        child: Image.asset(
                                          AppImages.edit,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 237,
                                  top: -8,
                                  child: Visibility(
                                    visible: wasteManagementVisibilityController
                                        .areOptionVisibleList[index],
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CupertinoAlertDialog(
                                              title: Column(
                                                children: [
                                                  Text(
                                                    "Are you sure you want to Delete this User?",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: AppColor.black),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(9),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color:
                                                                AppColor.green,
                                                          ),
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontFamily: AppFont
                                                                    .poppinsLight,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              Future.delayed(
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                                // setState(() {
                                                                //   isEditVisible = true;
                                                                //   isVisible = false;
                                                                // });
                                                              });

                                                              return CupertinoAlertDialog(
                                                                title: Row(
                                                                  children: [
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        color: AppColor
                                                                            .green,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .done,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        " User Deleted Successfully",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                AppColor.green),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ), // show pop-up
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  bottom: 10,
                                                                  top: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color:
                                                                AppColor.green,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'yes',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      AppFont
                                                                          .poppinsLight,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ), // show pop-up
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        child: Image.asset(
                                          AppImages.delete,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );*/

    return GetBuilder(
      init: WasteManagementAgencyController(context: context),
        builder: (controller)=>
        Obx(
              () {
            return
              Container(
                height: MediaQuery.of(context).size.height * 0.68,
                padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                child: Column(
                  children: [
                    Visibility(
                      visible: wasteManagementVisibilityController
                          .isAddStaffVisible.isFalse,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, left: 7),
                        child: Row(
                          children: [
                            Flexible(
                              child: CustomSearchTextField(
                                hintText: 'Search  here...',
                                hintStyle: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.grey1.withOpacity(0.5)),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: AppColor.green,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return Wrap(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(20.0),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppImages.union,
                                                          height: 15,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Text(
                                                          "Filter By",
                                                          style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .poppinsSemiBold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 10,
                                                        bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text('Name'),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        CustomRadioButton(
                                                          isSelected:
                                                          isButtonSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              isButtonSelected =
                                                                  value;
                                                            });
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black
                                                        .withOpacity(0.59),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 10,
                                                        bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text('Email'),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        CustomRadioButton(
                                                          isSelected:
                                                          isButtonSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              isButtonSelected =
                                                                  value;
                                                            });
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black
                                                        .withOpacity(0.59),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 10,
                                                        bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text('Date Added'),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        CustomRadioButton(
                                                          isSelected:
                                                          isButtonSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              isButtonSelected =
                                                                  value;
                                                            });
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ])
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColor.green),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Icon(
                                    Icons.filter_alt_outlined,
                                    color: AppColor.green,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 1,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(clipBehavior: Clip.none, children: [
                              Row(
                                children: [
                                  Container(
                                    decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                    padding: const EdgeInsets.all(2),
                                    clipBehavior: Clip.hardEdge,
                                    height: 70,
                                    width: 70,
                                    child: _image != null
                                        ? Image.file(
                                      _image!,
                                      // File(image?.path),
                                      fit: BoxFit.cover,
                                    )
                                        : Image.asset(AppImages.profileImg,
                                        // image:
                                        //     "http://192.168.0.73/e-commerce/storage/app/public/" +
                                        //         data.profile.toString(),
                                        fit: BoxFit.cover),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                   Text(
                                    "bffhfg",
                                    style: TextStyle(
                                        color: AppColor.black,
                                        fontSize: 13,
                                        fontFamily: AppFont.poppinsBold),
                                  )
                                ],
                              ),
                              Positioned(
                                left: 45,
                                top: 45,
                                child: GestureDetector(
                                  onTap: () {
                                    showBottomSheet(
                                      backgroundColor: AppColor.white,
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              const Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 0, 5),
                                                  child: Text(
                                                    "Change  Profile",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppColor.black),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.photo_album_rounded,
                                                    ),
                                                    color: AppColor.green,
                                                    iconSize: 30,
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                      opengallery();
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                        Icons.camera_alt_rounded),
                                                    color: AppColor.green,
                                                    iconSize: 30,
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                      opencamera();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.white, width: 3),
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColor.green),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 11,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: AppColor.green,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  " Lorem Ipsum",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsMedium),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.email_outlined, color: AppColor.green),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  " wastmanagement@gmail.com",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsMedium),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        AppScreen.WasteManagementDetailsScreen);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 7, bottom: 7, right: 12, left: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppColor.darkBlue.withOpacity(0.1)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye,
                                          size: 20,
                                          color: AppColor.darkBlue,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          "VIEW",
                                          style: TextStyle(
                                              color: AppColor.darkBlue,
                                              fontSize: 12,
                                              fontFamily: AppFont.poppinsSemiBold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppScreen.WasteManagementEditScreen);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 7, bottom: 7, right: 12, left: 14),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppColor.orange.withOpacity(0.1)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.edit_outlined,
                                          size: 20,
                                          color: AppColor.orange,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "EDIT",
                                          style: TextStyle(
                                              color: AppColor.orange,
                                              fontSize: 13,
                                              fontFamily: AppFont.poppinsSemiBold),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoAlertDialog(
                                          title: Column(
                                            children: [
                                              Text(
                                                "Are you sure you want to Delete this User?",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColor.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(9),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(7),
                                                        color: AppColor.green,
                                                      ),
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            AppFont.poppinsLight,
                                                            fontSize: 15,
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext context) {
                                                          Future.delayed(
                                                              Duration(seconds: 1),
                                                                  () {
                                                                Navigator.pop(context);
                                                                Navigator.pop(context);
                                                              });

                                                          return CupertinoAlertDialog(
                                                            title: Row(
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                  EdgeInsets.all(
                                                                      10),
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        30),
                                                                    color: AppColor
                                                                        .green,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.done,
                                                                    color:
                                                                    Colors.white,
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    " User Deleted Successfully",
                                                                    style: TextStyle(
                                                                        fontSize: 15,
                                                                        color: AppColor
                                                                            .green),
                                                                  ),
                                                                ),
                                                              ],
                                                            ), // show pop-up
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20,
                                                          right: 20,
                                                          bottom: 10,
                                                          top: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(7),
                                                        color: AppColor.green,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'yes',
                                                          style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .poppinsLight,
                                                              fontSize: 15,
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ), // show pop-up
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 7, bottom: 7, right: 12, left: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.red.withOpacity(0.1)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete_outline_outlined,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          "DELETE",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                              fontFamily: AppFont.poppinsSemiBold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: wasteManagementVisibilityController
                          .isAddStaffVisible.isFalse,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '    Waste Management Staff Details',
                          style: TextStyle(
                              color: AppColor.green,
                              fontFamily: AppFont.poppinsBold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Visibility(
                      visible: wasteManagementVisibilityController
                          .isAddStaffVisible.isTrue,
                      child: Flexible(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10, right: 10, left: 10, bottom: 10),
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: ListView(
                              children: [
                                Center(
                                  child: Card(
                                    elevation: 1,
                                    shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    clipBehavior: Clip.hardEdge,
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Form(
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
                                             keyboardType: TextInputType.emailAddress,
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
                                            Row(
                                              children: [
                                                textHeading(
                                                    text: 'Temporary Password'),
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
                                            StatefulBuilder(
                                                builder: (context, setTextField) {
                                                  return CustomTextField(
                                                    obscureText: _isObscure,
                                                    fillColor: AppColor.white,
                                                    hintText:
                                                    "Enter 8 characters or more",
                                                    hintStyle: TextStyle(
                                                        color: AppColor.lightGrey,
                                                        fontSize: 13,
                                                        fontFamily:
                                                        AppFont.poppinsRegular),
                                                    validator: Validation.validatePass,
                                                    controller: passwordController,
                                                    suffixIcon: IconButton(
                                                        icon: Icon(
                                                            _isObscure
                                                                ? Icons.visibility_off
                                                                : Icons.visibility,
                                                            color: AppColor.black,
                                                            size: 14),
                                                        onPressed: () {
                                                          setTextField(() {
                                                            _isObscure = !_isObscure;
                                                          });
                                                        }),
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  isLoading: controller.isLoading,
                                  onPressed: () async {
                                    if(formKey.currentState!.validate()) {
                                      controller.addWasteAgencyApi(
                                          emailController.text,
                                          passwordController.text,
                                          firstNameController.text,
                                          lastNameController.text,
                                          mobileController.text, context);
                                    }else{
                                      CustomSnackBar.mySnackBar(context, "All field are required");
                                    }

                                  },
                                  width: AppSize.getWidth(context),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      AppColor.green),
                                  buttonText: "Add Staff",
                                  textColor: AppColor.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: wasteManagementVisibilityController
                          .isAddStaffVisible.isFalse,
                      child: Expanded(
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              print('index=>${index}');
                              return Obx(
                                    () {
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        margin: const EdgeInsets.only(bottom: 5),
                                        child: Card(
                                          elevation: 1,
                                          margin: EdgeInsets.zero,
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          clipBehavior: Clip.hardEdge,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Name",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        " Sub-Admin Name",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  color: AppColor.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Email",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "subAdmin@gmail.com",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  color: AppColor.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Contact Number",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "+234 09-234-4000",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  color: AppColor.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Date Added",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "10 oct 2023",
                                                        style: TextStyle(
                                                            color: AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily:
                                                            AppFont.poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 270,
                                        top: -8,
                                        child: GestureDetector(
                                          onTap: () {
                                            wasteManagementVisibilityController
                                                .toggleVisibility(index);
                                          },
                                          child: Image.asset(
                                            AppImages.opestion,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 173,
                                        top: -8,
                                        child: Visibility(
                                          visible: wasteManagementVisibilityController
                                              .areOptionVisibleList[index],
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppScreen
                                                      .WasteManagementStaffDetailsScreen);
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                AppImages.eye,
                                                height: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 205,
                                        top: -8,
                                        child: Visibility(
                                          visible: wasteManagementVisibilityController
                                              .areOptionVisibleList[index],
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppScreen
                                                      .WasteManagementStaffEditScreen);
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                AppImages.edit,
                                                height: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 237,
                                        top: -8,
                                        child: Visibility(
                                          visible: wasteManagementVisibilityController
                                              .areOptionVisibleList[index],
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return CupertinoAlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Text(
                                                          "Are you sure you want to Delete this User?",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: AppColor.black),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                padding:
                                                                EdgeInsets.all(9),
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      7),
                                                                  color:
                                                                  AppColor.green,
                                                                ),
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      fontFamily: AppFont
                                                                          .poppinsLight,
                                                                      fontSize: 15,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                showDialog(
                                                                  context: context,
                                                                  builder:
                                                                      (BuildContext
                                                                  context) {
                                                                    Future.delayed(
                                                                        Duration(
                                                                            seconds:
                                                                            1),
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          Navigator.pop(
                                                                              context);
                                                                          // setState(() {
                                                                          //   isEditVisible = true;
                                                                          //   isVisible = false;
                                                                          // });
                                                                        });

                                                                    return CupertinoAlertDialog(
                                                                      title: Row(
                                                                        children: [
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(
                                                                                10),
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              borderRadius:
                                                                              BorderRadius.circular(30),
                                                                              color: AppColor
                                                                                  .green,
                                                                            ),
                                                                            child:
                                                                            Icon(
                                                                              Icons
                                                                                  .done,
                                                                              color: Colors
                                                                                  .white,
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                            Text(
                                                                              " User Deleted Successfully",
                                                                              style: TextStyle(
                                                                                  fontSize:
                                                                                  15,
                                                                                  color:
                                                                                  AppColor.green),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ), // show pop-up
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20,
                                                                    bottom: 10,
                                                                    top: 10),
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      7),
                                                                  color:
                                                                  AppColor.green,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    'yes',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                        AppFont
                                                                            .poppinsLight,
                                                                        fontSize: 15,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ), // show pop-up
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                AppImages.delete,
                                                height: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
          },
        )
    );
  }
}
