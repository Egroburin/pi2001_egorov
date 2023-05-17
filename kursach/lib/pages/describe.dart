import 'package:flutter/material.dart';

class describes extends StatefulWidget {
  const describes({super.key});

  @override
  State<describes> createState() => _describesState();
}

class _describesState extends State<describes> {
  String recipetext = '';
  int _myindex = 0;
  String CookBookStr = '';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)?.settings.arguments as Map;
    recipetext = data['Desc'];
    _myindex = data['IND'];
    void _handleBackButton() {
      // добавьте здесь необходимую логику перед возвратом на предыдущую страницу
      Navigator.pushReplacementNamed(context, '/', arguments: {
        'Desc2': recipetext,
        'IND2': _myindex
      }); // возврат на предыдущую страницу
    }

    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Recipe describe'),
          backgroundColor: Colors.amber,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _handleBackButton,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 25),
            ),
            SizedBox(height: 25),
            Text('$recipetext И $_myindex'),
            SizedBox(height: 25),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Describe'),
                      content: TextField(
                        onChanged: (String value) {
                          setState(() {
                            CookBookStr = value;
                          });
                        },
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                data['Desc'] = CookBookStr;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text('Добавить'))
                      ],
                    );
                  },
                );
              },
              child: Text('add'),
              backgroundColor: Colors.amber,
            ),
            SizedBox(height: 25),
          ]),
        ));
  }
}
