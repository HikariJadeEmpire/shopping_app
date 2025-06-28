import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyComponents.dart';
import 'package:shopping_app/cart_page.dart';

class DetailsPage extends StatefulWidget {

  final Map<String, Object> products;

  const DetailsPage({
    super.key,
    required this.products,
    });

  @override
  State<DetailsPage> createState() { 
    return _DetailsPageState();
  }
}

class _DetailsPageState extends State<DetailsPage> {

  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = true;
  final List<String> idlist = ['s003', 's004', 'c001', 'c002', 'c003', 'g001', 'g004', 'g005'];

  late String selectedSize;

  @override
  void initState() {
    super.initState();

    selectedSize = 'NULL';

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawerScrimColor: Theme.of(context).colorScheme.onSecondary,
      
      body: CustomScrollView(
      slivers : <Widget>[
        
        SliverAppBar(
      
          floating: _floating,
          snap: _snap,
          pinned: _pinned,
      
          centerTitle: false,
          expandedHeight: 380,
          collapsedHeight: 60,
      
          backgroundColor: Colors.transparent,
          surfaceTintColor: Theme.of(context).colorScheme.primary,
      
          leading: Container(
            margin: EdgeInsets.all(6),
            child: IconButton(
              onPressed: () {
                  debugPrint('Back to hompage.');
                  Navigator.pop(context, 0);
                },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: idlist.contains(widget.products['id'].toString())
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.secondary,
                ),
              highlightColor: getColor(ThemeColr.hilightPrimary),
              ),
            ),
          
          actions: [
      
            Container(
              // color: getColor(ThemeColr.hilightSecondary),
              margin: EdgeInsets.only(top: 0, right: 30),
              height: 78,
              width: 56,
              child: Badge(
                offset: Offset(-10, 1),
                label: Text(Provider.of<CartProvider>(context).nCartitems.toString()),
                isLabelVisible: Provider.of<CartProvider>(context).showCartBadge,
                textColor: Theme.of(context).colorScheme.onSecondary,
                backgroundColor: Color.fromRGBO(52, 152, 219, 0.8),
                child: InkWell(
                  
                  radius: 10,
                  borderRadius: BorderRadius.all(Radius.circular(800)),
                
                  // highlightColor: getColor(ThemeColr.hilightPrimary),
                
                  child: IconButton(
                    padding: EdgeInsets.all(2),
                    onPressed: () {
                      debugPrint('Cart.');
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return CartPage();
                                }
                            ),
                          );
                      });
                    },
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: idlist.contains(widget.products['id'].toString())
                        ? Theme.of(context).colorScheme.onSecondary
                        : Theme.of(context).colorScheme.secondary,
                      ),
                    splashRadius: 8,
                  
                    iconSize: 25,
                  
                    highlightColor: getColor(ThemeColr.hilightPrimary),
                    // color: getColor(ThemeColr.secondary),
                  ),
                ),
              )
            ),
      
          ],
      
          flexibleSpace: FlexibleSpaceBar(
            // title: Container(
            //   // color: getColor(ThemeColr.hilightSecondary),
            //   padding: EdgeInsets.all(5.0),
            //   width: 140,
              
            //   child: Text(
            //     products['title'].toString(),
            //     textAlign: TextAlign.start,
            //     style: TextStyle(
            //       fontSize: 19,
            //       fontWeight: FontWeight.bold,
            //       color: idlist.contains(products['id'].toString()) 
            //       ? Theme.of(context).colorScheme.primary
            //       : Theme.of(context).colorScheme.secondary,
            //       ),
            //     ),
            //   ),
      
            background: ClipRRect(
              // borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                widget.products['imgUrl'].toString(),
                fit: BoxFit.cover,
                ),
            ),
      
          ),
        ),
      
        SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
                ////////////////////////////
                ////// START Widgets HERE !!
                ////////////////////////////
                
                Row(
                  children: [
      
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Theme.of(context).colorScheme.onSecondary,
                          padding: EdgeInsets.fromLTRB(30, 36, 30, 5),
                          width: 210,
                          
                          child: Text(
                            widget.products['title'].toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        
                        Container(
                          // color: Theme.of(context).colorScheme.onSecondary,
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 30),
                          
                          child: Text(
                            'THB ${widget.products['price']}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              // color: Theme.of(context).colorScheme.onSecondary,
                              foreground: Paint()..shader = LinearGradient(
                                  colors: <Color>[Color.fromRGBO(242, 230, 238, 1), Color.fromRGBO(151, 125, 255, 1)],
                                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 36.0))
                              ),
                            ),
                          ),
                      ],
                    ),
      
                    Container(
                      // color: getColor(ThemeColr.hilightPrimary),
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: IconButton(
                              onPressed: () {
                                if (selectedSize != 'NULL') {
                                  if (oncart.isNotEmpty) {
                                  bool isInCart = false;
                                  for (int iCart = 0; iCart < oncart.length; iCart++) {
                                    if (widget.products['id'] == oncart[iCart]['product_id'] 
                                    && selectedSize == oncart[iCart]['selectedSize']) {
                                      
                                      oncart[iCart]['amount']++;
                                      isInCart = true;
                                      break;
                                      }
                                    }
                                  if (isInCart == false) {
                                    oncart.add({
                                      'product_id': widget.products['id'],
                                      'product': widget.products,
                                      'selectedSize': selectedSize,
                                      'isChecked': false,
                                      'amount': 1,
                                      'sumprice': widget.products['price'],
                                    });
                                  }

                                  } else {
                                    oncart.add({
                                      'product_id': widget.products['id'],
                                      'product': widget.products,
                                      'selectedSize': selectedSize,
                                      'isChecked': false,
                                      'amount': 1,
                                      'sumprice': widget.products['price'],
                                    });
                                  }
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      elevation: 0,
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      
                                      showCloseIcon: true,
                                      closeIconColor: Theme.of(context).colorScheme.onPrimary,
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Text(
                                          'The item has been added',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).colorScheme.onPrimary,
                                          ),
                                          ),
                                      ),
                                      duration: const Duration(seconds: 1),
                                      
                                      width: 300.0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 10,
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                  );

                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      elevation: 0,
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      
                                      showCloseIcon: true,
                                      closeIconColor: Theme.of(context).colorScheme.onPrimary,
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Text(
                                          'Please, select the size',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).colorScheme.onPrimary,
                                          ),
                                          ),
                                      ),
                                      duration: const Duration(seconds: 1),
                                      
                                      width: 300.0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 10,
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                  );
                                }
                                
                                Provider.of<CartProvider>(context, listen: false).updateCartIcon();
                                // debugPrint('$oncart');
                                },
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              highlightColor: getColor(ThemeColr.hilightPrimary),
                              ),
                            ),
                          Container(
                            // color: Theme.of(context).colorScheme.onSecondary,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                            width: 140,
                            
                            child: Text(
                              'Add to cart',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ),
                          
                        ],
                      ),
                    ),
      
                  ],
                ),
                
                Container(
                  
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
      
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
      
                      SizedBox(
                        width: 30,
                        child: Text(
                          'SIZE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        )
                      ),
      
                      SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.height,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
      
                      SizedBox(
                        width: 240,
                        child: ListView.builder(
      
                          itemCount: (widget.products['size']! as List).length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(4),
      
                          itemBuilder: (context, index) {
      
                            final String size = (widget.products['size']! as List)[index].toString();
      
                            return Padding(
                              padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                  debugPrint('size: $size selected');
                                },
                                child: Chip(
                                  // backgroundColor: Theme.of(context).colorScheme.secondary,
                                  backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                  side: BorderSide(
                                    color: getColor(ThemeColr.hilightSecondary),
                                    width: 0.8,
                                  ),
                                  label: Text(
                                    size,
                                    style: TextStyle(
                                      fontSize: 14,
                                      // color: Theme.of(context).colorScheme.primary,
                                      color: selectedSize == size
                                        ? Theme.of(context).colorScheme.secondary
                                        : Theme.of(context).colorScheme.onSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
                      ),
      
                    ],
                  ),
                ),
      
                Container(
                  // color: Theme.of(context).colorScheme.onSecondary,
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                  
                  child: Text(
                    widget.products['desc'].toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSecondary,
                      ),
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