import 'package:flutter/material.dart';
import 'package:online_store/core/view/image_network.dart';
import 'package:online_store/product/model/entities/product.dart';

class ProductTileWidget extends StatelessWidget {
  final void Function() onTap;
  final Product product;

  const ProductTileWidget({
    super.key,
    required this.onTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.grey.withOpacity(0.4),
        onTap: onTap,
        leading: ImageNetwork(
          url: product.imageUrl,
          width: 70,
          height: 85,
          fit: BoxFit.contain,
        ),
        title: Text(
          product.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
        ),
        subtitle: Text(
          '\nЦена:  ${product.price}',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: false,
        ),
      ),
    );
  }
}
