import 'package:flutter/material.dart';
import 'MyComponents.dart';

class CartPage extends StatefulWidget {

  const CartPage({
    super.key,
    });

  @override
  State<CartPage> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {

  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.primary,
      drawerScrimColor: Theme.of(context).colorScheme.onPrimary,
      
      body: CustomScrollView(
      slivers : <Widget>[
        
        SliverAppBar(
      
          floating: _floating,
          snap: _snap,
          pinned: _pinned,
      
          centerTitle: false,
          expandedHeight: 100,
          collapsedHeight: 70,
      
          backgroundColor: Theme.of(context).colorScheme.primary,
          surfaceTintColor: Theme.of(context).colorScheme.primary,
      
          leading: Container(
            margin: EdgeInsets.all(6),
            child: IconButton(
              onPressed: () {
                  Navigator.of(context).pop();
                },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
                ),
              highlightColor: getColor(ThemeColr.hilightPrimary),
              ),
            ),
          
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              // color: getColor(ThemeColr.hilightSecondary),
              padding: EdgeInsets.all(5.0),
              width: 140,
              
              child: Text(
                'YOUR\nCART',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
          // background: FlutterLogo(),
      
          ),
        ),
      
        SliverToBoxAdapter(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
      
                ////////////////////////////
                ////// START Widgets HERE !!
                ////////////////////////////
      
                Container(
                  color: getColor(ThemeColr.hilightSecondary),
                  height: 180,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    children: [

                      Container(
                        color: getColor(ThemeColr.hilightSecondary),
                        height: 34,
                        width: 34,
                        margin: EdgeInsets.all(5),
                      ),
                      Container(
                        padding: EdgeInsets.all(14),
                        width: 130,
                        child: GestureDetector(
                          onTap: () {
                            // TODO : get product page
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              productDetails[9]['imgUrl'],
                              fit: BoxFit.cover,
                              ),
                          ),
                        ),
                      ),
                      Container(
                        // color: getColor(ThemeColr.hilightSecondary),
                        height: 120,
                        width: 120,
                        margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 6,
                          children: [

                            Text(
                              productDetails[9]['title'],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            Text(
                              'THB ${productDetails[9]['price']}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                foreground: Paint()..shader = LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(99, 229, 197, 1), 
                                      Color.fromRGBO(20, 54, 111, 1)
                                      ],
                                  ).createShader(Rect.fromLTWH(0.0, 0.0, 108.0, 18.0))
                                ),
                              ),

                            Row(
                              children: [

                                SizedBox(
                                  width: 40,
                                  height: 34,
                                  child: Placeholder(),
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 30,
                                  child: Placeholder(),
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 34,
                                  child: Placeholder(),
                                ),
                                
                              ],
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
      
              ]
              
          )
        )
      
      
      ],
                  ),

    bottomNavigationBar: Container(
      color: Theme.of(context).colorScheme.secondary,
      height: 100,
      child: Column(
        children: [

          // Container(

          //   margin: EdgeInsets.all(4),
          //   height: 24,
            
          //   child: BottomInfo(pcolr: primaryColr, scolr: secondColr, shcolr: platinumHlColr, textLong: aboutText),
          //   ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Container(
          
                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                padding: EdgeInsets.all(8),
          
                width: 160,
          
                child: Text(
                  'Designed by\nHikariJadeEmpire',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
          
              ),
            ],
          ),
        ],
      ),
    ),

    );
  }
}