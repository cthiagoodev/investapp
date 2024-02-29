import 'package:investapp/shared/base/base.dart';
import 'package:investapp/shared/ui/widgets/button_widget.dart';
import 'package:investapp/shared/ui/widgets/shimmer_effect_widget.dart';

final class ButtonLoadingWidget extends BaseWidget {
  final bool isLoading;
  final String text;
  final bool enable;
  final void Function() onPressed;


  const ButtonLoadingWidget({
    this.isLoading = false,
    required this.text,
    required this.onPressed,
    this.enable = true,
    super.key,
  });

  @override
  Widget builder(BuildContext context) {
    if(isLoading) {
      return ShimmerEffectWidget(
        child: ButtonWidget(
          text: "",
          enable: false,
          onPressed: () {},
        ),
      );
    }

    return ButtonWidget(
      text: text,
      enable: enable,
      onPressed: onPressed,
    );
  }
}