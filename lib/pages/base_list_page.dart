import 'package:flutter/material.dart';

abstract class BaseListPage<T, ControllerType> extends StatefulWidget {
  final String title;
  final ControllerType controller;

  const BaseListPage({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);
}

abstract class BaseListPageState<T extends BaseListPage,
    ControllerType extends ChangeNotifier> extends State<T> {
  late final String _title;
  late final ControllerType _controller;

  ControllerType get controller {
    return _controller;
  }

  String get title {
    return _title;
  }

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _controller = widget.controller;
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
        title: Text(_title),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context);
}
