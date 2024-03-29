import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_momentum_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_momentum_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_momentum_app/screens/authentication/sign_in_screen.dart';
import 'package:flutter_momentum_app/screens/authentication/sign_up_screen.dart';

import '../../blocs/sign_up_bloc/sign_up_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            width: 190,
            height: 190,
            child: Image.asset('assets/logo.png'),
          ),
          TabBar(
            controller: tabController,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
            // labelColor: Theme.of(context).colorScheme.onBackground,
            indicator: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 0.0)),
            ),
            tabs: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                BlocProvider<SignInBloc>(
                  create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                  child: const SignInScreen(),
                ),
                BlocProvider<SignUpBloc>(
                  create: (context) => SignUpBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                  child: const SignUpScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
