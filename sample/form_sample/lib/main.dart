import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _usernameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Form Sample'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              focusNode: _emailFocusNode,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
              onSaved: (value) {
                if (kDebugMode) {
                  print('Email -> $value');
                }
              },
              onEditingComplete: () {
                if (kDebugMode) {
                  print('requestFocus -> _passwordFocusNode');
                }
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
            ),
            TextFormField(
              focusNode: _passwordFocusNode,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (value) {
                if (kDebugMode) {
                  print('Password -> $value');
                }
              },
              onEditingComplete: () {
                if (kDebugMode) {
                  print('requestFocus -> _usernameFocusNode');
                }
                FocusScope.of(context).requestFocus(_usernameFocusNode);
              },
            ),
            TextFormField(
              focusNode: _usernameFocusNode,
              decoration: const InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              onSaved: (value) {
                if (kDebugMode) {
                  print('Username -> $value');
                }
              },
              onEditingComplete: () {
                if (kDebugMode) {
                  print('requestFocus -> _emailFocusNode');
                }
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
