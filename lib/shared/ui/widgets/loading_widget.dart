import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/shared/base/base.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final class LoadingWidget extends BaseWidget {
  const LoadingWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: LoadingAnimationWidget.twoRotatingArc(
              color: theme.colorScheme.primary,
              size: 15.r,
            ),
          ),
          Text(
            "Aguarde...",
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}