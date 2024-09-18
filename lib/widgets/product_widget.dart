
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
        child: Column(
          children: [
            Hero(
              tag: product.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    height: 150,
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(product.thumbnail ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcs7QeC2_kP0lJEj7Q25mpHyeNkLt_oQ43uP2_jLnhozFShnw-Mba_ataiwQd_W1aByyU&usqp=CAU'),
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
                    "\$${product.price.toString()}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
