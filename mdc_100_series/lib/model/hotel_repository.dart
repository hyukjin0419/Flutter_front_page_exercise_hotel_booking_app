import 'hotel.dart';

class HotelRepository {
  static List<Hotel> loadProducts(Categorys categorys) {
    const allHotels = <Hotel>[
      Hotel(
          categorys: Categorys.hotel,
          star: 5,
          id: 0,
          name: 'abc',
          address: "Korea",
          phoneNumber: 123,
          description: "Best in Korea"),
      Hotel(
          categorys: Categorys.hotel,
          star: 5,
          id: 0,
          name: 'bcd',
          address: "Japan",
          phoneNumber: 333,
          description: "Best in Japan"),
      Hotel(
          categorys: Categorys.hotel,
          star: 5,
          id: 0,
          name: 'qwe',
          address: "China",
          phoneNumber: 222,
          description: "Best in China"),
      Hotel(
          categorys: Categorys.hotel,
          star: 5,
          id: 0,
          name: 'rrr',
          address: "USA",
          phoneNumber: 333,
          description: "Best in USA"),
      Hotel(
          categorys: Categorys.hotel,
          star: 5,
          id: 0,
          name: 'bbb',
          address: "Russia",
          phoneNumber: 777,
          description: "Best in Russia"),
    ];
    if (categorys == Categorys.all) {
      return allHotels;
    } else {
      return allHotels.where((Hotel p) {
        return p.categorys == categorys;
      }).toList();
    }
  }
}
