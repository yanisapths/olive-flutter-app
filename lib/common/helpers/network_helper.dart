import 'package:http/http.dart' as http;

import '../../entities/daycare_entities.dart';

class NetworkHelper {
  Future<List<Daycare>> fetchDaycares(url) async {
    print(url);
    final response = await http.get(Uri.parse(url));
    final daycare = daycareFromJson(response.body);

    if (response.statusCode == 200) {
      return daycare;
    } else {
      throw Exception('Failed to load daycares');
    }
  }
}
