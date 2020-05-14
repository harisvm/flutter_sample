class AddressModel {
  final String line1;
  final String line2;
  final String city;
  final String landMark;
  final String pincode;

  AddressModel(this.line1, this.line2, this.city, this.landMark, this.pincode);

  @override
  String toString() {
    return 'Address : ' +
        line1 +
        "\n" +
        line2 +
        "\n" +
        'City: ' +
        city +
        "\n" +
        'Landmark: ' +
        landMark +
        "\n" +
        'Pincode: ' +
        pincode;
  }
}
