import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipely/application/login/login_bloc.dart';
import 'package:recipely/infrastructure/di/injectable.dart';
import 'package:recipely/infrastructure/services/navigation_service.dart';
import 'package:recipely/shared/extensions/media_query.dart';
import 'package:recipely/shared/extensions/number_extensions.dart';
import 'package:recipely/shared/global.dart';
import 'package:recipely/shared/widgets/app_button_widget.dart';
import 'package:recipely/shared/widgets/standard_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            60.verticalGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (BuildContext context, LoginState state) {
                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                  } else if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login success')),
                    );
                    getIt<NavigationService>().replaceWithNamed(
                      context: context,
                      uri: NavigationService.searchRouteUri,
                    );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          30.verticalGap,
                          StandardTextField(
                            controller: email,
                            key: const Key('loginForm_email'),
                            inputFormatter: [NoLeadingSpaceFormatter()],
                            inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            hintText: 'Enter Email Address',
                            validator: validateEmail,
                          ),
                          10.verticalGap,
                          StandardTextField(
                            controller: password,
                            obscureText: true,
                            inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            inputFormatter: [NoLeadingSpaceFormatter()],
                            key: const Key('loginForm_passwordInput_textField'),
                            hintText: 'Enter password',
                            textInputAction: TextInputAction.done,
                            validator:
                                context.read<LoginBloc>().validatePassword,
                          ),
                          36.verticalSpace,
                          IgnorePointer(
                            ignoring: state is LoggingIn,
                            child: AppButton(
                              width: context.width,
                              key: const Key('login_button'),
                              isLoading: state is LoggingIn,
                              color: Colors.black,
                              radius: 10,
                              onPressed: () {
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  context.read<LoginBloc>().add(
                                        LoginSubmitted(
                                          password: password.text,
                                          email: email.text,
                                        ),
                                      );
                                }
                              },
                              text: 'Login',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
