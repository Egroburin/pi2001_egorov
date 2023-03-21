import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
/*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
/*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Общежитие № 20',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Краснодар'
                  ' Калинина 13',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
/*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('12'),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.green, Icons.call, 'Позвонить'),
        _buildButtonColumn(Colors.green, Icons.near_me, 'Маршрут'),
        _buildButtonColumn(Colors.green, Icons.share, 'Поделиться'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '«Студенческий городок или так называемый кампус Кубанского ГАУ состоит'
        'из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях'
        'университета, при поселении между администрацией и студентами заключается'
        'договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия'
        'асоциальных явлений в молодежной среде. Условия проживания в общежитиях'
        'университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и'
        'наглядной агитации. С целью улучшения условий быта студентов активно работает'
        'система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.».',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Общежития КубГау',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Общежития КубГау')),
        body: ListView(
          children: [
            Image.network(
              'https://i5.photo.2gis.com/images/branch/23/3236962264731388_7c1a.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
