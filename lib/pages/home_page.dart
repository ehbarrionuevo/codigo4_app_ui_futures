import 'package:codigo4_app_ui_future/data/fake_data.dart';
import 'package:codigo4_app_ui_future/widgets/item_slider_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  FakeData data = FakeData();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.48,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(56.0),
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/background-2.webp"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Hi Elvis, \nWhere do you want to go?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                              size: 28.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Where are you going?",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Expanded(child: SizedBox()),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.72),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(56.0),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Santorini, Greece",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Recommendation",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  size: 22.0,
                                  color: Color(0xffFDA92D),
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  "5.0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  " (3243 reviews)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hot places",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "SEE ALL",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                FutureBuilder(
                  future: data.getPlaces(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      print(snap.data);
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemSliderWidget(),
                            ItemSliderWidget(),
                            ItemSliderWidget(),
                            ItemSliderWidget(),
                          ],
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
