import 'package:challenge_app/config/utils/funciones.dart';
import 'package:challenge_app/models/models.dart';
import 'package:challenge_app/widgets/card_review.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomSliverAppBar(product: product),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _ProductDetail(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductDetail extends StatelessWidget {
  final Product product;
  const _ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _reviewSection(product: product, textStyle: textStyle),
          const SizedBox(height: 16),
          _productInfo(product: product, textStyle: textStyle),
          const SizedBox(height: 16),
          _tagSection(product: product),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _productInfo(
      {required Product product, required TextTheme textStyle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style:
              textStyle.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${ProductUtils.getCalculatedPriceWithDiscount(product.price, product.discountPercentage)}",
              style: textStyle.headlineSmall?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "In Stock: ${product.stock}",
              style: textStyle.bodyMedium,
            ),
          ],
        ),
        // real price with discount
        const SizedBox(height: 8),

        Row(
          children: [
            Text(
              "Sale price ",
              style: textStyle.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
            Text(
              "sale price \$${product.price.toString()}",
              style: textStyle.bodyMedium?.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Text(
              " (-${product.discountPercentage}%)",
              style: textStyle.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Brand: ${product.brand}",
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          "SKU: ${product.sku}",
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          "Weight: ${product.weight} g",
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          "Dimensions: ${product.dimensions.width} x ${product.dimensions.height} x ${product.dimensions.depth} cm",
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          "Warranty Information: ${product.warrantyInformation}",
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          "Shipping Information: ${product.shippingInformation}",
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          "Return Policy: ${product.returnPolicy}",
          style: textStyle.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          "Minimum Order Quantity: ${product.minimumOrderQuantity}",
          style: textStyle.bodyMedium,
        ),
      ],
    );
  }

  Widget _tagSection({required Product product}) {
    return Wrap(
      spacing: 8,
      children: product.tags.map((tag) {
        return Chip(
          label: Text(tag),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }).toList(),
    );
  }
}

class _reviewSection extends StatelessWidget {
  const _reviewSection({
    super.key,
    required this.product,
    required this.textStyle,
  });

  final Product product;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.star,
            color: Colors.orange,
          ),
          onPressed: () {},
        ),
        Text(
          product.rating.toString(),
          style: textStyle.titleSmall
              ?.copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        RawChip(
          onPressed: () {
            showReviewsModal(context, product.reviews);
          },
          label: Text(
            "${product.reviews.length} reviews",
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          backgroundColor: Colors.grey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(color: Colors.transparent), // Elimina el borde
        )
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Product product;
  const _CustomSliverAppBar({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        iconSize: 18,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          iconSize: 24,
          onPressed: () {
            // Acción favorita
          },
        ),
      ],
      backgroundColor: Colors.white,
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: product.title,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
              ),
              Image.network(
                product.images.first,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Modal para mostrar las reseñas
void showReviewsModal(BuildContext context, List<Review> reviews) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        initialChildSize: 0.7,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Text(
                  'User Reviews',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return CardReview(review: review);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
