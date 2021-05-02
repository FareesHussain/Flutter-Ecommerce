
import 'package:mobile_store/constants/Endpoints.dart';

class ApiBaseHelper {
  final String _baseUrl = Endpoints.baseurl;

  Future<dynamic> getCustomerDetails(int customerId) async {
    var responseJson;
    Map<String, String> queryParameters = {
      'customer_id': '$customerId'
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    //TODO: Bring all APIs here.
  }
}