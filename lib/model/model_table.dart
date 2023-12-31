class model_table {
  String? vehicleType;
  String? fuelType;
  String? brandType;
  String? vehicleNo;

  model_table({this.vehicleType, this.brandType, this.fuelType, this.vehicleNo});
  Map<String, dynamic> toJson() {
    return {
      'vehicleType': vehicleType,
      'brandType': brandType,
      'fuelType': fuelType,
      'vehicleNo': vehicleNo
    };
  }

  model_table.fromJson(Map<String, dynamic> json) {
    vehicleType = json['vehicleType'];
    brandType = json['brandType'];
    fuelType = json['fuelType'];
    vehicleNo = json['vehicleNo'];
  }
}
