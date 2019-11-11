import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lets_play_atl/model/SDG.dart';

class SDGProvider {
  static const apiBase = "http://ec2-13-58-237-110.us-east-2.compute.amazonaws.com:5000";

  Future<List<SDG>> getAllSDG() async {
    Map<String, String> header = {};

    header["Content-Type"] = "application/json";

    http.Response sdgResp = await http.get(apiBase + "/event/sdg",
        headers: header
    );
    List<dynamic> sdgBody = jsonDecode(sdgResp.body);
    List<SDG> toReturn  = [];
    for (dynamic rawSDG in sdgBody) {
      SDG parsedSDG = SDG();
      parsedSDG.parseRawJson(rawSDG);
      toReturn.add(parsedSDG);
    }
    return toReturn;
  }
}
