import 'package:bloc_prac/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      BlocProvider(create: (context) => CounterBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(
                fontSize: 35,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              if (count > 0) {
                counterBloc.add(CounterEvent.Decrement);
              } else {
                Null;
              }
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: "2",
            onPressed: () {
              counterBloc.add(CounterEvent.Reset);
            },
            child: const Icon(Icons.numbers),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: "3",
            onPressed: () {
              counterBloc.add(CounterEvent.Increment);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  // void counterAction(CounterEvent event) {
  //   setState(() {
  //     switch (event) {
  //       case CounterEvent.Increment:
  //         count++;
  //         break;

  //       case CounterEvent.Decrement:
  //         count--;
  //         break;

  //       case CounterEvent.Reset:
  //         count = 0;
  //         break;
  //     }
  //   });
  // }
}

// enum CounterEvent {
//   Increment,
//   Decrement,
//   Reset,
// }
