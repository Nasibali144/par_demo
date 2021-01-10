import 'package:par_demo/models/user_model.dart';

class Update {
  String status;
  String message;
  List<User> data;

  Update.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = List<User>.from(json["data"].map((x) => User.fromJson(x)));

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : List<User>.from(data.map((x) => x.toJson()))
  };
}