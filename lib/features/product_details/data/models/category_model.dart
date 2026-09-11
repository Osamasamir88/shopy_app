class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] ?? json;
    return CategoryModel(
      id: json['id'] ?? 0,
      name: attributes['name'] ?? attributes['title'] ?? '',
    );
  }
}