enum Categorys {
  all,
  hotel,
  motel,
}

class Hotel {
  const Hotel(
      {required this.categorys,
      required this.star,
      required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.description});

  final Categorys categorys;
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
