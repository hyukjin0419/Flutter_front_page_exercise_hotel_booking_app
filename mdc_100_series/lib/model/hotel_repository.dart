import 'hotel.dart';

class HotelRepository {
  static List<Hotel> loadProducts(Category category) {
    const allHotels = <Hotel>[
      Hotel(
          category: Category.hotel,
          star: 5,
          id: 0,
          name: 'abc',
          address: "Korea",
          phoneNumber: 123,
          description: "Best in Korea"),
      Hotel(
          category: Category.hotel,
          star: 5,
          id: 0,
          name: 'abc',
          address: "Korea",
          phoneNumber: 123,
          description: "Best in Korea"),
      Hotel(
          category: Category.hotel,
          star: 5,
          id: 0,
          name: 'abc',
          address: "Korea",
          phoneNumber: 123,
          description: "Best in Korea"),
      Hotel(
          category: Category.hotel,
          star: 5,
          id: 0,
          name: 'abc',
          address: "Korea",
          phoneNumber: 123,
          description: "Best in Korea"),
      Hotel(
          category: Category.hotel,
          star: 5,
          id: 0,
          name: 'abc',
          address: "Korea",
          phoneNumber: 123,
          description: "Best in Korea"),
    ];
    if (category == Category.all) {
      return allHotels;
    } else {
      return allHotels.where((Hotel p) {
        return p.category == category;
      }).toList();
    }
  }
}
