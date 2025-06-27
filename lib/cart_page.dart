import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              children: getCart(
                context, 
                oncart,
                ),
              
          )
        )
      
      
      ],
                  ),

    bottomNavigationBar: Container(
      color: Theme.of(context).colorScheme.secondary,
      height: 230,
      child: Column(
        children: [

          Container(

            margin: EdgeInsets.all(6),
            height: 110,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                  width: 165,
                  padding: EdgeInsets.fromLTRB(30, 10, 5, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
          
                      Text(
                        'TOTAL',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      
                      Text(
                        'THB ${Provider.of<CartProvider>(context).totprice}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
        
                      ],
                    ),
                  ),
                
                Container(
                  margin: EdgeInsets.all(0),
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                        clearCart();
                        Provider.of<CartProvider>(context, listen: false).updatetot();
                      },
                    icon: Icon(
                      Icons.change_circle,
                      color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    highlightColor: getColor(ThemeColr.hilightSecondary),
                    ),
                  ),

                Container(
                  // color: Theme.of(context).colorScheme.onSecondary,
                  padding: EdgeInsets.fromLTRB(0, 10, 40, 10),
                  width: 140,
                  child: GestureDetector(
                    onTap: () {
                      
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 0,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            
                            showCloseIcon: true,
                            closeIconColor: Theme.of(context).colorScheme.onSecondary,
                            content: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                Provider.of<CartProvider>(context, listen: false).totprice == 0.00
                                ? 'You haven\'t selected any items of your cart.'
                                : 'The DEMO has ended here. Thanks for trying',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                                ),
                            ),
                            duration: const Duration(seconds: 2),
                            
                            width: 300.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10,
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                          ),
                        );
                      
                    },
                    child: Chip(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      side: BorderSide(
                        color: getColor(ThemeColr.hilightSecondary),
                        width: 0.8,
                      ),
                      label: Text(
                        'Purchase',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          
        ],
      ),
    ),

    );
  }
}