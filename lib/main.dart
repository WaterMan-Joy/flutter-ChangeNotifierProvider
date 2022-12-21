import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/dog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'joy', breed: 'Hak!', age: 20),
      child: MaterialApp(
        title: 'sample2',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ('Sample2'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'name: ${ctx.watch<Dog>().name}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        Text(
          'breed: ${ctx.select<Dog, String>((Dog dog) => dog.breed)}',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 10,
        ),
        Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
          style: TextStyle(fontSize: 30),
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<Dog>().grow();
          },
          child: Text("더하기"),
        ),
      ],
    );
  }
}
