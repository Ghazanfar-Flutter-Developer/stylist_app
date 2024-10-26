import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  final Function(int) onchange;
  final String image;
  const DetailImageSlider({
    super.key,
    required this.onchange,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        onPageChanged: onchange,
        itemBuilder: (context, index) {
          return Hero(
            tag: image,
            child: Image.asset(image),
          );
        },
      ),
    );
  }
}
