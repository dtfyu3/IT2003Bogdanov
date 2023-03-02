import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _counter = 0;

_counterIncrement(){
  setState(() {
    _counter++;
  });
}
final textStyle = const TextStyle(color:Colors.green);
final buttonStyle = const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.white),
  );
  final textButtonStyle = const ButtonStyle(
    padding: MaterialStatePropertyAll(EdgeInsets.zero),
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Общежития КубГАУ'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          const Image(
            alignment: Alignment.topLeft,
            fit: BoxFit.fill,
           width: double.infinity,
           height: 250, 
            image: AssetImage('images/forest.jpg',
          ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Общежитие № 20',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  Row(
                    children: [
                      const Expanded(child: Text('Краснодар, ул. Калинина, 13',style: TextStyle(color: Colors.grey),),),
                      IconButton(
                        icon: const Icon(Icons.heart_broken,color:Colors.red),
                        style: buttonStyle,
                        splashRadius: 20,
                        onPressed: _counterIncrement,
                        ),
                      Text('$_counter'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: (){},
                        icon: const Icon(Icons.call),
                        splashRadius: 24,
                        style: buttonStyle,
                        color: Colors.green,
                      ), 
                      ),
                      Expanded(
                        flex: 2,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: (){},
                        icon: const Icon(Icons.navigation_rounded),
                        splashRadius: 24,
                        color: Colors.green,
                      ), 
                      ),
                      Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: (){},
                        icon: const Icon(Icons.share),
                        splashRadius: 24,
                        color: Colors.green,
                      ), 
                      ),
                  ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        child: TextButton(
                          style: textButtonStyle,
                          child: Text('ПОЗВОНИТЬ',style: textStyle),
                          onPressed: (){},),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextButton(
                          style:textButtonStyle,
                          onPressed: (){},
                          child: Text('МАРШРУТ',style: textStyle),
                          ),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextButton(
                          style: textButtonStyle,
                          onPressed: (){},
                          child: Text('ПОДЕЛИТЬСЯ',style: textStyle),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.', textAlign: TextAlign.justify),
                  ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
