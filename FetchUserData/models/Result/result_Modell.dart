class result_Modell {
  bool? status;
  int? errorNumber;
  List<Response>? response;

  result_Modell({this.status, this.errorNumber, this.response});

  result_Modell.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  int? rate;
  String? feedback;
  String? pdfUrl;
  String? name;
  String? id;

  Response(
      {this.createdAt,
      this.rate,
      this.feedback,
      this.pdfUrl,
      this.name,
      this.id});

  Response.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    rate = json['rate'];
    feedback = json['feedback'];
    pdfUrl = json['pdfUrl'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['rate'] = this.rate;
    data['feedback'] = this.feedback;
    data['pdfUrl'] = this.pdfUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
