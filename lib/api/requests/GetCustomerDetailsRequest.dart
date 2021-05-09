import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_store/api/response/CustomerDetailsResponse.dart';
import 'package:mobile_store/api/response/LoginResponse.dart';
import 'package:mobile_store/constants/Endpoints.dart';

Future<CustomerDetailsResponse> getCustomerDetails(int customerId) async {
  var client = http.Client();
  CustomerDetailsResponse res = CustomerDetailsResponse(successful: false, message: "Error");
  try{
    Map<String, String> queryParameters = {
      'customer_id': '$customerId'
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    var uriResponse  = await client.get(
        Uri.parse(
          Endpoints.baseurl + Endpoints.customer_details_endpoint + '?' + queryString,
        )
    );
    res = CustomerDetailsResponse.fromJson(jsonDecode(uriResponse.body));
  } finally {
    client.close();
  }
  return res;
}
