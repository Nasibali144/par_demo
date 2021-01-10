import 'package:par_demo/models/user_model.dart';

class Create {
  String status;
  String message;
  User data;

  Create.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = User.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };

}