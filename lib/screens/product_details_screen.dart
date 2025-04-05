import 'package:flutter/material.dart';
import 'package:project2/models/product.dart';
import 'package:project2/widgets/review_card.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title)),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        children: [
          Hero(
            tag: widget.product.id,
            child: Image.network(widget.product.thumbnail),
          ),
          Text(widget.product.title, style: textTheme.titleLarge),
          const SizedBox(height: 5),
          Text("\$${widget.product.price}", style: textTheme.titleMedium),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            children: [
              for (final tag in widget.product.tags)
                Chip(
                  label: Text(tag),
                  shape: StadiumBorder(),
                  backgroundColor: colorScheme.secondaryContainer,
                  side: BorderSide(color: Colors.transparent),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(widget.product.description, style: textTheme.bodyLarge),
          const SizedBox(height: 15),
          Text("Reviews", style: textTheme.titleLarge),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final review in widget.product.reviews)
                  ReviewCard(review: review),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
