import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/shared/shared_keys.dart';
import 'package:ne_sever_mobile/models/BaseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences preferences;
  static SharedManager _instance;
  SharedManager._init();

  static SharedManager get instance {
    if (_instance == null) {
      _instance = SharedManager._init();
    }
    return _instance;
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveStringValue(SharedKeys key, String value) async {
    return await preferences.setString(key.toString(), value);
  }

  Future<bool> saveBoolValue(SharedKeys key, bool value) async {
    return await preferences.setBool(key.toString(), value);
  }

  bool getBoolValue(SharedKeys key) => preferences.getBool(key.toString());

  String getStringValue(SharedKeys key) =>
      preferences.getString(key.toString());

  saveJsonModel<T>(SharedKeys key, List<T> model) async {
    var json = jsonEncode(model);
    return await preferences.setString(key.toString(), json);
  }

  List<T> getJsonModel<T extends BaseModel>(T model, SharedKeys key) {
    var jsonString = preferences.getString(key.toString());
    if (jsonString != null) {
      var jsonModel = jsonDecode(jsonString);
      if (jsonModel is Map) {
        return model.fromJson(jsonModel);
      } else if (jsonModel is List) {
        print('SHARED LİST-->');
        return jsonModel.map((e) => model.fromJson(e)).toList().cast();
      } else {
        return jsonModel;
      }
    } else {
      Logger().d('JSON STRİNG NULL');
      return null;
    }
  }
}
