import 'package:http/http.dart' as http;

class AuthRepository {
  final baseUrl = "https://devapi.aureacapitalmarkets.com";

  get http => null;
  Future<dynamic> login(String mail, String password) async {
    try {
      var response = await http.post('$baseUrl/api/v1/acm/login',
          body: {'username': mail, 'password': password});
      return response?.statusCode == 200
          ? response['access_token']
          : response['detail'];
    } catch (notfound) {
      throw "Se ha encontrado un error";
    }
  }
}
