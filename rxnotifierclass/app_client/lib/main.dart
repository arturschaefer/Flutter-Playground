import 'package:app_client/src/chat_page.dart';
import 'package:app_client/src/controller.dart';
import 'package:app_client/src/home_page.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/chat': (context) {
          final args = ModalRoute.of(context).settings.arguments as Map;
          return ChatPage(
            name: args['name'],
            room: args['room'],
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Controller();

  @override
  void initState() {
    super.initState();

    rxObserver(() {
      print(controller.counter.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RxBuilder(
              builder: (_) {
                return Text(
                  '${controller.counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
