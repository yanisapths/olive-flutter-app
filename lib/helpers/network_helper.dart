import 'package:http/http.dart' as http;

import '../entities/daycare_entities.dart';

class NetworkHelper {
  Future<List<Daycare>> fetchDaycares(url) async {
    final response = await http.get(Uri.parse(url));
    final daycare = daycareFromJson(response.body);

    //return value 'Daycare.fromJson(json).address'
    if (response.statusCode == 200) {
      return daycare;
    } else {
      throw Exception('Failed to load daycares');
    }
  }
}
