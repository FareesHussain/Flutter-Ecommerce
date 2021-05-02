import 'package:flutter/material.dart';
import 'package:mobile_store/constants/Endpoints.dart';
import 'package:mobile_store/constants/SharedPreferencesKeys.dart';
import 'package:mobile_store/widgets/AppBar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  bool editable = false;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  void initData() async {
    super.initState();
    SharedPreferences _prefs = await prefs;
    int customerId = _prefs.getInt(SharedPreferenecesKeys.customer_id_key)!;
    var client = http.Client();
    Map<String, String> queryParameters = {
      'customer_id': '$customerId'
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    var uriResponse  = await client.get(
      Uri.parse(
        Endpoints.baseurl + Endpoints.customer_details_endpoint + '?' + queryString,
      )
    );
    if(uriResponse.statusCode == 200) {

    } else {

    }
  }

  _getEditOrDisplay() {
    initData();
    if(editable) {
      return _editColumn();
    } else {
      return _displayColumn();
    }
  }

  _editColumn() {
    return Column(
      children: [

      ],
    );
  }

  _displayColumn() {
    return Column(
      children: [
        Text("display")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.title),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getEditOrDisplay()
            ]
          ),
        ),
      ),
    );
  }
}