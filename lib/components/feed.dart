import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travl/api/food.dart';
import 'package:travl/api/items.dart';
import 'package:travl/components/card.dart';
import 'package:travl/utils/c_button.dart';
import 'package:travl/components/avatar.dart';

List<Widget> buildFoodCnt() {
  List<MockFoodApi> mockFoodApi = MockFoodApiService.fetchData();

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
              mockFoodApi.length, // Generate 5 ImageCards
              (index) => ImageCard(
                imagePath: mockFoodApi[index].imagePath,
                title: mockFoodApi[index].title,
                widget1: CAvatar(
                  imageUrl: mockFoodApi[index].imageUrl,
                  size: 35,
                  local: true,
                ),
                widget2: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      mockFoodApi[index].name,
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
                      mockFoodApi[index].rating,
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
                      mockFoodApi[index].distance,
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
                      mockFoodApi[index].views,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                widget6: Text(
                  mockFoodApi[index].time,
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
  List<Item> mockItemApi = ItemService.fetchData();

  return [
    SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          PlainCard(
              title: "This is an Ad",
              subtitle:
                  "Help rescue unsold items and share it with the community."),
          SizedBox(height: 15),
          Column(
            children: List.generate(
              mockItemApi.length, // Generate 5 ImageCards
              (index) => ImageCard(
                imagePath: mockItemApi[index].imagePath,
                title: mockItemApi[index].title,
                widget1: CAvatar(
                  imageUrl: mockItemApi[index].imageUrl,
                  size: 35,
                  local: true,
                ),
                widget2: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      mockItemApi[index].name,
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
                      mockItemApi[index].rating,
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
                      mockItemApi[index].distance,
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
                      mockItemApi[index].views,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                widget6: Text(
                  mockItemApi[index].time,
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
