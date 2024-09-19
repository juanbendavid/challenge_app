import 'package:flutter_test/flutter_test.dart';
import 'package:challenge_app/models/models.dart';

void main() {
  group('Data Model Tests', () {
    test('Debe mapear correctamente el JSON a un objeto Data', () {
      final jsonData = {
        "products": [
          {
            "id": 1,
            "title": "Calvin Klein CK One",
            "description": "Un perfume clásico unisex.",
            "category": "fragrances",
            "price": 49.99,
            "discountPercentage": 0.32,
            "rating": 4.85,
            "stock": 17,
            "tags": ["fragrances", "perfumes"],
            "brand": "Calvin Klein",
            "sku": "DZM2JQZE",
            "weight": 5,
            "dimensions": {"width": 11.53, "height": 14.44, "depth": 6.81},
            "warrantyInformation": "5 year warranty",
            "shippingInformation": "Ships overnight",
            "availabilityStatus": "In Stock",
            "reviews": [
              {
                "rating": 5,
                "comment": "Great value for money!",
                "date": "2024-05-23T08:56:21.619Z",
                "reviewerName": "Sophia Brown",
                "reviewerEmail": "sophia.brown@x.dummyjson.com"
              }
            ],
            "returnPolicy": "No return policy",
            "minimumOrderQuantity": 20,
            "meta": {
              "createdAt": "2024-05-23T08:56:21.619Z",
              "updatedAt": "2024-05-23T08:56:21.619Z",
              "barcode": "2210136215089",
              "qrCode": "https://assets.dummyjson.com/public/qr-code.png"
            },
            "images": [
              "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/1.png"
            ],
            "thumbnail":
                "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/thumbnail.png"
          }
        ],
        "total": 100,
        "skip": 0,
        "limit": 30
      };

      final data = Data.fromJson(jsonData);

      expect(data.total, 100);
      expect(data.skip, 0);
      expect(data.limit, 30);
      expect(data.products.length, 1);
      expect(data.products.first.id, 1);
      expect(data.products.first.title, "Calvin Klein CK One");
      expect(data.products.first.price, 49.99);
      expect(
          data.products.first.reviews.first.comment, "Great value for money!");
    });

    test('Debe manejar correctamente los valores nulos o faltantes', () {
      final jsonData = {
        "products": [
          {
            "id": 1,
            "title": "Essence Mascara Lash Princess",
            "description":
                "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
            "category": "beauty",
            "price": 9.99,
            "discountPercentage": null,
            "rating": 4.94,
            "stock": 5,
            "tags": [],
            "brand": null,
            "sku": "RCH45Q1A",
            "weight": 2,
            "dimensions": {"width": 23.17, "height": 14.43, "depth": 28.01},
            "warrantyInformation": "1 month warranty",
            "shippingInformation": "Ships in 1 month",
            "availabilityStatus": "Low Stock",
            "reviews": [],
            "returnPolicy": "30 days return policy",
            "minimumOrderQuantity": 24,
            "meta": {
              "createdAt": "2024-05-23T08:56:21.618Z",
              "updatedAt": "2024-05-23T08:56:21.618Z",
              "barcode": "9164035109868",
              "qrCode": "https://assets.dummyjson.com/public/qr-code.png"
            },
            "images": [
              "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"
            ],
            "thumbnail":
                "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
          }
        ],
        "total": 1,
        "skip": 0,
        "limit": 1
      };

      final data = Data.fromJson(jsonData);

      expect(data.total, 1);
      expect(data.products.first.discountPercentage, 0.0);
      expect(data.products.first.brand, null); // Valor opcional
      expect(data.products.first.reviews, []); // Lista vacía permitida
    });
  });
}
