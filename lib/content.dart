// Sliding page content
import 'package:flutter/cupertino.dart';

class slideContent {
  String image;
  String title;
  String desc;

  slideContent({required this.image, required this.title, required this.desc});

}

List<slideContent> content = [
  slideContent(
      image: "assets/Illustration1.png",
      title: "Online Consultancy",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          "deserunt mollit anim id est laborum."
  ),

  slideContent(
      image: "assets/Illustrationvideo.png",
      title: "Informative Videos",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          "deserunt mollit anim id est laborum."
  ),

  slideContent(
      image: "assets/Illustrationmedicine (2).png",
      title: "Revolutionary Medicines",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          "deserunt mollit anim id est laborum."
  ),

];



//2nd one the content of products in product page itemwidget


class Catalogmodel{
  static final items = [
    Item(id: 1, name: "Knee Relief", desc: 'By Awasthi Vitality', price: 500, color: "#33505a" , image: 'assets/Rectangle 631.png', ruppee : "MRP ₹500 ", exp : 'Expiry Date' ),
    Item(id: 2, name: "Knee Relief", desc: 'By Awasthi Vitality', price: 500, color: "#33505a" , image: 'assets/Rectangle 633.png', ruppee : "MRP ₹500 ",exp : 'Expiry Date' ),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final  num price;
  final String color;
  final String image;
  final String ruppee;
  final String exp;


  Item({ required this.id,
    required this.name,
    required this.desc ,
    required this.price ,
    required this.color,
    required this.image,
    required this.ruppee,
    required this.exp,
  });

}



class Strings {
  Strings._();

  static const String pro_det = 'Lorem ipsum dolor sit amet sapiente excepturi av beatae optio, ab consequatur alias voluptates eligendi commodi quam quos cumque.';

}



