import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/pages/application/application_page.dart';
import 'package:ulerning_app/pages/register/register.dart';
import 'package:ulerning_app/pages/sign_in/sing_in.dart';
import 'package:ulerning_app/routes/routes2.dart';
import 'package:ulerning_app/shared_preferences/global.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDSWNcywlC1srrw6PZAvKS2_M01fo9kVZQ",
          appId: "com.ghayratsamiev.ulerning_app",
          messagingSenderId: "638514424931",
          projectId: "ulearning-app-2e72"),
    );
    FirebaseDatabase.instance.setPersistenceEnabled(true);
  } catch (e) {
    print('Errpr is $e');
  }
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ApplicationPage(),
          onGenerateRoute: AppPages.generateRouteSettings,
          routes: {
            "/myHomePage": (context) => MyHomePage(),
            "/sign_in": (context) => SignIn(),
            "/register": (context) => RegistrationPage(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
    );
  }
}
