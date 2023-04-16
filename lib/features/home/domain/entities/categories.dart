import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final bool status;
  final CategoriesData data;

  const Categories({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class CategoriesData extends Equatable {
  final int currentPage;
  final List<Data> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String path;
  final int perPage;
  final int to;
  final int total;

  const CategoriesData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  @override
  List<Object?> get props => [
        currentPage,
        data,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        path,
        perPage,
        to,
        total,
      ];
}

class Data extends Equatable {
  final int id;
  final String name;
  final String image;

  const Data({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
  ];
}
