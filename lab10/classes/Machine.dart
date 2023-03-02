import '../classes/Coffee.dart';
import 'dart:io';
import '../classes/Resources.dart';
import '../classes/Enums.dart';

class Machine {
  final res = Resources(50,11, 100, 80);
  ICoffee? ctype;
  ICoffee cof(ICoffee){
    return ctype = ICoffee;
  }




  
@override
  String toString() {
    return 'coffe: ${res.coffee} milk: ${res.milk} water: ${res.water} cash: ${res.cash}';
  }



 void readComand() {
    printComands();
    String? comand = stdin.readLineSync()?.toLowerCase();
    while ((comand != 'exit' && comand != 'manipulating')) {
      print('Enter the correct comand');
      comand = stdin.readLineSync()?.toLowerCase();
    }
    if (comand == 'exit') {
      return;
    } else if (comand == 'manipulating') {
      print('Available comands are: "Make coffee", "Add res"');
      comand = stdin.readLineSync()?.toLowerCase();
      while (comand != 'add res' && comand != 'make coffee') {
        print('Enter the correct comand');
        comand = stdin.readLineSync()?.toLowerCase();
      }
      if (comand == 'add res') {
        print('Now we have ${res.coffee} cofee ${res.milk} milk ${res.water} water ${res.cash} cash');
        String? string = '';
        int q = -1;
        while (string != 'milk' &&
            string != 'coffee' &&
            string != 'water' &&
            string != 'cash') {
          print('Enter adding resourse (milk, water, coffee, cash)');
          string = (stdin.readLineSync())?.toLowerCase();
        }
        while (q < 0) {
          print('Enter resource quantity (positive only)');
          q = int.parse(stdin.readLineSync()!);
        }
        switch (string) {
          case 'milk':
          res.addMilk(q); 
          break;
          case 'coffee':
          res.addCoffee(q); 
          break;
          case 'water':
          res.addWater(q); 
          break;
          case 'cash':
          res.addCash(q); 
          break;
        }
        print('Now we have ${res.coffee} cofee ${res.milk} milk ${res.water} water ${res.cash} cash');
      }
      else if (comand == 'make coffee')
      {
        String? string = '';
        while(string != 'cappucino' && string != 'americano' && string != 'espresso'){
          print('Enter kind of coffee, we have: ${CoffeeType.values}');
          string = (stdin.readLineSync())?.toLowerCase();
        }
        makeCoffeeByType(string);
      }
  }


}

void printComands() {
  print('Available commands are: "Manipulating", "Exit"');
}

  void makeCoffeeByType(String? type) {
  bool _isAvailableRes() {
    if (res.coffee >= ctype!.coffeBeans() && res.water >= ctype!.water() && res.cash >= ctype!.cash() && res.milk >= ctype!.milk()) {
      return true;
    }
    return false;
  }
  void subStractRes() {
    if(_isAvailableRes())
    {
    int q = res.coffee - 50;
    res.setCoffee = q;
    q = res.water - 50;
    res.setWater = q;
    print('Coffee is being prepared');
    
    }
    else
    print('Not enough resources'); 
  }

    {
        switch(type){
          case 'americano':
          cof(CoffeeAmericano());
          subStractRes();
          break;
          case 'cappucino':
          cof(CoffeeCappucino());
          subStractRes();
          break;
          case 'espresso':
          cof(CoffeeEspresso());
          subStractRes();
          break;
        }
    }
  }
}