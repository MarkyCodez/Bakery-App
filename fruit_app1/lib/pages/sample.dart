import 'package:flutter/material.dart';
import 'package:fruit_app1/pages/items.dart';
import 'package:fruit_app1/state_management/state_management.dart';
import 'package:provider/provider.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  // final item = [1, 3, 4, 5, 1];
  // int c = 0;
  // void func() {
  //   for (int i = 0; i < item.length; i++) {
  //     c += item[i];
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     func();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final _value = Provider.of<StateManagement>(context).items;
    final _value = [
      {"mna": 2, 'sd': 34},
      {"mna": 3, "sd": 4},
      {"mna": 1, "sd": 4},
      {"mna": 4, "sd": 4},
    ];
    int c = 0;
    for (int j = 0; j < _value.length; j++) {
      int? k = _value[j]["mna"];
      c += k ?? 0;
    }
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 200,
                      width: 150,
                      color: Colors.blue.shade200,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(c.toString()),
                          SizedBox(
                            height: 20,
                          ),
                          Text("12"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("12"),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
