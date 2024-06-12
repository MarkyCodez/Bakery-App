
import 'package:fruit_app1/pages/nav_bar.dart';
import 'package:provider/provider.dart';
import "../state_management/state_management.dart";
import 'package:flutter/material.dart';

class items extends StatefulWidget {
  const items({super.key});

  @override
  State<items> createState() => _itemsState();
}

class _itemsState extends State<items> {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<StateManagement>(context).items;
    int total = 0;
    for (int i = 0; i < item.length; i++) {
      int? k = item[i]["price"];
      total += k ?? 0;
    }

    return Scaffold(
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        title: Text("Items"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Cart Items",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: item.length,
                itemBuilder: (context, index) {
                  final item_1 = item[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tileColor: Color.fromRGBO(201, 229, 252, 1),
                      contentPadding: EdgeInsets.all(10),
                      leading: CircleAvatar(
                        child: Image.asset(item_1["image"]),
                        radius: 25,
                      ),
                      title: Text(
                        item_1["name"],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: Text(
                        item_1["weight"],
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "Are you sure want to delete?",
                                ),
                                title: Text(
                                  "Delete Item",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                icon: Icon(
                                  Icons.delete_outline,
                                  size: 35,
                                ),
                                elevation: 10,
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Provider.of<StateManagement>(context,
                                              listen: false)
                                          .removeItems(item_1);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(201, 229, 252, 1),
                                      foregroundColor: Colors.black,
                                      minimumSize: Size(40, 40),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(201, 229, 252, 1),
                                      foregroundColor: Colors.black,
                                      minimumSize: Size(40, 40),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 30,
                        ),
                        color: Colors.red.shade400.withOpacity(0.8),
                      ),
                    ),
                  );
                },
              ),
              item.isNotEmpty
                  ? Center(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.87,
                        child: FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          mini: false,
                          elevation: 10,
                          onPressed: () {
                            Provider.of<StateManagement>(context, listen: false)
                                .removeAllItems();
                          },
                          child: Text(
                            "Clear All",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              total != 0
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400.withOpacity(0.7),
                                spreadRadius: 4,
                                blurRadius: 10,
                              ),
                            ],
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Amount\n    ${total.toString()} Rs",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
