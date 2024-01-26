import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venta_flutter/src/data/service/product_service.dart';
import 'package:venta_flutter/src/viewmodel/product_viewmodel.dart';

class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductViewModel(ProductService('https://krika.vtexcommercestable.com.br')),
      child: Consumer<ProductViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Product Catalog'),
            ),
            body: model.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : model.error != null
                    ? Center(
                        child: Text('Error: ${model.error}'),
                      )
                    : model.products.isEmpty
                        ? Center(
                            child: Text('No products available.'),
                          )
                        : ListView.builder(
                            itemCount: model.products.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(model.products[index]['ProductName']),
                                onTap: () {
                                  model.fetchProductDetails(model.products[index]['ProductId']);
                                  // Navigate to product details page or show details in a dialog
                                },
                              );
                            },
                          ),
          );
        },
      ),
    );
  }
}
