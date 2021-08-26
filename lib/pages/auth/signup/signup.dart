import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nabed_test/config/size_config.dart';
import 'package:nabed_test/config/validators.dart';
import 'package:nabed_test/pages/auth/bloc/auth_bloc.dart';
import 'package:nabed_test/pages/auth/bloc/auth_event.dart';
import 'package:nabed_test/pages/auth/login/login.dart';
import 'package:nabed_test/pages/common_widgets/nabed_gradiantText.dart';
import 'package:nabed_test/pages/common_widgets/nabed_textfield.dart';
import 'package:nabed_test/pages/home/home.dart';

import '../../../injectoin.dart';
import '../bloc/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _bloc = sl<AuthBloc>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, //ne
        body: BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, AuthState state) {
            if (state.success) {
              WidgetsBinding.instance!.addPostFrameCallback((_) =>
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())));
            } else if (state.error == "Something went wrong") {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                ));
              });
            }
            return SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal! * 6),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical! * 6),
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical! * 6),
                          child: NabedTextField(
                            context: context,
                            hintText: 'Email',
                            validator: (value) {
                              return emailValidator(email: value ?? '');
                            },
                            textEditingController: _userNameController,
                          ),
                        ),
                        NabedTextField(
                          useObscure: true,
                          context: context,
                          hintText: 'Password',
                          validator: (value) {
                            return passwordValidator(password: value ?? '');
                          },
                          textEditingController: _passwordController,
                          isSuffixIcon: true,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical! * 6),
                          child: NabedTextField(
                            useObscure: true,
                            context: context,
                            hintText: 'Confirm password',
                            validator: (value) {
                              return confirmPasswordValidator(
                                  confirmPassword: value ?? '',
                                  password: _passwordController.text);
                            },
                            textEditingController: _confirmPasswordController,
                            isSuffixIcon: true,
                          ),
                        ),
                        NabedGradientButton(
                          text: 'SignUp',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              print(_userNameController.text);
                              print(_passwordController.text);
                              _bloc.add(Register((b) => b
                                ..email = _userNameController.text
                                ..password = _passwordController.text));
                            }
                          },
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ); // w line
          },
        ));
  }
}
