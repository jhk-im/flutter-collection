import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubits/cubit/counter_cubit.dart';
import 'package:my_counter_cubit/other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyCounter Cubit',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('counter is ${state.counter}'),
                );
              },
            );
          } else if (state.counter == -1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return OtherPage();
              }),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Text(
              // '${BlocProvider.of<CounterCubit>(
              //   context,
              //   listen: true,
              // ).state.counter}',
              '${state.counter}',
              style: TextStyle(fontSize: 52.0),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            child: Icon(Icons.remove),
            heroTag: 'decrement',
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: BlocListener<CounterCubit, CounterState>(
    //     listener: (context, state) {
    //       if (state.counter == 3) {
    //         showDialog(
    //           context: context,
    //           builder: (context) {
    //             return AlertDialog(
    //               content: Text('counter is ${state.counter}'),
    //             );
    //           },
    //         );
    //       } else if (state.counter == -1) {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) {
    //             return OtherPage();
    //           }),
    //         );
    //       }
    //     },
    //     child: BlocBuilder<CounterCubit, CounterState>(
    //       builder: (context, state) {
    //         return Center(
    //           child: Text(
    //             // '${BlocProvider.of<CounterCubit>(
    //             //   context,
    //             //   listen: true,
    //             // ).state.counter}',
    //             '${state.counter}',
    //             style: TextStyle(fontSize: 52.0),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   floatingActionButton: Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       FloatingActionButton(
    //         onPressed: () {
    //           BlocProvider.of<CounterCubit>(context).increment();
    //         },
    //         child: Icon(Icons.add),
    //         heroTag: 'increment',
    //       ),
    //       const SizedBox(
    //         width: 10.0,
    //       ),
    //       FloatingActionButton(
    //         onPressed: () {
    //           BlocProvider.of<CounterCubit>(context).decrement();
    //         },
    //         child: Icon(Icons.remove),
    //         heroTag: 'decrement',
    //       ),
    //     ],
    //   ),
    // );
  }
}
