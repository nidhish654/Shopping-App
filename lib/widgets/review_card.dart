import 'package:flutter/material.dart';
import 'package:project2/models/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final Review review;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (int i = 0; i < review.rating; i++) Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 10),
          Text(review.reviewerName, style: textTheme.titleMedium),
          Text(review.reviewerEmail, style: textTheme.bodySmall),
          const SizedBox(height: 10),
          Text(review.comment, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
