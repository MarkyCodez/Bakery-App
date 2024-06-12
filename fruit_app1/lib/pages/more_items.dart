import "package:flutter/material.dart";
import "package:fruit_app1/data/fruits_data.dart";
import "package:fruit_app1/pages/more_items_details.dart";
import "package:fruit_app1/pages/nav_bar.dart";

class MoreItems extends StatefulWidget {
  const MoreItems({super.key});
  @override
  State<MoreItems> createState() => _MoreItems();
}

class _MoreItems extends State<MoreItems> {
  late String value_5;
  @override
  void initState() {
    super.initState();
    value_5 = "adcs";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "More Items",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: moreItems.length,
          itemBuilder: (context, index) {
            final items = moreItems[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.only(right: 27.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      value_5 = items["name"];
                    });
                  },
                  child: ListTile(
                    tileColor: value_5 == items["name"]
                        ? Colors.white
                        : Color.fromRGBO(201, 229, 252, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    leading: CircleAvatar(
                      child: Image.asset(items["image"] as String),
                    ),
                    title: Text(
                      items["name"],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          items["weight"],
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(" | "),
                        Text(
                          "${items["price"].toString()} Rs",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return MoreItemsDetails(
                                    popular1: items,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "View",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: Size(80, 10),
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
