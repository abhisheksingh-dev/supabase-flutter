class TodoModel {
  String title = "";
  String msg = "";

  TodoModel({
    required this.msg,
    required this.title,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    msg = json['msg'];
  }

  toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['msg'] = msg;
    return json;
  }
}
