import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller;

  @override
  void initate() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(''),
      ),
      body: Center(
        child: Consumer<model>(builder: (context, model, child) {
          return Column(
            children: [
              Text(
                'Name:${model.name}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opendialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future opendialog(BuildContext context) => showDialog(
    context: context,
    builder: (Context) => SimpleDialog(children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  onChanged: (value) {
                    model().chagename(value);
                  },

                  // controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Enter the name',
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Enter your age',
                    labelText: 'Age',
                  ),
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   child: TextField(
              //     controller: TextEditingController(),
              //     decoration: InputDecoration(
              //       hintText: 'Enter your email',
              //       labelText: 'Email',
              //     ),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Enter your place',
                    labelText: ' place',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    labelText: 'Phone number',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: TextButton(
                    onPressed: () => submit(context), child: Text('Submit')),
              )
            ],
          )
        ]));
void submit(BuildContext context) {
  Navigator.of(context).pop();
}
