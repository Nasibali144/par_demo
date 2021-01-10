class Delete {
  String status;
  String message;
  String data;

  Delete.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}