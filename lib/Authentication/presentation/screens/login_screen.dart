import 'package:ecommerce_app/App/presentation/components/password_text_field.dart';
import 'package:ecommerce_app/App/presentation/components/snackbar_message.dart';
import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';
import 'package:ecommerce_app/Authentication/presentation/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
                      height: 10,
                    ),
                    PasswordTextField(
                      controller: passwordController,
                    ),
                    const SizedBox(height: 25),
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
                          SnackbarMessage().showSuccessSnackBar(
                            context: context,
                            message: "تم تسجيل الدخول بنجاح",
                          );
                        }
                      },
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
