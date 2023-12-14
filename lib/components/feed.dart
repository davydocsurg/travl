import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travl/api/food.dart';
import 'package:travl/components/card.dart';
import 'package:travl/utils/c_button.dart';
import 'package:travl/components/avatar.dart';

List<Widget> buildFoodCnt() {
  List<MockApi> mockApi = MockApiService.fetchData();

  return [
    SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          PlainCard(
              title: "This is an Ad",
              subtitle:
                  "Help rescue unsold food and share it with the community."),
          SizedBox(height: 15),
          Column(
            children: List.generate(
              mockApi.length, // Generate 5 ImageCards
              (index) => ImageCard(
                imagePath: mockApi[index].imagePath,
                title: mockApi[index].title,
                widget1: CAvatar(
                  imageUrl: mockApi[index].imageUrl,
                  size: 35,
                  local: true,
                ),
                widget2: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      mockApi[index].name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54),
                    ),
                  ),
                ),
                widget3: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700]),
                    SizedBox(width: 5),
                    Text(
                      mockApi[index].rating,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                widget4: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black54,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      mockApi[index].distance,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                widget5: Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black54,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      mockApi[index].views,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                widget6: Text(
                  mockApi[index].time,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
                button: CButton(
                    text: 'Pick up',
                    fontSize: Platform.isIOS ? 13 : 11,
                    onPressed: () {
                      print('pickup');
                    },
                    width: double.infinity,
                    height: 35,
                    color: Colors.black,
                    bgColor: Colors.yellow[200]!),
              ),
            ),
          )
        ],
      ),
    )
  ];
}

List<Widget> buildiOSNonFood() {
  return [
    SizedBox(
      width: double.infinity,
      child: PlainCard(
          title: "This is an Ad",
          subtitle:
              "Help rescue unsold items and share it with the community."),
    )
  ];
}
