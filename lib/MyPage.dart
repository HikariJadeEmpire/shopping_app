import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';

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

  late bool haveCartItems;
  late int nCartItems;

  late String selectedFilter;
  late List<Widget> prodList = getRelevantProd(selectedFilter, productDetails);

  // late bool crs;
  // late Icon crsIcon;

  final SearchController searchController = SearchController();

  @override
  void initState() {
    super.initState();

    selectedFilter = categories[0];
    prodList = getRelevantProd(selectedFilter, productDetails);

    // crs = true;
    // crsIcon = changeView(crs);

    haveCartItems = false;
    nCartItems = 0;

    searchController.text = '';

  }

  // bool curView() {
  //   if (crs == true) {
  //     return false;
  //     }
  //   else {
  //     return true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.primary,
      drawerScrimColor: Theme.of(context).colorScheme.onPrimary,
      
      body: SafeArea(
              child: CustomScrollView(
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
                      viewBackgroundColor: Theme.of(context).colorScheme.primary,
                      viewSurfaceTintColor: Theme.of(context).colorScheme.primary,
                      dividerColor: Theme.of(context).colorScheme.primary,
                    
                      shrinkWrap: false,
                      isFullScreen: true,
              
                      viewHintText: 'Search',
                      headerTextStyle: TextStyle(
                          fontFamily: 'Inconsolata',
                        ),

                      textInputAction: TextInputAction.search,

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
                        if (controller.text == '') {
                          return List<ListTile>.generate(productDetails.length, (int index) {
                            final String item = '${productDetails[index]['title']}.';
                            return ListTile(
                
                              title: Text(
                                item,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
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
                        }

                        List matchList = [];
                        for (int ll = 0; ll < productDetails.length; ll++) {
                          String item = productDetails[ll]['title'];
                          RegExp regExp = RegExp(controller.text, caseSensitive: false);
                          bool match = regExp.hasMatch(item);

                          if (match) {
                            matchList.add(item);
                          }
                          
                        }

                        return List<ListTile>.generate(matchList.length, (int index) {
                          final String item = '${matchList[index]}.';
                          return ListTile(
                            title: Text(
                              item,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
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
                            spacing: 4,
                            children: [
              
                              SizedBox(
                                width: 40,
                                child: Icon(Icons.filter_alt_rounded),
                              ),

                              SizedBox(
                                width: 260,
                                child: ListView.builder(

                                  itemCount: categories.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.all(4),

                                  itemBuilder: (context, index) {

                                    final filter = categories[index];

                                    return Padding(
                                      padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedFilter = filter;
                                            prodList = getRelevantProd(selectedFilter, productDetails);
                                          });
                                          debugPrint('filter: $filter selected');
                                        },
                                        child: Chip(
                                          backgroundColor: selectedFilter == filter
                                            ? Theme.of(context).colorScheme.secondary
                                            : Theme.of(context).colorScheme.primary,
                                          side: BorderSide(
                                            color: getColor(ThemeColr.hilightSecondary),
                                            width: 0.8,
                                          ),
                                          label: Text(
                                            filter,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: selectedFilter == filter
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(context).colorScheme.secondary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ),

                              // SizedBox(
                              //   width: 50,
                              //   child: IconButton(
                              //     padding: EdgeInsets.all(2),
                              //     onPressed: () {

                              //       debugPrint('[ View changed ] is carousel : $crs');
                              //       setState(() {
                              //         crs = curView();
                              //         crsIcon = changeView(crs);
                              //       });

                              //     },
                              //     icon: crsIcon,
                              //     splashRadius: 8,
                                
                              //     iconSize: 25,
                                
                              //   ),
                              // ),
              
                            ],
                          ),
                        ),
                        
                        SizedBox(
                          // color: getColor(ThemeColr.hilightSecondary),
                          height: 480,
                          // width: 350,
              
                          child: CarouselSlider(
                              items: prodList,
                            
                            //Slider Container properties
                            options: CarouselOptions(
                              height: 464.0,
              
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