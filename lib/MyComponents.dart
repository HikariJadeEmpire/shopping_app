import 'package:flutter/material.dart';

enum ThemeColr {
  primary,
  secondary,
  hilightPrimary,
  hilightSecondary,
  }

Color getColor(enumthemeColr) {
    switch (enumthemeColr) {
      case ThemeColr.primary: {
        return Color.fromRGBO(255, 255, 255, 1);
      }
      case ThemeColr.secondary: {
        return Color.fromRGBO(19, 19, 20, 1);
      }
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

Icon changeView(crs) {
    if (crs = true) {
      return Icon(Icons.apps);
    } else {
      return Icon(Icons.width_full_outlined);
    }
  }

class CarouselItem extends StatelessWidget {

  final String imgs;
  final String itemname;
  final VoidCallback voidFunc;

  const CarouselItem({
    super.key,
    required this.imgs,
    required this.itemname,
    required this.voidFunc,
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
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                imgs,
                fit: BoxFit.cover,
                ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(5),
          height: 40,
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

      ],
    );
  }
}