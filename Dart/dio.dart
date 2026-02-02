import 'dart:convert';
import 'package:dio/dio.dart';

Future<void> main() async {
  final dio = Dio();

  try {
    final response = await dio.get(
      'https://api.apitube.io/v1/news/everything',
      queryParameters: {
        'limit': 50,
        'api_key': 'YOUR_API_KEY',
      },
    );

    if (response.statusCode == 200) {
      print(JsonEncoder.withIndent('  ').convert(response.data));
    } else {
      print('HTTP Request Error: ${response.statusCode}');
    }
  } on DioException catch (e) {
    print('HTTP Request Error: ${e.response?.statusCode}');
  }
}
