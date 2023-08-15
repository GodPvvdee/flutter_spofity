import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spotify/screens/detail_screen.dart';

class Todo {
  final String title;
  final String description;
  const Todo(this.title, this.description);
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(6, (index) => {"id": index, "name": "Artist $index "}).toList();
    // final todos = List.generate(
    //   20,
    //   (i) => Todo(
    //     'Todo $i',
    //     'A description of what needs to be done for Todo $i',
    //   ),
    // );
    final List todos = [
      Todo('I was Never There', 'The Weekend'),
      Todo('Glimpse of Us', 'Joji'),
      Todo('Starboy', 'weekend'),
      Todo('I was Never There', 'The Weekend'),
      Todo('Glimpse of Us', 'Joji'),
      Todo('Starboy', 'weekend'),
    ];
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // Add your settings action here
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 32,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'What do you want to listen to?',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Browse all",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400, fontFamily: "Raleway", fontStyle: FontStyle.normal, fontSize: 13.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemCount: myProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            width: 180,
                            height: 120,
                            decoration: BoxDecoration(
                              color: index % 2 == 0 ? Colors.blue : Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Podcast",
                              style: TextStyle(color: Colors.white, fontSize: 14.0),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        todos[index].title,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(todo: todos[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
