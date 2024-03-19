import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/shared/ui/widgets/default_appbar_widget.dart';

export "package:flutter/material.dart";

part 'base_app.dart';

abstract base class BaseView<T extends Object> extends BaseApp<T> {
  const BaseView({super.key});

  PreferredSizeWidget? get appBar => const DefaultPreferredSizeWidget(child: DefaultAppBarWidget());

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {

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
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: MediaQuery(
        data: const MediaQueryData(textScaler: TextScaler.linear(1.0)),
        child: Scaffold(
          appBar: widget.appBar,
          resizeToAvoidBottomInset: true,
          body: widget.builder(context),
        ),
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
