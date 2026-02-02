import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final client = HttpClient();

  try {
    final uri = Uri.parse(
      'https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY',
    );

    final request = await client.getUrl(uri);
    final response = await request.close();

    if (response.statusCode == 200) {
      final body = await response.transform(utf8.decoder).join();
      final data = jsonDecode(body);
      print(JsonEncoder.withIndent('  ').convert(data));
    } else {
      print('HTTP Request Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
