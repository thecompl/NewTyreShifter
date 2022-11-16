class Cartype {
  int? carTypeId;
  String? carType;

  Cartype({this.carTypeId, this.carType});

  Cartype.fromJson(Map<String, dynamic> json) {
    carTypeId = json['carTypeId'];
    carType = json['carType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carTypeId'] = this.carTypeId;
    data['carType'] = this.carType;
    return data;
  }
}
