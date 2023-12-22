import 'package:flutter/material.dart';

abstract class BaseListPage<T, TModel> extends StatefulWidget {
  final String title;

  const BaseListPage({
    Key? key,
    required this.title,
  }) : super(key: key);
}

abstract class BaseListPageState<T extends BaseListPage,
    TController extends ChangeNotifier> extends State<T> {
  late final TController _controller = createController();

  TController get controller {
    return _controller;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerListener);
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

  TController createController();
}
