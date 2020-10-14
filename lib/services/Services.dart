import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:http/http.dart' as http;

abstract class Services{
  static Future fetchArray(dir) async {
      try{
        return await http.get("http://192.141.250.250/sistemantel/serratalhada/" + dir);
      }catch(e){
        return (Messages.NOT_CONECTION);
      }
  }
}
