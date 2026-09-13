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
    try {
      var rawImages = attributes['images'];
      if (rawImages is Map) {
        rawImages = rawImages['data'] ?? rawImages;
      }
      if (rawImages is List) {
        imageUrls = rawImages.map<String>((img) {
          if (img is Map) {
            final imgAttr = img['attributes'] ?? img;
            String url = imgAttr['url']?.toString() ?? '';

            // 👈 هنا الإضافة المهمة: لو الرابط نسبي يبدأ بـ / ندمج معه الـ IP بتاع السيرفر
            if (url.startsWith('/')) {
              url = 'http://192.168.1.10:1337$url';
            }
            return url;
          }
          return img.toString();
        }).toList();
      } else if (rawImages is String) {
        String url = rawImages;
        if (url.startsWith('/')) {
          url = 'http://192.168.1.10:1337$url';
        }
        imageUrls = [url];
      }
    } catch (_) {
      imageUrls = [];
    }
    // 2️⃣ استخراج اسم الـ Category
    String category = '';
    try {
      var catData = attributes['category'];
      if (catData is Map) {
        catData = catData['data'] ?? catData;
        final catAttr = catData is Map
            ? (catData['attributes'] ?? catData)
            : catData;
        category =
            catAttr['name']?.toString() ?? catAttr['title']?.toString() ?? '';
      } else if (catData is String) {
        category = catData;
      }
    } catch (_) {
      category = '';
    }

    // 3️⃣ استخراج قائمة المقاسات (sizes)
    List<String> parsedSizes = [];
    try {
      var rawSizes = attributes['sizes'];
      if (rawSizes is Map) {
        rawSizes = rawSizes['data'] ?? rawSizes;
      }
      if (rawSizes is List) {
        parsedSizes = rawSizes.map((e) => e.toString()).toList();
      } else if (rawSizes is String) {
        parsedSizes = rawSizes.split(',');
      }
    } catch (_) {
      parsedSizes = [];
    }

    return ProductModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
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
