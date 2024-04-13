enum Category {
  all,
  hotel,
  motel,
}

class Hotel {
  const Hotel(
      {required this.category,
      required this.star,
      required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.description});

  final Category category;
  final int star;
  final int id;
  final String name;
  final String address;
  final int phoneNumber;
  final String description;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
