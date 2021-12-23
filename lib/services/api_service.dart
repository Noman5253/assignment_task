import 'package:assignment/pages/daily_panchang_screen/daily_panchang_model.dart';
import 'package:assignment/pages/talk_to_astrologer_screen/astrologer_model.dart';
import 'package:assignment/pages/talk_to_astrologer_screen/location_model.dart';
import 'package:assignment/services/endpoints.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _PROD_URL = 'https://www.astrotak.com/astroapi/api/';
  static var client = http.Client();

  static Future<AstrologerModel?> getAgents() async {
    http.Response response = await client.get(
      Uri.parse(_PROD_URL + Endpoints.ALL_AGENTS),
    );

    if (response.statusCode == 200) {
      return astrologerModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<LocationModel?> getLocation(query) async {
    http.Response response = await client.get(
      Uri.parse(_PROD_URL + Endpoints.LOCAION + query),
    );

    if (response.statusCode == 200) {
      return locationModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<PanchangModel?> getDailyPanchang(data) async {
    http.Response response = await client.post(
        Uri.parse(_PROD_URL + Endpoints.HOROSCOPE_PANCHANG),
        headers: <String, String>{"Content-Type": "Application/json"},
        body: data);

    if (response.statusCode == 200) {
      return panchangModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
