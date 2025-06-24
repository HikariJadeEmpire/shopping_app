import 'package:flutter/material.dart';

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

Icon changeView(crs) {
    if (crs == true) {
      return Icon(Icons.apps);
    } else {
      return Icon(Icons.width_full_outlined);
    }
  }

List<Widget> getRelevantProd(String filter, List allproduct) {

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
          // TODO: on item click
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