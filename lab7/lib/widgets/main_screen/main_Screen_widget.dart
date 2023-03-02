import 'package:flutter/material.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {

    void _next_screen(){
      Navigator.of(context).pushNamed('/second_screen');
    }
    return Scaffold(
      appBar: AppBar(title: Text('Главное окно'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:_next_screen, 
          child:Text('Перейти')
          ),
      ),
    );
  }
}