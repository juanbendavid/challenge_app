import 'package:challenge_app/models/models.dart';
import 'package:challenge_app/providers/product_provider.dart';
import 'package:challenge_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent - 100)) {
      final productProvider =
          Provider.of<ProductProvider>(context, listen: false);
      if (!_isLoading) {
        setState(() => _isLoading = true);
        await productProvider.fetchProducts(loadMore: true);
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce App"),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          final productProvider =
              Provider.of<ProductProvider>(context, listen: false);
          productProvider.refreshProducts();
          productProvider.fetchProducts();
        },
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            if (productProvider.products.isEmpty) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return Stack(
              children: [
                GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return ProductWidget(
                      product: product,
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: product);
                      },
                    );
                  },
                ),
                if (_isLoading)
                  const Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
