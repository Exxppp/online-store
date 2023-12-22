import 'package:flutter/material.dart';
import 'package:online_store/category/model/entities/category.dart';
import 'package:online_store/core/view/image_network.dart';

class CategoryGridItem extends StatelessWidget {
  final void Function() onTap;
  final Category category;

  const CategoryGridItem({
    super.key,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageNetwork(
                  url: category.imageUrl,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                category.title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
