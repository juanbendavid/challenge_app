import 'package:challenge_app/config/theme/funciones.dart';
import 'package:challenge_app/models/models.dart';
import 'package:flutter/material.dart';

class CardReview extends StatelessWidget {
  final Review review;
  const CardReview({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: Theme.of(context).colorScheme.surfaceVariant,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.reviewerName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                formatDate(review.date),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < review.rating ? Icons.star : Icons.star_border,
                color: index < review.rating ? Colors.amber : Colors.grey,
                size: 16,
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            review.comment,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Email: ${review.reviewerEmail}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    ),
  );
  }
}