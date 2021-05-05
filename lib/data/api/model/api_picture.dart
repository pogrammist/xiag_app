class ApiPicture {
  String url;
  String urlTn;
  String name;

  ApiPicture({this.url, this.urlTn, this.name});

  ApiPicture.fromApi(Map<String, dynamic> json) {
    url = json['url'];
    urlTn = json['url_tn'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['url_tn'] = this.urlTn;
    data['name'] = this.name;
    return data;
  }
}
