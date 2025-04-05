import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/repositories/product_repository.dart';
import 'package:project2/widgets/product_card.dart';

import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductRepository _repository = ProductRepository();
  List<Product> products = [];
  bool isLoading = false;
  @override
  void initState() {
    _fetchProduct();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping App"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bag))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            CupertinoSearchTextField(
              prefixIcon: Icon(CupertinoIcons.search),
              padding: EdgeInsets.all(12),
              style: GoogleFonts.poppins(),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 15),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      for (final product in products)
                        ProductCard(product: product),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchProduct() async {
    setState(() {
      isLoading = true;
    });
    final List<Product> result = await _repository.fetchProducts();
    setState(() {
      products = result;
      isLoading = false;
    });
  }
}
