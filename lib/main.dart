import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/MyPage.dart';
import 'MyComponents.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // BuildContext is to tell the Flutter how widget tree is structed

    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DMO Shop',
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light, 
            primary: Color.fromRGBO(255, 255, 255, 1), 
            onPrimary: Color.fromRGBO(28, 38, 40, 1), 
            secondary: Color.fromRGBO(28, 38, 40, 1), 
            onSecondary: Color.fromRGBO(254, 250, 224, 1), 
            onSecondaryContainer: Color.fromRGBO(28, 38, 40, 0.6),
            error: Color.fromRGBO(159, 184, 184, 1), 
            onError: Color.fromRGBO(28, 38, 40, 1), 
            surface: Color.fromRGBO(255, 255, 255, 1), 
            onSurface: Color.fromRGBO(28, 38, 40, 1),
            surfaceTint: Color.fromRGBO(235, 235, 233, 0.2),
            ),
          fontFamily: 'Inconsolata',
        ),
        home: ShoppingApp(),
      ),
    );
  }
}