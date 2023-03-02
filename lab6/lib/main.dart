import 'package:flutter/material.dart';


class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _text = 'Задайте параметры';
  int? num1 = 0;
  int? num2 = 0;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Ширина (мм)', style: TextStyle(fontSize: 20),),
                   SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validator: (value){
                         num1 = int.tryParse(value!);
                        if(value.isEmpty) return 'Задайте ширину';
                        if(num1 == null) return 'Проверьте правильность ввода';
                        if (num1!= null && num1! < 0) return 'Введите положительное число';
                    }),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Высота (мм)', style: TextStyle(fontSize: 20),),
                   SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      maxLength: 10,
                       keyboardType: TextInputType.number,
                      validator: (value){
                        num2 = int.tryParse(value!);
                        if(value.isEmpty) return 'Задайте ширину';
                        if(num2 == null) return 'Проверьте правильность ввода';
                        if (num2!= null && num2! < 0) return 'Введите положительное число';
                    }),
                  ),
                ],
              ),
              SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                        
                        setState(() {
                          if(num1 != null && num2 != null)
                        {
                        _text = 'S = $num1 * $num2 = ${num1!*num2!} (мм2)';
                        };
                        });
                      }
                    }, 
                    child: Text('Вычислить', style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: 15),
                    Text('$_text', style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Форма ввода'),),
      body: MyForm(),
    ),
  )
);