class user_Infoo {
  bool? status;
  int? errorNumber;
  Response? response;

  user_Infoo({this.status, this.errorNumber, this.response});

  user_Infoo.fromJson(Map<String, dynamic> json) {
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
  int? age;
  String? fristName;
  String? lastName;
  String? phone;
  String? imageUrl;
  String? id;

  Response(
      {this.email,
        this.age,
        this.fristName,
        this.lastName,
        this.phone,
        this.imageUrl,
        this.id});

  Response.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    age = json['age'];
    fristName = json['fristName'];
    lastName = json['lastName'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['age'] = this.age;
    data['fristName'] = this.fristName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}
