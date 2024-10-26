import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savey_econers/model/product_model.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favourite = [];
  List<Product> get favourite => _favourite;

  void toggleFavorite(Product product) {
    if (_favourite.contains(product)) {
      _favourite.remove(product);
    } else {
      _favourite.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favourite.contains(product);
    return isExist;
  }

  static FavouriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavouriteProvider>(context, listen: listen);
  }
}
