import 'package:flutter/material.dart';
import 'package:savey_econers/model/product_model.dart';
import 'package:savey_econers/model/provider/favourite_provider.dart';
import 'package:savey_econers/res/colors.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.whiteColor,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.whiteColor,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.whiteColor,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            icon: Icon(
              provider.isExist(product)
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
