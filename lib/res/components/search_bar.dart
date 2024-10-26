import 'package:flutter/material.dart';
import 'package:savey_econers/res/colors.dart';

class SearchBAR extends StatelessWidget {
  const SearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColor.greyColor,
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 18,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 20,
            width: 1,
            color: AppColor.greyColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: AppColor.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
