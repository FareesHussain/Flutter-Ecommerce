import 'package:flutter/material.dart';
import 'package:mobile_store/api/requests/GetCustomerDetailsRequest.dart';
import 'package:mobile_store/api/response/CustomerDetailsResponse.dart';
import 'package:mobile_store/constants/Endpoints.dart';
import 'package:mobile_store/constants/SharedPreferencesKeys.dart';
import 'package:mobile_store/main.dart';
import 'package:mobile_store/ui/Login.dart';
import 'package:mobile_store/widgets/AppBar.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/widgets/title_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required this.title, required this.homeContext}) : super(key: key);
  final String title;
  final BuildContext homeContext;

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  bool editable = false;
  bool loading = true;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late CustomerDetailsResponse customerDetailsResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void logout() async {
    SharedPreferences _prefs = await prefs;
    await _prefs.remove(SharedPreferenecesKeys.customer_id_key);
    Navigator.pushAndRemoveUntil(widget.homeContext, new MaterialPageRoute(builder: (context) => Login(title: 'Login or Register')), (_) => false);
  }

  void initData() async {
    SharedPreferences _prefs = await prefs;
    int customerId = _prefs.getInt(SharedPreferenecesKeys.customer_id_key)!;
    CustomerDetailsResponse res;
    res = await getCustomerDetails(customerId);
    if(res.successful){
      setState(() {
        loading = false;
      });
      customerDetailsResponse = res;
    } else {
      SnackBar snackBar = SnackBar(
        content: Text(res.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  _getEditOrDisplay() {
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
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleText(
            text: "Name: ${customerDetailsResponse.data!.name}",
            fontSize: 25,
          ),
          TitleText(
            text: "Email: ${customerDetailsResponse.data!.email}",
            fontSize: 18,
          ),
          TitleText(
            text: "Address: ${customerDetailsResponse.data!.address}",
            fontSize: 18,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.title),
      body: loading?Center(child: CircularProgressIndicator(),):
      _getEditOrDisplay(),
      floatingActionButton: FloatingActionButton(
        onPressed: logout,
        child: Icon(Icons.logout),
      ),
    );
  }
}