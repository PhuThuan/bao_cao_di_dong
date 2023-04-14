import 'package:bao_cao_cuoi_ki/consts/theme_data.dart';
import 'package:bao_cao_cuoi_ki/inner_screens/feeds_screen.dart';
import 'package:bao_cao_cuoi_ki/inner_screens/on_sale_screen.dart';
import 'package:bao_cao_cuoi_ki/login/login_page.dart';
import 'package:bao_cao_cuoi_ki/login/siginup_page.dart';
import 'package:bao_cao_cuoi_ki/provider/dart_theme_provider.dart';
import 'package:bao_cao_cuoi_ki/screens/btm_bar.dart';
import 'package:bao_cao_cuoi_ki/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bool _isDark = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (index, sncpshot) {
                if (sncpshot.hasData) {
                  return BottomBarScreen();
                }
                return LoginPage();
              }),
          routes: {
            OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            FeedsScreen.routeName: (context) => const FeedsScreen(),
            SiginUpPage.routeName: (context) => const SiginUpPage(),
            LoginPage.routeName: (context) => LoginPage(),
          },
        );
      }),
    );
  }
}
