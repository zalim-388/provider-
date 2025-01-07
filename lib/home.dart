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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    placeController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('User Detail'),
      ),
      body: Consumer<CounterModel>(builder: (context, model, child) {
        return ListView.builder(
          itemCount: model.details.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = model.details[index];

            return GestureDetector(
              onLongPress: () => model.remove(item),
              child: Container(
                  child: ListTile(
                leading: CircleAvatar(child: Text(item['name']![0])),
                title: Text(
                  item['name'] ?? 'no name',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  'Age:${item['age'] ?? "N\A"} place:${item['place']}, phone:${item['phone']} ',
                  style: TextStyle(fontSize: 17),
                ),
              )),
            );
          },
        );
        //
        //
        //
        //
        // Column(
        //   children: [
        //     SizedBox(
        //       height: 40,
        //     ),
        //     Container(
        //       height: 150,
        //       width: 200,
        //       decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Colors.black,
        //           ),
        //           borderRadius: BorderRadius.all(Radius.circular(20))),
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 15),
        //         child: Column(
        //           children: [
        //             SizedBox(
        //               height: 10,
        //             ),
        //             Align(
        //               alignment: Alignment.centerLeft,
        //               child: Text(
        //                 'Name:${model?.name}',
        //                 style: TextStyle(fontSize: 20),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Align(
        //               alignment: Alignment.centerLeft,
        //               child: Text(
        //                 'Age:${model?.age}',
        //                 style: TextStyle(fontSize: 20),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Align(
        //               alignment: Alignment.centerLeft,
        //               child: Text(
        //                 'place:${model?.place}',
        //                 style: TextStyle(fontSize: 20),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Align(
        //               alignment: Alignment.centerLeft,
        //               child: Text(
        //                 'phone:${model?.phone}',
        //                 style: TextStyle(fontSize: 20),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opendialog(context, nameController, ageController, placeController,
              phoneController);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future opendialog(
        BuildContext context,
        TextEditingController nameController,
        TextEditingController ageController,
        TextEditingController placeController,
        TextEditingController phoneController) =>
    showDialog(
        context: context,
        builder: (Context) => SimpleDialog(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      // onChanged: (value) {
                      //   CounterModel().changeName(value);
                      // },
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter the name',
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      // onChanged: (value) {
                      //   CounterModel().changeage(value);
                      // },
                      controller: ageController,
                      decoration: InputDecoration(
                          hintText: 'Enter your age', labelText: 'Age'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      // onChanged: (value) {
                      //   CounterModel().changeplace(value);
                      // },
                      controller: placeController,
                      decoration: InputDecoration(
                        hintText: 'Enter your place',
                        labelText: ' place',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      // onChanged: (value) {
                      //   CounterModel().changephone(value);
                      // },
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        labelText: 'Phone number',
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: TextButton(
                        onPressed: () => submit(context, nameController,
                            ageController, placeController, phoneController),
                        child: Text('Submit')),
                  )
                ],
              )
            ]));
void submit(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController ageController,
    TextEditingController placeController,
    TextEditingController phoneController) {
  final model = Provider.of<CounterModel>(context, listen: false);
  model.addDetail(nameController.text, ageController.text, placeController.text,
      phoneController.text);
  // model.changeName(nameController.text);
  // model.changeage(ageController.text);
  // model.changeplace(placeController.text);
  // model.changephone(phoneController.text);

  Navigator.of(context).pop();

  nameController.clear();
  placeController.clear();
  ageController.clear();
  phoneController.clear();
}
