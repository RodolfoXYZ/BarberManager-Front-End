import 'package:barbershop_app/services/api-connection.dart';

class ScheculeService{

  final ApiService apiService;
  ScheculeService({required this.apiService});
  String mapping = "/agendamentos";

  Future<dynamic> getById(int id, Map<String, String> _data) async {
    try{
      var result = await apiService.post('${this.mapping}/usuario/${id}', _data);
      print(result);
      return result;
    }
    catch(e){
      print(e);
    }
  }

}