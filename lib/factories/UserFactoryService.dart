import 'package:barbershop_app/constants.dart';
import 'package:barbershop_app/services/api-connection.dart';
import 'package:barbershop_app/services/user-service.dart';

var _apiConnection = ApiService(baseUrl: BASE_URL);
var userFactoryService = UserService(apiService: _apiConnection);