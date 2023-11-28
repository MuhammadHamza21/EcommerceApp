import 'package:ecommerce_app/App/presentation/controller/app_cubit.dart';
import 'package:ecommerce_app/App/presentation/layout/home_layout.dart';
import 'package:ecommerce_app/Authentication/presentation/components/divider_widget.dart';
import 'package:ecommerce_app/Authentication/presentation/components/password_text_field.dart';
import 'package:ecommerce_app/App/presentation/components/snackbar_message.dart';
import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';
import 'package:ecommerce_app/Authentication/presentation/components/signin_button.dart';
import 'package:ecommerce_app/Authentication/presentation/controller/auth_cubit.dart';
import 'package:ecommerce_app/Core/utils/methods/navigate_and_finish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(
                        "assets/images/cart_blue.png",
                      ),
                      height: 130,
                    ),
                    const Text(
                      "مرحبا بعودتك",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "اسم المستخدم",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.username],
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "يجب كتابة اسم المستخدم";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PasswordTextField(
                      controller: passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("نسيت كلمة المرور؟"),
                        ),
                      ],
                    ),
                    BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus!.unfocus();
                                  await AuthenticationCubit.get(context).login(
                                    LoginParams(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "تسجيل الدخول",
                              ),
                            ),
                          );
                        }
                      },
                      listener: (context, state) {
                        final authCubit = AuthenticationCubit.get(context);
                        if (state is LoginErrorState ||
                            state is LoginOfflineState) {
                          SnackbarMessage().showErrorSnackBar(
                              context: context,
                              message: authCubit.loginMessage);
                        } else if (state is LoginSuccessState) {
                          final appCubit = AppCubit.get(context);
                          final authCubit = AuthenticationCubit.get(context);
                          SnackbarMessage().showSuccessSnackBar(
                            context: context,
                            message: "تم تسجيل الدخول بنجاح",
                          );
                          appCubit.changeCurrentIndex(0);
                          appCubit.saveAccessToken(
                              authCubit.loginUser!.data.accessToken);
                          appCubit.saveRefreshToken(
                              authCubit.loginUser!.data.refreshToken);
                          navigateAndFinish(
                            context,
                            const HomeLayout(),
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("انشاء حساب"),
                        ),
                        const Text(
                          "ليس لديك حساب ؟",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DividerWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "او",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DividerWidget()
                      ],
                    ),
                    const SizedBox(height: 10),
                    SignInButton(
                      icon: FontAwesomeIcons.google,
                      title: "تسجيل الدخول باستخدام جوجل",
                      onPressed: () {},
                      backgroundColor: Colors.red,
                    ),
                    SignInButton(
                      icon: FontAwesomeIcons.facebook,
                      title: "تسجيل الدخول باستخدام فيسبوك",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
