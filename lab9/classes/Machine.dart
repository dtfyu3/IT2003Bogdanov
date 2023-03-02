import 'dart:io';




class Machine {
  int _coffeBeans;
  int _milk;
  int _water;
  int _cash;

  Machine(this._coffeBeans, this._milk, this._water, this._cash);
  
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
          String? res = '';
          int q = -1;
          while (res != 'milk' && res != 'coffee' && res != 'water' && res != 'cash') {
            print('Enter adding resourse (milk, water, coffee, cash)');
            res = (stdin.readLineSync())?.toLowerCase();
          }
          while (q < 0) {
            print('Enter resource quantity (positive only)');
            q = int.parse(stdin.readLineSync()!);
          }
          switch(res)
          {
            case 'milk':
            _milk += q;
            print(map);
            readComand();
            break;
            case 'coffee':
            _coffeBeans += q;
            print(map);
            readComand();
            break;
            case 'water':
            _water += q;
            print(map);
            readComand();
            break;
            case 'cash':
            _cash += q;
            print(map);
            readComand();
            break;
          }
        }
        if(comand == 'make coffee')
        {
          if(isAvailableRes())
          {
            subatractRes();
            print('Your coffe is being prepared \n-------------------------------');
            print(map);
            readComand();
          }
          else
          {
            print('This operation requires: Coffee beans-50g, water-100ml.\nWe have ${_coffeBeans}g cofee and ${_water}ml water');
            readComand();
          }
        }
      }
  }

  set milk(int num) {
    if (num >= 0) {
      _milk = num;
    }
  }
  set coffe(int num) {
    if (num >= 0) {
      _coffeBeans = num;
    }
  }

  set water(int num) {
    if (num >= 0) {
      _water = num;
    }
  }

  set cash(int num) {
    if (num >= 0) {
      _cash = num;
    }
  }

  bool isAvailableRes() {
    if (_coffeBeans>=50 && _water>= 100) {
      return true;
    }
    return false;
  }

  void subatractRes() {
    _coffeBeans -= 50;
    _water -= 100;
  }

  Map<String, dynamic> get map {
    return {
      "coffee": _coffeBeans,
      "milk": _milk,
      "water": _water,
      "cash": _cash,
    };
  }

  void printComands() {
    print('Available commands are: "Manipulating", "Exit"');
  }
}
