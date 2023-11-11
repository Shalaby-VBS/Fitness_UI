import 'package:flutter/material.dart';

class SingleNavBarButton {
  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  AnimationController? animationController;

  SingleNavBarButton({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  static List<SingleNavBarButton> navBarButtonsList = <SingleNavBarButton>[
    SingleNavBarButton(
      imagePath: 'assets/images/tab_1.png',
      selectedImagePath: 'assets/images/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    SingleNavBarButton(
      imagePath: 'assets/images/tab_2.png',
      selectedImagePath: 'assets/images/tab_2s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    SingleNavBarButton(
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    SingleNavBarButton(
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
