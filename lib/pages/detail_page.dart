import 'package:challenge_app/models/models.dart';
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
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _ProductDetail(product: product),
                  childCount: 3))
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
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
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
            const SizedBox(
              width: 10,
            ),
            RawChip(
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
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: [
              // starts and review count

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Image.network(
              //       product.images.firstOrNull ??
              //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcs7QeC2_kP0lJEj7Q25mpHyeNkLt_oQ43uP2_jLnhozFShnw-Mba_ataiwQd_W1aByyU&usqp=CAU',
              //       width: size.width * 0.3),
              // ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: textStyle.titleLarge,
                      ),
                      Text(product.description)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              ...product.tags.map((gender) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text(gender),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
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
      leading: IconButton.filled(
        icon: const Icon(Icons.arrow_back_ios_new),
        iconSize: 18,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton.filled(
          icon: const Icon(Icons.favorite),
          iconSize: 18,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      foregroundColor: Colors.red,
      backgroundColor: Colors.grey.withOpacity(0.3),
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        // titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // title: Text(
        //   product.title,
        //   style: const TextStyle(fontSize: 20),
        //   textAlign: TextAlign.start,
        // ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                product.images.firstOrNull ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcs7QeC2_kP0lJEj7Q25mpHyeNkLt_oQ43uP2_jLnhozFShnw-Mba_ataiwQd_W1aByyU&usqp=CAU',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

