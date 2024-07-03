class Pro_user {
  bool? status;
  int? errorNumber;
  Response? response;

  Pro_user({this.status, this.errorNumber, this.response});

  Pro_user.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? email;
  String? password;
  int? age;
  String? phone;
  int? recordNumber;
  String? role;
  String? token;
  String? name;
  String? id;

  Response(
      {this.email,
        this.password,
        this.age,
        this.phone,
        this.recordNumber,
        this.role,
        this.token,
        this.name,
        this.id});

  Response.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    age = json['age'];
    phone = json['phone'];
    recordNumber = json['recordNumber'];
    role = json['role'];
    token = json['token'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['recordNumber'] = this.recordNumber;
    data['role'] = this.role;
    data['token'] = this.token;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}