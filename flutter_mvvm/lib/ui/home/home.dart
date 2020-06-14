import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mvvm/locator.dart';
import 'package:flutter_mvvm/core/viewmodels/home_page_model.dart';
import 'package:flutter_mvvm/ui/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  HomePageModel _homePageModel = locator<HomePageModel>();

  @override
  void initState() {
    super.initState();
    _homePageModel.refreshTodos();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageModel>(
      create: (_) => _homePageModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ToDo App'),
          leading: SizedBox(),
        ),
        body: SafeArea(
          child: Consumer<HomePageModel>(
            builder: (context, model, child) {
              return model.todos == null
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () {
                        return _currentIndex == 0 ? model.refreshTodos() : null;
                      },
                      child: ListView.builder(
                        itemCount: model.todos.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key('${model.todos[index].id}'),
                            onDismissed: (direction) {
                              model.removeTodo(model.todos[index]);
                            },
                            child: TodoItem(
                              title: model.todos[index].title,
                              completed: model.todos[index].completed,
                              onTap: () {
                                model.toggleTodo(model.todos[index]);
                              },
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ),
        floatingActionButton: _currentIndex != 1
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  _homePageModel
                      .addTodo('Nueva tarea ${_homePageModel.totalTodos + 1}');
                },
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _homePageModel.onlyCompleted = index == 1;
              _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('Tareas'),
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              title: Text('Completadas'),
            ),
          ],
        ),
      ),
    );
  }
}
