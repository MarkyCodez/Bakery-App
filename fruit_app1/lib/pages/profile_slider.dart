import 'package:flutter/material.dart';
import 'package:fruit_app1/data/fruits_data.dart';
import 'package:fruit_app1/pages/profile_product_details.dart';

class ProfileSlider extends StatefulWidget {
  const ProfileSlider({super.key});

  @override
  State<ProfileSlider> createState() => _ProfileSliderState();
}

class _ProfileSliderState extends State<ProfileSlider> {
  late String value_3;
  @override
  void initState() {
    super.initState();
    value_3 = "s";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 275,
        width: size * 0.95,
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: profile.length,
          itemBuilder: (context, index) {
            final prof = profile[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value_3 = prof["name"];
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfileProductDetails(
                          product: prof,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  width: 320,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400.withOpacity(0.7),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                    color: value_3 == prof["name"]
                        ? Color.fromRGBO(201, 229, 252, 1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 12),
                        child: Text(
                          prof["name"],
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          prof["weight"],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Image.asset(
                        (prof["image"]) as String,
                        width: 400,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("${(prof["price"].toString())} Rs"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
