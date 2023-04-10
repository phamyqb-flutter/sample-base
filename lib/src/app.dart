import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'misc/routes.dart';
import 'misc/environment.dart';

Future<void> mainEnv(Environment? env) async {
  WidgetsFlutterBinding.ensureInitialized();
  String envPath = getEnvPath(env);
  /* Load env based on configuration */
  await dotenv.load(fileName: envPath);
  runApp(Provider.value(value: env ?? Environment.dev, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Environment env = Provider.of<Environment>(context);
    return GetMaterialApp(
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: env == Environment.dev,
      builder: (context, child) => Stack(
        children: [child!],
      ),
      getPages: RouteNavigator.screens,
      initialRoute: Screen.home.route,
      // localizationsDelegates: [
      //   FormBuilderLocalizations.delegate,
      // ],
    );
  }
}
