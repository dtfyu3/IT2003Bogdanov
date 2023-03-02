import 'package:flutter/material.dart';

class SecondScreenWidget extends StatefulWidget {
  const SecondScreenWidget({super.key});

  @override
  State<SecondScreenWidget> createState() => _SecondScreenWidgetState();
}

class _SecondScreenWidgetState extends State<SecondScreenWidget> {

void _no () {
Navigator.of(context).pop();
ScaffoldMessenger.of(context).showSnackBar(SnackBar
(content: Text('Нет'),
duration: Duration(milliseconds: 300),
));
}

void _jump_yes(){
Navigator.of(context).pop();
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: Text('Да'),
  duration: Duration(milliseconds: 300),
  ));



}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второе окно'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:_jump_yes, 
              child: Text('Да')
              ),
              SizedBox(height: 10,),
              ElevatedButton(
              onPressed:_no, 
              child: Text('Нет')
              ),
          ],
        ),
      ),
    );
  }
}