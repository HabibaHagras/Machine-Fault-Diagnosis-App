class home_infooo {
  bool? status;
  int? errorNumber;
  List<Response>? response;

  home_infooo({this.status, this.errorNumber, this.response});

  home_infooo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? sectionText;
  String? imageUrl;
  String? name;
  String? id;

  Response({this.sectionText, this.imageUrl, this.name, this.id});

  Response.fromJson(Map<String, dynamic> json) {
    sectionText = json['sectionText'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionText'] = this.sectionText;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
