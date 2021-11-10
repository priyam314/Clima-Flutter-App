import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper({this.url});
  final url;

  Future<dynamic> getData() async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode==200) {
      String data = response.body;
      return jsonDecode(data);
    }else{
      print (response.statusCode);
    }
  }
}