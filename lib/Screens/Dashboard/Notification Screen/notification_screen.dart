import 'package:flutter/material.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Notifications",
          style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontFamily: AppFont.poppinsBold),
        ),
        Flexible(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.lightPink.withOpacity(0.4)),
                        child: const Text(
                          "S A",
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 15,
                              fontFamily: AppFont.poppinsBold),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  " Nylon Bag Purchase Request",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 12,
                                      fontFamily: AppFont.poppinsSemiBold),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                const Text(
                                  " 15 mins ago",
                                  style: TextStyle(
                                      color: AppColor.grey1,
                                      fontSize: 9,
                                      fontFamily: AppFont.poppinsSemiBold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            const Text(
                              " Lorem ipsum dolor sit amet. Nam ducimus repellendus At voluptatem....",
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 11,
                                  fontFamily: AppFont.poppinsMedium),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
