import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/authentication_cubit.dart';
import 'package:toefl_app/domain/state/user_cubit.dart';
import 'package:toefl_app/presentation/screens/history_screen.dart';
import 'package:toefl_app/presentation/screens/home_screen.dart';
import 'package:toefl_app/presentation/screens/login_screen.dart';
import 'package:toefl_app/presentation/screens/result_screen.dart';
import 'package:toefl_app/utils/supabase_env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supabase = await Supabase.initialize(
    url: SupabaseEnv.url,
    anonKey: SupabaseEnv.anonKey,
  );

  runApp(
    MyApp(
      supabaseClient: supabase.client,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.supabaseClient,
  });

  final SupabaseClient supabaseClient;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(supabaseClient),
        ),
        BlocProvider(
          create: (context) => UserCubit(supabaseClient)..getSession(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: supabaseClient.auth.currentSession == null
            ? const LoginScreen()
            : const HomeScreen(),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}
