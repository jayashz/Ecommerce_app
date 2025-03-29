class OrderParams {
  final String fName;
  final String phoneNum;
  final String address;
  final String city;
  OrderParams(
      {required this.address,
      required this.city,
      required this.fName,
      required this.phoneNum});

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'city': city,
      'phone': phoneNum,
      'full_name': fName
    };
  }
}
