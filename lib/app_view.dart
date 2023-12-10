import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_momentum_app/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutter_momentum_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_momentum_app/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:flutter_momentum_app/screens/authentication/welcome_screen.dart';

import 'blocs/authentication_bloc/authentication_bloc.dart';
import 'screens/home/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Momentum App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Color.fromARGB(52, 52, 52, 1),
          onBackground: Colors.white,
          primary: Color.fromRGBO(222, 181, 6, 1),
          onPrimary: Colors.white,
          secondary: Color.fromRGBO(248, 207, 28, 1),
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255, 204, 128, 1),
          error: Colors.red,
          outline: Color(0xFF424242),
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
              ),
              BlocProvider(
                create: (context) => UpdateUserInfoBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
              ),
              BlocProvider(
                create: (context) => MyUserBloc(
                  myUserRepository:
                      context.read<AuthenticationBloc>().userRepository,
                )..add(
                    GetMyUser(
                      myUserId:
                          context.read<AuthenticationBloc>().state.user!.uid,
                    ),
                  ),
              ),
            ],
            child: const HomeScreen(),
          );
        } else {
          return const WelcomeScreen();
        }
      }),
    );
  }
}
