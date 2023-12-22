import 'package:flutter/material.dart';

abstract class BaseListPage<T, TModel> extends StatefulWidget {
  final String title;

  const BaseListPage({
    Key? key,
    required this.title,
  }) : super(key: key);
}

abstract class BaseListPageState<T extends BaseListPage,
    TModel extends ChangeNotifier> extends State<T> {
  late final TModel _pageModel = createModel();

  TModel get pageModel {
    return _pageModel;
  }

  @override
  void initState() {
    super.initState();
    _pageModel.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _pageModel.removeListener(_controllerListener);
    super.dispose();
  }

  void _controllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context);

  TModel createModel();
}
