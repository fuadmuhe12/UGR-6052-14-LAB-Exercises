import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserProvider extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;
  void increment(){
    _counter++;
    notifyListeners();
  }
  void decrement(){
    _counter--;
    notifyListeners();
  }
}
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child:  const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //
        //
        //
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
   const MyHomePage({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      bottomSheet: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                userProvider.decrement();
              }, 
              child: const Text('Decrement'),
            ),
            ElevatedButton(
              onPressed: (){
                userProvider.increment();
              }, 
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          //
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(userProvider.counter.toString(),
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
      
    );
  }
}
