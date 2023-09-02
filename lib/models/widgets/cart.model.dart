import 'package:flutter/material.dart';


class CartModel extends ChangeNotifier {

  final List _shopItems =  [
    ['PatientCart','assts/1.jpg'],
    ['BloodGlucoseMeter','assts/11.jpg',],
    ['Bodyธhermometer','assts/6.jpg',],
    ['BedStraddletable','assts/16.jpg',]
  ];
  get shopItems => _shopItems;
}