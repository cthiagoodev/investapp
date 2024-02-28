import 'package:investapp/shared/base/base.dart';

final class ErrorWidget extends BaseWidget {
  final String _error;
  const ErrorWidget(this._error, {super.key});

  @override
  Widget builder(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Expanded(
      child: Center(
        child: Text(
          _error,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelSmall,
        ),
      ),
    );
  }
}