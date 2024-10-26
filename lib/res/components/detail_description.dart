import 'package:flutter/material.dart';
import 'package:savey_econers/res/colors.dart';

class DetailDescription extends StatelessWidget {
  final String text;
  const DetailDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: AppColor.kprimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Description",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "Specification",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Reviews",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          text,
          style: const TextStyle(
            color: AppColor.greyColor,
          ),
        )
      ],
    );
  }
}
