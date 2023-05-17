import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String recipetext = '';
  int _myindex = -1;
  String CookBookStr = '';
  List cookbooklist = [];
  List Describes = [];

  @override
  void initState() {
    super.initState();

    cookbooklist.addAll(['Parmesanoo', 'spagetti', 'pizza']);
    Describes.addAll(
        ['Добавьте рецепт! ', 'Добавьте рецепт! ', 'Добавьте рецепт! ']);
  }

  @override
  Widget build(BuildContext context) {
    Map? data = ModalRoute.of(context)?.settings.arguments as Map?;

    if (data != null && data.containsKey('Desc2') && data.containsKey('IND2')) {
      recipetext =
          data['Desc2'] ?? 'Добавьте рецепт! '; // задаем значение по умолчанию
      _myindex = data['IND2'] ?? -1; // задаем значение по умолчанию
      if (_myindex != -1) Describes[_myindex] = recipetext;
    }
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Книга рецептов'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cookbooklist.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(cookbooklist[index]),
              child: Card(
                child: ListTile(
                  title: Text(cookbooklist[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/desc', (Route) => false,
                          arguments: {'Desc': Describes[index], 'IND': index});
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  cookbooklist.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить рецепт'),
                  content: TextField(
                    onChanged: (String value) {
                      CookBookStr = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cookbooklist.add(CookBookStr);
                          });

                          Navigator.of(context).pop();
                        },
                        child: Text('Добавить'))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add_box,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
