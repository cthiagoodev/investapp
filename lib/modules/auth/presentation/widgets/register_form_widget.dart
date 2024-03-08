import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/auth/presentation/view_model/register_view_model.dart';
import 'package:investapp/shared/shared.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

final class RegisterFormWidget extends BaseWidget<RegisterViewModel> {
  const RegisterFormWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe seu nome",
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe seu e-mail",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Confirme seu e-mail",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe sua senha",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Confirme sua senha",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
          ),

          MultiValueListenableBuilder(
            valueListenables: [
              controller.formIsValid,
              controller.isSending,
            ],
            builder: (context, values, child) {
              bool formIsValid = values[0];
              bool isSending = values[1];
              return ButtonLoadingWidget(
                text: "Criar conta",
                enable: formIsValid && !isSending,
                onPressed: () => controller.register(() {
                  Navigator.of(context).pop();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}