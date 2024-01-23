import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/home/presentation/controllers/home_controller.dart';
import 'package:investapp/modules/home/presentation/widgets/home_option_button.dart';
import 'package:investapp/shared/shared.dart';

final class HomeScreen extends BaseScreen<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget builder() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics()
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "O que \ndeseja acessar \nagora...",
            style: theme.textTheme.titleMedium,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: HomeOptionButton(
              icon: Icons.BUSINESS_TIME_SOLID,
              title: "Ações",
              description: "Acompanhe em tempo real o preço de ações.",
              onPressed: () {},
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: HomeOptionButton(
              icon: Icons.BITCOIN,
              title: "Criptomoedas",
              description: "Acompanhe em tempo real o preço de criptomoedas.",
              onPressed: () {},
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: HomeOptionButton(
              icon: Icons.COINS_SOLID,
              title: "Moedas",
              description: "Acompanhe em tempo real o preço de moedas de outros países.",
              onPressed: () {},
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: HomeOptionButton(
              icon: Icons.HAND_HOLDING_DOLLAR_SOLID,
              title: "Inflação",
              description: "Acompanhe em tempo real o valor da inflação.",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
