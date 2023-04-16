import 'package:new_edition_shop_app/features/home/domain/entities/home.dart';

class HomeModel extends Home {
  const HomeModel({
    required super.status,
    required super.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      data: DataHomeModel.fromJson(json['data']),
    );
  }
}

class DataHomeModel extends DataHome {
  const DataHomeModel({
    required super.banners,
    required super.products,
  });

  factory DataHomeModel.fromJson(Map<String, dynamic> json) {
    List<BannersModel> banners = [];
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners.add(BannersModel.fromJson(element));
      });
    }

    List<ProductsModel> products = [];
    if (json['products'] != null) {
      json['products'].forEach((element) {
        products.add(ProductsModel.fromJson(element));
      });
    }

    return DataHomeModel(
      banners: banners,
      products: products,
    );
  }
}

class BannersModel extends Banners {
  const BannersModel({
    required super.id,
    required super.image,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
      id: json['id'],
      image: json['image'],
    );
  }
}

class ProductsModel extends Products {
  const ProductsModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.images,
    required super.inFavorites,
    required super.inCart,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images'].map((e) => e)),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
