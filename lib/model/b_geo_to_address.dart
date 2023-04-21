import 'dart:developer';

class BGeoToAddress {
  Location? location;
  String? formattedAddress;
  String? business;
  AddressComponent? addressComponent;
  int? cityCode;

  BGeoToAddress(
      {this.location,
      this.formattedAddress,
      this.business,
      this.addressComponent,
      this.cityCode});

  BGeoToAddress.fromJson(Map<String, dynamic> json) {
    location =
        json["location"] == null ? null : Location.fromJson(json["location"]);
    formattedAddress = json["formatted_address"];
    business = json["business"];
    addressComponent = json["addressComponent"] == null
        ? null
        : AddressComponent.fromJson(json["addressComponent"]);
    cityCode = json["cityCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (location != null) {
      _data["location"] = location?.toJson();
    }
    _data["formatted_address"] = formattedAddress;
    _data["business"] = business;
    if (addressComponent != null) {
      _data["addressComponent"] = addressComponent?.toJson();
    }
    _data["cityCode"] = cityCode;
    return _data;
  }

  BGeoToAddress copyWith({
    Location? location,
    String? formattedAddress,
    String? business,
    AddressComponent? addressComponent,
    int? cityCode,
  }) =>
      BGeoToAddress(
        location: location ?? this.location,
        formattedAddress: formattedAddress ?? this.formattedAddress,
        business: business ?? this.business,
        addressComponent: addressComponent ?? this.addressComponent,
        cityCode: cityCode ?? this.cityCode,
      );
}

class AddressComponent {
  String? city;
  String? direction;
  String? distance;
  String? district;
  String? province;
  String? street;
  String? streetNumber;

  AddressComponent(
      {this.city,
      this.direction,
      this.distance,
      this.district,
      this.province,
      this.street,
      this.streetNumber});

  AddressComponent.fromJson(Map<String, dynamic> json) {
    city = json["city"];
    direction = json["direction"];
    distance = json["distance"];
    district = json["district"];
    province = json["province"];
    street = json["street"];
    streetNumber = json["street_number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["city"] = city;
    _data["direction"] = direction;
    _data["distance"] = distance;
    _data["district"] = district;
    _data["province"] = province;
    _data["street"] = street;
    _data["street_number"] = streetNumber;
    return _data;
  }

  AddressComponent copyWith({
    String? city,
    String? direction,
    String? distance,
    String? district,
    String? province,
    String? street,
    String? streetNumber,
  }) =>
      AddressComponent(
        city: city ?? this.city,
        direction: direction ?? this.direction,
        distance: distance ?? this.distance,
        district: district ?? this.district,
        province: province ?? this.province,
        street: street ?? this.street,
        streetNumber: streetNumber ?? this.streetNumber,
      );
}

class Location {
  double? lng;
  double? lat;

  Location({this.lng, this.lat});

  Location.fromJson(Map<String, dynamic> json) {
    lng = json["lng"];
    lat = json["lat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lng"] = lng;
    _data["lat"] = lat;
    return _data;
  }

  Location copyWith({
    double? lng,
    double? lat,
  }) =>
      Location(
        lng: lng ?? this.lng,
        lat: lat ?? this.lat,
      );
}
