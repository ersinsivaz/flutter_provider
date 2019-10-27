import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/counter_bloc.dart';
import 'package:flutter_bloc/blocs/post_bloc.dart';
import 'package:flutter_bloc/blocs/theme_bloc.dart';
import 'package:flutter_bloc/pages/counter_page.dart';
import 'package:flutter_bloc/widgets/post_item.dart';
import 'package:provider/provider.dart';

import 'forms/post_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterBloc>.value(
            value: CounterBloc()
          ),
          ChangeNotifierProvider<ThemeChanger>.value(
            value: ThemeChanger(ThemeData.light())
          ),
          ChangeNotifierProvider<PostBloc>.value(
            value: PostBloc()
          )
        ], 
        child: MaterialAppWithTheme(),
    );
  }
}


class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final postBloc = Provider.of<PostBloc>(context);
    postBloc.fetchPost();

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.video_library)),
                Tab(icon: Icon(Icons.category)),
                Tab(icon: Icon(Icons.mail)),
              ],
              
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              CounterPage(),
              PostItem(post: postBloc.post),
              PostForm(),
              Icon(Icons.mail),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: 0,
        
          ),
        ),
        
      ),
      theme: theme.getTheme(),
    );
  }
}