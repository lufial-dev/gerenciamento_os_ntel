import 'package:http/http.dart' as http;

abstract class Services {
  static Future fetchArray(dir) =>
      http.get("http://192.141.250.250/sistemantel/serratalhada/" + dir);
}
