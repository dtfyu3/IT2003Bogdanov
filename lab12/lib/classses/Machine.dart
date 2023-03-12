import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../async/methods.dart';
import 'Coffee.dart';
import 'Reesources.dart';
import 'package:lab12/screens/makeCoffeeScreen.dart';

class Machine {
  final res = Resources(0, 0, 0, 0);
  ICoffee? ctype;
  ICoffee cof(ICoffee) {
    return ctype = ICoffee;
  }


  bool isAvailableRes() {
    if (res.coffee >= ctype!.coffeBeans() &&
        res.water >= ctype!.water() &&
        res.cash >= ctype!.cash() &&
        res.milk >= ctype!.milk()) {
      return true;
    }
    return false;
  }

  Future subStractRes() async {
    int water;
    int milk;
    int cash;
    int beans;
    milk = res.milk - ctype!.milk();
    res.setMilk = milk;
    water = res.water - ctype!.water();
    res.setWater = water;
    cash = res.cash - ctype!.cash();
    res.setCash = cash;
    beans = res.coffee - ctype!.coffeBeans();
    res.setCoffee = beans;
    // int q = res.coffee - 50;
    // res.setCoffee = q;
    // q = res.water - 50;
    // res.setWater = q;
    // q = res.cash - ctype!.cash();
    // res.setCash = q;
    
    return;
  }

  bool makeCoffeeByType(String? type) {
    type = type!.toLowerCase();
    switch (type) {
      case 'americano':
        cof(CoffeeAmericano());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
      case 'cappucino':
        cof(CoffeeCappucino());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
      case 'espresso':
        cof(CoffeeEspresso());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
    }

    return true;
  }
}
