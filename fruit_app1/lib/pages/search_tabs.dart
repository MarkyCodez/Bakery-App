import "package:flutter/material.dart";
import "package:fruit_app1/search_tabs/biscuits_tab.dart";
import "package:fruit_app1/search_tabs/friuts_tab.dart";
import "package:fruit_app1/search_tabs/other.dart";
import "package:fruit_app1/search_tabs/tab_view.dart";

class SearchTabs extends StatefulWidget {
  const SearchTabs({super.key});
  @override
  State<SearchTabs> createState() => _SearchTabs();
}

class _SearchTabs extends State<SearchTabs> {
  List<String> items = ["Fruits", "Cakes", "Biscuits", "Other"];
  late String value_1;
  @override
  void initState() {
    super.initState();
    value_1 = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value_1 = item;
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                         if (index == 0){                          
                        return FriutsTab();
                         }   if (index == 1){                          
                        return CakeTab();
                         }  if (index == 2){                          
                        return BiscuitsTab();
                         }else {
                          return OtherItems();
                         }
                      },
                    ),
                  );
                },
                child: Chip(
                  label: Text(
                    item,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  side: BorderSide.none,
                  backgroundColor: value_1 == item
                      ? Theme.of(context).primaryColor
                      : Color.fromRGBO(201, 229, 252, 1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
