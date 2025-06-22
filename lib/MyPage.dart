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

  bool haveCartItems = false;
  int nCartItems = 0;
  bool crs = true;

  final SearchController searchController = SearchController();

  @override
  void initState() {
    super.initState();
    getApi();
  }

  Future getApi() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  void curView() {
    if (crs == true) {
      crs = false;
      }
    else {
      crs = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: getColor(ThemeColr.primary),
      drawerScrimColor: getColor(ThemeColr.secondary),
      
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

            return SafeArea(
              child: CustomScrollView(
              slivers : <Widget>[
                
                SliverAppBar(
              
                  floating: _floating,
                  snap: _snap,
                  pinned: _pinned,
              
                  centerTitle: false,
                  expandedHeight: 100,
                  collapsedHeight: 70,
              
                  backgroundColor: getColor(ThemeColr.primary),
                  surfaceTintColor: getColor(ThemeColr.primary),
                  
                  actions: [
              
                    Container(
                      // color: getColor(ThemeColr.hilightSecondary),
                      margin: EdgeInsets.only(top: 0, right: 30),
                      height: 78,
                      width: 56,
                      child: Badge(
                        offset: Offset(-1, 0),
                        label: Text(nCartItems.toString()),
                        isLabelVisible: haveCartItems,
                        backgroundColor: Colors.blueAccent,
                        child: InkWell(
                          
                          radius: 10,
                          borderRadius: BorderRadius.all(Radius.circular(800)),
                        
                          // highlightColor: getColor(ThemeColr.hilightPrimary),
                        
                          child: IconButton(
                            padding: EdgeInsets.all(2),
                            onPressed: () {
                              debugPrint('Cart.');
                              setState(() {
                                // TODO: on cart
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart),
                            splashRadius: 8,
                          
                            iconSize: 25,
                          
                            highlightColor: getColor(ThemeColr.hilightPrimary),
                            // color: getColor(ThemeColr.secondary),
                          ),
                        ),
                      )
                    ),
              
                  ],
              
                  leading: SearchAnchor(
                      viewBackgroundColor: getColor(ThemeColr.primary),
                      viewSurfaceTintColor: getColor(ThemeColr.primary),
                      dividerColor: getColor(ThemeColr.primary),
                    
                      shrinkWrap: false,
                      isFullScreen: true,
              
                      viewHintText: 'Search',
                      headerTextStyle: TextStyle(
                          fontFamily: 'Inconsolata',
                        ),
                      viewLeading: Container(
                        margin: EdgeInsets.all(6),
                        child: IconButton(
                          onPressed: () {
                              searchController.closeView('');
                            },
                          icon: Icon(Icons.arrow_back_rounded),
                          highlightColor: getColor(ThemeColr.hilightPrimary),
                          ),
                        ),
              
                      searchController: searchController,
                      builder: (BuildContext context, SearchController controller) {
                        return Container(
                          margin: EdgeInsets.only(left: 20, top: 12),
                          child: IconButton(
                            highlightColor: getColor(ThemeColr.hilightPrimary),
                            icon: Icon(Icons.search_rounded,
                              // color: getColor(ThemeColr.secondary),
                              size: 24,
                              ),
                            onPressed: () {
                              controller.openView();
                            },
                          ),
                        );
                      },
                      suggestionsBuilder: (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
              
                            // selectedColor: getColor(ThemeColr.hilightPrimary),
                            // selectedTileColor: getColor(ThemeColr.hilightPrimary),
                            // splashColor: getColor(ThemeColr.hilightPrimary),
                            // hoverColor: getColor(ThemeColr.primary),
                            // focusColor: getColor(ThemeColr.primary),
                            // tileColor: getColor(ThemeColr.primary),
              
                            title: Text(
                              item,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inconsolata(
                                fontSize: 18,
                                // color: getColor(ThemeColr.secondary),
                                fontWeight: FontWeight.normal,
                                ),
                              // selectionColor: getColor(ThemeColr.hilightPrimary),
                              ),
                            onTap: () {
                              setState(() {
                                
                                debugPrint(item);
                                controller.closeView('');
                                // TODO: on select search items

                              });
                            },
              
                          );
                        });
                      },
                    ),
                  
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      // color: getColor(ThemeColr.hilightSecondary),
                      padding: EdgeInsets.all(5.0),
                      width: 140,
                      
                      child: Text(
                        'SHOP\nDEMO',
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
                      children: [
              
                        ////////////////////////////
                        ////// START Widgets HERE !!
                        ////////////////////////////
              
                        SizedBox(
                          
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 12,
                            children: [
              
                              SizedBox(
                                width: 50,
                                child: IconButton(
                                  highlightColor: getColor(ThemeColr.hilightPrimary),
                                  padding: EdgeInsets.all(2),
                                  onPressed: () {
                                    debugPrint('filter.');
                                    setState(() {
                                      // TODO: on filter
                                    });
                                  },
                                  icon: Icon(Icons.filter_alt_rounded),
                                  splashRadius: 8,
                                
                                  iconSize: 25,
                                
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(
                                    'Filters',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                              ),
                              SizedBox(
                                width: 50,
                                child: IconButton(
                                  padding: EdgeInsets.all(2),
                                  onPressed: () {
                                    debugPrint('View changed.');
                                    setState(() {
                                      getApi();  // Re-fetch data
                                      curView();
                                    });
                                    debugPrint('is carousel : $crs');
                                  },
                                  icon: changeView(crs),
                                  splashRadius: 8,
                                
                                  iconSize: 25,
                                
                                ),
                              ),
              
                            ],
                          ),
                        ),
                        
                        SizedBox(
                          // color: getColor(ThemeColr.hilightSecondary),
                          height: 460,
                          // width: 350,
              
                          child: CarouselSlider(
                              items: [
              
                                CarouselItem(
                                  imgs: 'assets/images/shoes.jpg',
                                  itemname: 'Comfy shoes',
                                  voidFunc: () {
                                    debugPrint('shoes clicked');
                                    // TODO: on item click
                                  },
                                  ),
                                // TODO: listView.itemBuilder() - Get all images
              
                              ],
                            
                            //Slider Container properties
                            options: CarouselOptions(
                              height: 440.0,
              
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              viewportFraction: 0.90,
                              // aspectRatio: 3.5 / 2,
              
                              autoPlay: true,
                              autoPlayCurve: Curves.easeInOut,
                              autoPlayInterval: Duration(seconds: 10),
              
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 900),
              
                            ),
                          ),
                        ),
              
                      ]
                      
                  )
                )
              
              
              ],
            ),
          );
        }
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