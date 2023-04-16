import 'package:equatable/equatable.dart';

class Home extends Equatable {
  final bool status;
  final DataHome data;

  const Home({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class DataHome extends Equatable {
  final List<Banners> banners;
  final List<Products> products;

  const DataHome({
    required this.banners,
    required this.products,
  });

  @override
  List<Object?> get props => [
        banners,
        products,
      ];
}

class Banners extends Equatable {
  final int id;
  final String image;

  const Banners({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    image,
  ];
}

class Products extends Equatable
{
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<String>images;
  final bool inFavorites;
  final bool inCart;

  const Products({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  List<Object?> get props => [
    id,
    price,
    oldPrice,
    discount,
    image,
    name,
    description,
    images,
    inFavorites,
    inCart,
  ];

}
