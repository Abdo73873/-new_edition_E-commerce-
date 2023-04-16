import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.status,
    required super.data,
  });
}

class CategoriesDataModel extends CategoriesData {
  const CategoriesDataModel({
    required super.currentPage,
    required super.data,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.path,
    required super.perPage,
    required super.to,
    required super.total,
  });

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    List<DataModel>data =[];
    if(json['data'] != null){
      json['data'].forEach((element){
        data.add(DataModel.fromJson(element));
      });
    }
    return CategoriesDataModel(
      currentPage: json['current_page'],
      data: data,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class DataModel extends Data {
  const DataModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
