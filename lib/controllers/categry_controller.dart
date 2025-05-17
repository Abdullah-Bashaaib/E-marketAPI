import 'dart:convert';
import 'package:e_market_api/models/category_models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String categoriesUrl =
      'https://dummyjson.com/products/category-list';

  Future<List<String>> fetchCategories() async {
    try {
      print("hiiiiiiiiiiiiiiiii");
      // إرسال طلب GET إلى الـ API
      final response = await http
          .get(Uri.parse(categoriesUrl))
          .timeout(const Duration(seconds: 10));

      print(response.statusCode);
      print(response.body);

      // التحقق من نجاح الطلب
      if (response.statusCode == 200) {
        // تحويل الـ JSON إلى قائمة
        List<dynamic> data = jsonDecode(response.body);
        // تحويل القائمة إلى List<String>
        return data.cast<String>();
      } else {
        throw Exception('فشل في جلب الفئات: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ: $e');
    }
  }
}
