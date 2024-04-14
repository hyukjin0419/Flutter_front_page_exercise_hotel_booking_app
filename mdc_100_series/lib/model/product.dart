enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  const Product({
    required this.category,
    required this.stars,
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.description,
  });

  final Category category;
  final int stars;
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final String description;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
