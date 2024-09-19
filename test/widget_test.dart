import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:challenge_app/models/models.dart';
import 'package:challenge_app/widgets/product_widget.dart';

void main() {
  testWidgets('ProductWidget shows product title, price, and image',
      (WidgetTester tester) async {
    // Arrange
    final product = Product(
      id: 2,
      title: "Eyeshadow Palette with Mirror",
      description:
          "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",
      category: "beauty",
      price: 19.99,
      discountPercentage: 5.5,
      rating: 3.28,
      stock: 44,
      tags: ["beauty", "eyeshadow"],
      brand: "Glamour Beauty",
      sku: "MVCFH27F",
      weight: 3,
      dimensions: Dimensions(
        width: 12.42,
        height: 8.63,
        depth: 29.13,
      ),
      warrantyInformation: "1 year warranty",
      shippingInformation: "Ships in 2 weeks",
      availabilityStatus: "In Stock",
      reviews: [],
      returnPolicy: "30 days return policy",
      minimumOrderQuantity: 32,
      meta: Meta(
        createdAt: DateTime.parse("2024-05-23T08:56:21.618Z"),
        updatedAt: DateTime.parse("2024-05-23T08:56:21.618Z"),
        barcode: "2817839095220",
        qrCode: "https://assets.dummyjson.com/public/qr-code.png",
      ),
      images: [
      ],
      thumbnail: ''
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: ProductWidget(
          product: product,
          onTap: () {}, // No es necesario implementar el callback aquí
        ),
      ),
    );

    // Assert
    expect(find.text('Eyeshadow Palette with Mirror'), findsOneWidget); // Verifica el título
    expect(find.text('\$18.89'), findsOneWidget);
    expect(find.byType(FadeInImage),findsOneWidget); // Verifica que la imagen se muestra
  });
}
