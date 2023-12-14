import 'package:flutter/material.dart';
import 'package:online_store/api/models/product.dart';
import 'package:online_store/widgets/image_network.dart';

class ProductTile extends StatelessWidget {
  final Function() pushNamed;
  final ProductModel product;

  const ProductTile({
    super.key,
    required this.pushNamed,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.grey.withOpacity(0.4),
        onTap: pushNamed,
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
