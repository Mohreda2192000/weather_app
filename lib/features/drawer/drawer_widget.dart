import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'assets/splash.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.indigo.withOpacity(.9),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.grade,
                      color: Colors.white,
                    ),
                    Text(
                      'Favourite location',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Spacer(),
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.grade,
                      color: Colors.white,
                    ),
                    Text(
                      'Cairo',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.orange,
                    ),
                    Text(
                      '19˚',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Other locations',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Spacer(),
                  ],
                ),
                ListView.separated(
                    itemBuilder: (context, index) => Row(
                          children: const [
                            Spacer(
                              flex: 1,
                            ),
                            Icon(
                              Icons.grade,
                              color: Colors.white,
                            ),
                            Text(
                              'Cairo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.orange,
                            ),
                            Text(
                              '19˚',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: 1),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text(
                    'Manage locations',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.history_edu,
                        color: Colors.white,
                      ),
                      Text(
                        'History',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.next_plan,
                        color: Colors.white,
                      ),
                      Text(
                        'Future',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    Text(
                      'Report wrong location',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.quick_contacts_dialer_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Contact us',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
