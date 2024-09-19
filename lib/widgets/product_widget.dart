import 'package:challenge_app/config/utils/funciones.dart';
import 'package:challenge_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  const ProductWidget({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: product.title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                        height: 150,
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: product.thumbnail.isNotEmpty
                            ? NetworkImage(product.thumbnail)
                            : const AssetImage('assets/no-image.jpg')
                                as ImageProvider,
                        fit: BoxFit.cover),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          product.title,
                          maxLines: 4,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "\$${ProductUtils.getCalculatedPriceWithDiscount(product.price, product.discountPercentage)}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Descuento flotante en la parte superior izquierda
            if (product.discountPercentage > 0.0)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7203f3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${product.discountPercentage}% OFF',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
