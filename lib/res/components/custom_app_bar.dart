import 'package:flutter/material.dart';
import 'package:savey_econers/res/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColor.kcontentColor,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {},
          icon: Image.asset(
            'assets/images/icon.png',
            height: 20,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColor.kcontentColor,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {},
          iconSize: 25,
          icon: const Icon(
            Icons.notifications_outlined,
          ),
        ),
      ],
    );
  }
}
