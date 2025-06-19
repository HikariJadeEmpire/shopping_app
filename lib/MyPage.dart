import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'MyComponents.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() {
    return _ShoppingAppState();
  }
}

class _ShoppingAppState extends State<ShoppingApp> {

  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = true;

  @override
  void initState() {
    super.initState();
    getApi();
  }

  Future getApi() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: getColor(ThemeColr.primary),
      
      body:  
        FutureBuilder(
          future: getApi(),
          builder: (context, asyncSnapshot) {

            debugPrint('${asyncSnapshot.connectionState}');

            if (asyncSnapshot.hasError) {
              return Center(
                child: Text(asyncSnapshot.error.toString()),
              );
            }

            return CustomScrollView(
            slivers : <Widget>[
              
              SliverAppBar(
            
                floating: _floating,
                snap: _snap,
                pinned: _pinned,
            
                centerTitle: false,
                expandedHeight: 100,
                collapsedHeight: 70,
            
                backgroundColor: getColor(ThemeColr.primary),
                
                actions: [
            
                  Container(
                    // color: getColor(ThemeColr.hilightSecondary),
                    margin: EdgeInsets.only(top: 0, right: 30),
                    height: 78,
                    width: 56,
                    child: InkWell(
                      
                      radius: 10,
                      borderRadius: BorderRadius.all(Radius.circular(800)),
                    
                      highlightColor: getColor(ThemeColr.hilightPrimary),
                    
                      child: IconButton(
                        padding: EdgeInsets.all(2),
                        onPressed: () {
                          debugPrint('cart.');
                        },
                        icon: Icon(Icons.search_rounded),
                        splashRadius: 8,
                      
                        iconSize: 25,
                      
                        highlightColor: getColor(ThemeColr.hilightPrimary),
                        color: getColor(ThemeColr.secondary),
                      ),
                    ),
                  ),
            
                ],
              
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    // color: getColor(ThemeColr.secondary),
                    padding: EdgeInsets.all(5.0),
                    width: 140,
                    
                    child: Text(
                      'SHOP\nDEMO',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.inconsolata(
                        fontSize: 19,
                        color: getColor(ThemeColr.secondary),
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            
                // background: FlutterLogo(),
            
                ),
              ),
            
              SliverToBoxAdapter(
                  child: Column(
                    children: [

                      ////////////////////////////
                      ////// START Widgets HERE !!
                      ////////////////////////////
                      
                      Container(
                        color: getColor(ThemeColr.hilightSecondary),
                        height: 60,
                        width: 350,
                      ),

                    ]
                    
                )
              )


            ],
          );
        }
      )
    );

  }
}