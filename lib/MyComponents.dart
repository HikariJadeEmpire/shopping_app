import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DetailPage.dart';

class CartProvider extends ChangeNotifier {
  double totprice = gettotal();

  bool showCartBadge = getNonCart()[1];
  int nCartitems = getNonCart()[0];

  void updateCartIcon() {
    showCartBadge = getNonCart()[1];
    nCartitems = getNonCart()[0];
    notifyListeners();
  }

  void updatetot() {
    totprice = gettotal();
    notifyListeners();
  }
}

enum ThemeColr {
  hilightPrimary,
  hilightSecondary,
  }

Color getColor(enumthemeColr) {
    switch (enumthemeColr) {
      case ThemeColr.hilightPrimary: {
        return Color.fromRGBO(235, 235, 233, 0.2);
      }
      case ThemeColr.hilightSecondary: {
        return Color.fromRGBO(121, 121, 121, 0.2);
      }
      default: {
        return Color.fromRGBO(255, 255, 255, 1);
      }
    }
}

List<Widget> getRelevantProd(context, String filter, List allproduct) {

  List matchList = [];
  for (int ll = 0; ll < allproduct.length; ll++) {
    List item = allproduct[ll]['label'];
    for (int alllabel = 0; alllabel < item.length; alllabel++) {
      String labelinside = allproduct[ll]['label'][alllabel];
      if (labelinside == filter) {
        matchList.add(allproduct[ll]);
        break;
      }
    }
    
  }
  return List<CarouselItem>.generate(matchList.length, (int index) {
    return 
      CarouselItem(
        imgs: matchList[index]['imgUrl'],
        itemname: matchList[index]['title'],
        itemPrice: matchList[index]['price'],
        voidFunc: () {

          debugPrint('${matchList[index]['title']} clicked');
          int n = 0;
          for (int findIndex = 0; findIndex < productDetails.length; findIndex++) {
                  if (productDetails[findIndex]['id'] == matchList[index]['id']) {
                    n = findIndex;
                    break;
                  }
                }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailsPage(
                  products: productDetails[n],
                  );
                }
            ),
          );
          
          },
        );
    }
  );

}

List<String> categories = ['All', 'Cap', 'Glasses', 'Shoes'];

List productDetails = [
  {
    'id':'s001',
    'label':['Shoes', 'All'],
    'title':'Cloud walker',
    'price': 1400.0,
    'size': [for (double i=6; i<15; i+=0.5) i],
    'imgUrl':'assets/images/shoes.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'s002',
    'label':['Shoes', 'All'],
    'title':'Soft slipper',
    'price': 1100.0,
    'size': [for (double i=6; i<15; i+=0.5) i],
    'imgUrl':'assets/images/shoes1.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'s003',
    'label':['Shoes', 'All'],
    'title':'Springers slip',
    'price': 900.0,
    'size': [for (double i=6; i<15; i+=0.5) i],
    'imgUrl':'assets/images/shoes2.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'s004',
    'label':['Shoes', 'All'],
    'title':'WILD Soft slipper',
    'price': 800.0,
    'size': [for (double i=6; i<15; i+=0.5) i],
    'imgUrl':'assets/images/shoes3.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },

  {
    'id':'c001',
    'label':['Cap', 'All'],
    'title':'Cold x Wind x UV protection hat',
    'price': 1600.0,
    'size': ['S', 'M', 'L', 'XL'],
    'imgUrl':'assets/images/cap.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'c002',
    'label':['Cap', 'All'],
    'title':'Hot x UV protection hat',
    'price': 1000.0,
    'size': ['S', 'M', 'L', 'XL'],
    'imgUrl':'assets/images/cap1.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'c003',
    'label':['Cap', 'All'],
    'title':'Super speed hat',
    'price': 700.0,
    'size': ['S', 'M', 'L', 'XL'],
    'imgUrl':'assets/images/cap2.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'c004',
    'label':['Cap', 'All'],
    'title':'Heat & Glare protection cap',
    'price': 700.0,
    'size': ['S', 'M', 'L', 'XL'],
    'imgUrl':'assets/images/cap3.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },

  {
    'id':'g001',
    'label':['Glasses', 'All'],
    'title':'Un-Functional UV protection glasses',
    'price': 200.0,
    'size': ['One-sized'],
    'imgUrl':'assets/images/glasses.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'g002',
    'label':['Glasses', 'All'],
    'title':'Intel GAINER Glasses',
    'price': 3500.0,
    'size': ['S', 'M', 'L'],
    'imgUrl':'assets/images/glasses1.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'g003',
    'label':['Glasses', 'All'],
    'title':'SOFT Winter protection glasses',
    'price': 850.0,
    'size': ['S', 'M', 'L'],
    'imgUrl':'assets/images/glasses2.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'g004',
    'label':['Glasses', 'All'],
    'title':'DIRT x UV Protection glasses',
    'price': 750.0,
    'size': ['S', 'M', 'L'],
    'imgUrl':'assets/images/glasses3.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
  },
  {
    'id':'g005',
    'label':['Glasses', 'All'],
    'title':'UV Protection glasses (LIGHT)',
    'price': 600.0,
    'size': ['S', 'M', 'L'],
    'imgUrl':'assets/images/glasses4.jpg',
    'desc':'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  },
];

double gettotal() {
    double totprice = 0.00; 
    if (oncart.isNotEmpty) {
      for (int i = 0; i < oncart.length; i++) {
        if (oncart[i]['isChecked'] == true) {
          totprice += (oncart[i]['product']['price'] * oncart[i]['amount']);
        }
      }
      return totprice;
    } else {
      return totprice;
    }
  }

void clearCart() {
  if (oncart.isNotEmpty) {
      for (int i = 0; i < oncart.length; i++) {
        if (oncart[i]['isChecked'] == true) {
          oncart[i]['isChecked'] = false;
        }
      }
  }
}

List oncart = [];

List getNonCart() {
  if (oncart.isNotEmpty) {
    return [oncart.length, true];
  }
  else {
    return [0, false];
  }
}

Map getCartItem(n) {
  if (oncart.isNotEmpty) {
    return oncart[n];
  }
  else {
    return {
      'product_id': null,
      'product': 'Your cart \nis \nempty',
      'selectedSize': null,
      'isChecked': false,
      'amount': 0,
      'sumprice':0.00,
    };
  }
}

List<Widget> getCart(context, List cart) {

  if (getNonCart()[0] == 0) {
    return [CartItem(
      cartItem: getCartItem(0),
    )];
  } else {
    return List<Dismissible>.generate(cart.length, (int index) {
      return Dismissible(
        background: Container(color: Theme.of(context).colorScheme.secondary),
        onDismissed: (direction) {

          oncart.remove(getCartItem(index));
          Provider.of<CartProvider>(context, listen: false).updateCartIcon();
          Provider.of<CartProvider>(context, listen: false).updatetot();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              
              showCloseIcon: true,
              closeIconColor: Theme.of(context).colorScheme.onSecondary,
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'The item has been removed',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSecondary,
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
        },
        key: Key(getCartItem(index)['product_id']),
        child: CartItem(
          cartItem: getCartItem(index),
          ),
      );
      }
    );
  }

}

IconData changeView(crs) {
    if (crs == true) {
      return Icons.check_box_rounded;
    } else {
      return Icons.check_box_outline_blank_rounded;
    }
  }

class CartItem extends StatefulWidget {

  final Map cartItem;

  const CartItem({
    super.key,
    required this.cartItem,
    });

  @override
  State<CartItem> createState() {
    return _CartItemState();
    }
}

class _CartItemState extends State<CartItem> {

  late bool isChecked;
  late int nitem;

  @override
  void initState() {
    super.initState();

    isChecked = false;
    nitem = widget.cartItem['amount'];

  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {

        final ccartItem = widget.cartItem;

        if (ccartItem['product_id'] == null) {
              return Center(
                heightFactor: 5.8,
                widthFactor: 2,
                child: Text(
                  ccartItem['product'],
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              );
            }
            
        return Container(
          // color: getColor(ThemeColr.hilightSecondary),
          height: 180,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Row(
            children: [
        
              Container(
                margin: EdgeInsets.all(0),
                width: 38,
                child: IconButton(
                  onPressed: () {
                      setState(() {
                        if (widget.cartItem['isChecked'] == false) {
                          widget.cartItem['isChecked'] = true;
                        } else {
                          widget.cartItem['isChecked'] = false;
                        }
                        });
                        Provider.of<CartProvider>(context, listen: false).updatetot();
                    },
                  icon: Icon(
                    changeView(widget.cartItem['isChecked']),
                    color: isChecked == true
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  highlightColor: getColor(ThemeColr.hilightPrimary),
                  ),
                ),
              Container(
                padding: EdgeInsets.all(14),
                width: 110,
                child: GestureDetector(
                  onTap: () {
                    // TODO : get to product page

                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      widget.cartItem['product']['imgUrl'],
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
              ),
              Container(
                // color: getColor(ThemeColr.hilightSecondary),
                height: 160,
                width: 130,
                margin: EdgeInsets.fromLTRB(16, 2, 5, 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
        
                    Text(
                      widget.cartItem['product']['title'],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    Text(
                      'SIZE: ${widget.cartItem['selectedSize']}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    Text(
                      'THB ${widget.cartItem['product']['price']}',
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
        
                        Container(
                          margin: EdgeInsets.all(0),
                          width: 40,
                          child: IconButton(
                            onPressed: () {
                              if (widget.cartItem['amount'] > 1) {
                                widget.cartItem['amount']--;
                              }
                              setState(() {
                                nitem = widget.cartItem['amount'];
                              });
                              Provider.of<CartProvider>(context, listen: false).updatetot();
                              },
                            icon: Icon(
                              Icons.do_not_disturb_on_outlined,
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              ),
                            highlightColor: getColor(ThemeColr.hilightPrimary),
                            ),
                          ),
                        SizedBox(
                          width: 40,
                          height: 30,
                          child: Text(
                            widget.cartItem['amount'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          width: 40,
                          child: IconButton(
                            onPressed: () {
                                widget.cartItem['amount']++;
                                setState(() {
                                  nitem = widget.cartItem['amount'];
                                });
                                Provider.of<CartProvider>(context, listen: false).updatetot();
                              },
                            icon: Icon(
                              Icons.add_circle_outline_rounded,
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              ),
                            highlightColor: getColor(ThemeColr.hilightPrimary),
                            ),
                          ),
                        
                      ],
                    ),
        
                  ],
                ),
              ),
        
            ],
          ),
        );
      }
    );
  }
}

class CarouselItem extends StatelessWidget {

  final String imgs;
  final String itemname;
  final double itemPrice;
  final VoidCallback voidFunc;

  const CarouselItem({
    super.key,
    required this.imgs,
    required this.itemname,
    required this.voidFunc,
    required this.itemPrice,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 300,
          decoration: BoxDecoration(
            // color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(4, 8), // changes position of shadow
              ),
            ],
          ),
        
          child: GestureDetector(

            onTap: voidFunc,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                imgs,
                fit: BoxFit.cover,
                ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(5),
          height: 26,
          decoration: BoxDecoration(
            // color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(20)),),
        
          child: Text(
            itemname,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(5),
          height: 26,
          decoration: BoxDecoration(
            // color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(20)),),
        
          child: Text(
            '$itemPrice THB',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              foreground: Paint()..shader = LinearGradient(
                  colors: <Color>[Color.fromRGBO(99, 229, 197, 1), Color.fromRGBO(20, 54, 111, 1)],
                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 36.0))
            ),
          ),
        ),

      ],
    );
  }
}