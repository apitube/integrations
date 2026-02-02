import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final uri = Uri.parse('https://api.apitube.io/v1/news/everything').replace(
    queryParameters: {
      'limit': '50',
      'api_key': 'YOUR_API_KEY',
    },
  );

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(JsonEncoder.withIndent('  ').convert(data));
    } else {
      print('HTTP Request Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
