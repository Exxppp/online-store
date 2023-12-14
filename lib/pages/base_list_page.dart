import 'package:flutter/material.dart';

class BaseListPage<T> extends StatefulWidget {
  final String title;
  final ChangeNotifier controller;

  const BaseListPage({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  BaseListPageState createState() => BaseListPageState();
}

class BaseListPageState<T extends BaseListPage> extends State<T> {
  late ChangeNotifier _controller;
  late String _title;

  get controller {
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
      body: body(),
    );
  }

  Widget body() {
    return Container();
  }
}
