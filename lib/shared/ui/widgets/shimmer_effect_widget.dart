import 'package:investapp/shared/base/base.dart';
import 'package:shimmer/shimmer.dart';

final class ShimmerEffectWidget extends BaseWidget {
  final Widget child;
  const ShimmerEffectWidget({super.key, required this.child});

  @override
  Widget builder(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey,
          Colors.white,
          Colors.grey,
        ],
      ),
      child: child,
    );
  }
}