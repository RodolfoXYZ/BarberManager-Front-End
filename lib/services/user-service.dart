import 'package:barbershop_app/services/api-connection.dart';

class UserService{

  final ApiService apiService;
  UserService({required this.apiService});
  String mapping = "/auth";

  Future<Map<String, dynamic>> login(String email, String password) async {
    try{
      Map<String, dynamic> data = {
        "email": email,
        "senha" : password
      };
      var result = await apiService.post('${this.mapping}/login', data);
      return result;
    }
    catch(e){
      throw e;
    }
  }

}