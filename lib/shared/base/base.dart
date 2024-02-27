import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/shared/ui/widgets/default_appbar_widget.dart';

export "package:flutter/material.dart";

part 'base_app.dart';

abstract base class BaseScreen<T extends Object> extends BaseApp<T> {
  const BaseScreen({super.key});

  PreferredSizeWidget? get appBar => const DefaultPreferredSizeWidget(child: DefaultAppBarWidget());

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  @override
  void initState() {
    widget.initState();
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: widget.appBar,
        body: widget.builder(context),
      ),
    );
  }
}

abstract base class BaseWidget<T extends Object> extends BaseApp<T> {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {

  @override
  void initState() {
    widget.initState();
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
