import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonProfileController extends GetxController {
  UserModel user = UserModel();
  RxString imageURL = ''.obs;

  void onInit() async {
    super.onInit();
  }

  void getUser(int id) async{
    var res = await Utilities.httpPost("admin/users/", {"id": id.toString()});
    print(id);
    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body)['data'];
      user = UserModel.fromJson(data);
      imageURL.value = jsonDecode(res.body)['image'];
    }
    update();
  }

}
