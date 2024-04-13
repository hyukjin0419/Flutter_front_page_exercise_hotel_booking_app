import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.accessories,
        stars: 4,
        id: 0,
        name: 'Whitney belt',
        address: 'Korea',
        phoneNumber: '123',
        description: 'best in Korea',
      ),
      Product(
        category: Category.accessories,
        stars: 4,
        id: 1,
        name: 'Garden strand',
        address: 'Japan',
        phoneNumber: '4556',
        description: 'Best in Japan',
      ),
      Product(
        category: Category.accessories,
        stars: 4,
        id: 2,
        name: 'Strut earrings',
        address: 'Korea',
        phoneNumber: '111',
        description: 'the second in Korea',
      ),
      Product(
        category: Category.accessories,
        stars: 4,
        id: 3,
        name: 'Varsity socks',
        address: 'China',
        phoneNumber: '112',
        description: 'best in China',
      ),
      Product(
        category: Category.accessories,
        stars: 4,
        id: 4,
        name: 'Weave keyring',
        address: 'USA',
        phoneNumber: '911',
        description: 'best in USA',
      ),
      Product(
        category: Category.accessories,
        stars: 4,
        id: 5,
        name: 'Gatsby hat',
        address: 'Russia',
        phoneNumber: '111',
        description: 'best in Soviet',
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
