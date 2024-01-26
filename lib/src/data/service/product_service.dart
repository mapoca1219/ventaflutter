import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl;

  ProductService(this.baseUrl);

  Future<List<Map<String, dynamic>>> getAllProducts(int collectionId) async {
    try {
      final response = await http.get(
        '$baseUrl/api/catalog/pvt/collection/$collectionId/products' as Uri,
        headers: {
          'X-VTEX-API-AppKey': 'vtexappkey-krika-XUCLKS',
          'X-VTEX-API-AppToken': 'AJSGRSGDIVXEFJPQQSSMSQRQIYBRSRXFMQRXJFOLLCBCDIWDCCPMAHQUAKJDWVIFCBLDUKVLAGOOUOCBITYBTOOIZFRJTYTKTUSZWXEPJSHBPFTKOKRLCTITKSWNGBYI',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('Data') && data['Data'] is List) {
          return List<Map<String, dynamic>>.from(data['Data']);
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  Future<Map<String, dynamic>> getProductDetails(int productId) async {
    try {
      final response = await http.get(
        '$baseUrl/api/catalog/pvt/product/$productId' as Uri,
        headers: {
          'X-VTEX-API-AppKey': 'vtexappkey-krika-XUCLKS',
          'X-VTEX-API-AppToken': 'AJSGRSGDIVXEFJPQQSSMSQRQIYBRSRXFMQRXJFOLLCBCDIWDCCPMAHQUAKJDWVIFCBLDUKVLAGOOUOCBITYBTOOIZFRJTYTKTUSZWXEPJSHBPFTKOKRLCTITKSWNGBYI',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load product details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product details: $e');
    }
  }
}
