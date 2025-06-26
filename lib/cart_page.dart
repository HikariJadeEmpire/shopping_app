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
      
                CartItem(
                  cartItem: getCartItem(0),
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