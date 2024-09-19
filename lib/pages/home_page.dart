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
  late Future<List<Product>> _loadData;

  @override
  void initState() {
    super.initState();
    _loadData = loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce App"),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          _loadData = loadData();
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder<List<Product>>(
            future: _loadData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 50),
                      const SizedBox(height: 16),
                      Text(
                        '${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _loadData = loadData();
                          });
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                final products = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductWidget(
                      product: product,
                      onTap: () {
                        Navigator.pushNamed(context, '/detail', arguments: product);
                      },
                    );
                  },
                );
              }
              return const Center(
                child: Text("No products available"),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<List<Product>> loadData() {
    return Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }
}
