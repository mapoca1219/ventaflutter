import 'package:venta_flutter/src/view/screen/component/favoritetab/favorite_scroll.dart';
import 'package:venta_flutter/src/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var productProvider = Provider.of<ProductViewModel>(context, listen: false);
    var productProvider = Provider.of<ProductViewModel>(context, listen: true);

    // Verificar si listProduct no es nulo antes de iterar sobre él
    if (productProvider.listProduct != null) {
      productProvider.listProduct!.forEach((element) {
        print(element.isLike);
      });
    } else {
      // Manejar el caso en que listProduct sea nulo
      print('listProduct es nulo');
    }

    return SafeArea(
      child: Container(
        child: FavoriteScroll(),
      ),
    );
  }
}
