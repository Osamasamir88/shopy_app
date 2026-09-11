class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int reviewsCount;
  final List<String> images;
  final String categoryName;
  final List<String> sizes;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.images,
    required this.categoryName,
    required this.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Strapi v4 / v5 dynamic response handling
    final attributes = json['attributes'] ?? json;

    // 1️⃣ استخراج قائمة الصور (images)
    List<String> imageUrls = [];
    if (attributes['images'] != null) {
      final imagesData = attributes['images']['data'] ?? attributes['images'];
      if (imagesData is List) {
        imageUrls = imagesData.map<String>((img) {
          final imgAttr = img['attributes'] ?? img;
          return imgAttr['url'] ?? '';
        }).toList();
      }
    }

    // 2️⃣ استخراج اسم الـ Category
    String category = '';
    if (attributes['category'] != null) {
      final catData = attributes['category']['data'] ?? attributes['category'];
      final catAttr = catData['attributes'] ?? catData;
      category = catAttr['name'] ?? catAttr['title'] ?? '';
    }

    // 3️⃣ استخراج قائمة المقاسات (sizes)
    List<String> parsedSizes = [];
    if (attributes['sizes'] != null) {
      if (attributes['sizes'] is List) {
        parsedSizes = List<String>.from(attributes['sizes'].map((e) => e.toString()));
      }
    }

    return ProductModel(
      id: json['id'] ?? 0,
      title: attributes['title'] ?? '',
      description: attributes['description'] ?? '',
      price: (attributes['price'] as num?)?.toDouble() ?? 0.0,
      rating: (attributes['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: (attributes['reviews_count'] as num?)?.toInt() ?? 0,
      images: imageUrls,
      categoryName: category,
      sizes: parsedSizes,
    );
  }

  // Helper Getter للحصول على الصورة الرئيسية الأولى للكارت في الـ Home
  String get mainImage => images.isNotEmpty ? images.first : '';
}