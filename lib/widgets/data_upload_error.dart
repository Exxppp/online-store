import 'package:flutter/material.dart';

class DataUploadError extends StatelessWidget {

  const DataUploadError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ошибка загрузки данных'),
    );
  }
}
