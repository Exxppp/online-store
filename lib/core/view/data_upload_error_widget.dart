import 'package:flutter/material.dart';

class DataUploadErrorWidget extends StatelessWidget {
  final String? textError;

  const DataUploadErrorWidget({
    Key? key,
    required this.textError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(textError.toString()),
    );
  }
}
