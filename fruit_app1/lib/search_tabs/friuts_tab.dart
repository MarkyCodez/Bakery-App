import 'package:flutter/material.dart';
import 'package:fruit_app1/search_tabs/view_items.dart';
import '../data/fruits_data.dart';

class FriutsTab extends StatelessWidget {
  const FriutsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Friuts"),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: Fruits.length,
                itemBuilder: (context, index) {
                  final _friuts = Fruits[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ViewItems(popu: _friuts);
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 400,
                        width: MediaQuery.sizeOf(context).width * 0.87,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400.withOpacity(0.7),
                              spreadRadius: 4,
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(_friuts["name"]),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              _friuts["image"],
                              height: 270,
                              width: 270,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "${_friuts["weight"]} | ${_friuts["price"].toString()} Rs"),
                          ],
                        ),
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
