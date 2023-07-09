import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle textStyle({FontWeight? font, Color? color, double? size}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: font,
      color: color,
      fontSize: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help,
              color: Colors.red,
            ),
          ),
        ],
        leading: const Icon(
          Icons.sort_rounded,
          color: Colors.black87,
        ),
        title: const Text(
          "PRC - Print Ready Check",
          style: TextStyle(
            fontFamily: 'Poppins', // Replace with the correct font family
            fontWeight: FontWeight.bold, // Replace with the correct font weight
            color: Colors.black87,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("asserts/images/pdf1.png", width: 180),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Files",
                            style: textStyle(font: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: size.height * 0.2,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  leading: Image.asset(
                                      "asserts/images/pdf4.png"),
                                  title: Text(
                                    "Filename",
                                    style: textStyle(
                                        font: FontWeight.normal,
                                        color: Colors.black87),
                                  ),
                                  subtitle: Text(
                                    "path to file",
                                    style: textStyle(
                                        font: FontWeight.normal,
                                        color: Colors.black87,
                                        size: 14),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                              separatorBuilder: ((context, index) =>
                              const Divider(color: Colors.white)),
                              itemCount: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.12,
                            child: Row(
                              children: [
                                buttonWidget(
                                  color: Colors.red,
                                  onTap: () {
                                    // Add functionality to create PDF
                                  },
                                  path: "asserts/images/pdf3.png",
                                  title: "Create PDF",
                                ),
                                const SizedBox(width: 3),
                                buttonWidget(
                                  color: Colors.red,
                                  onTap: () {
                                    // Add functionality to select PDF
                                  },
                                  path: "asserts/images/pdf3.png",
                                  title: "Select PDF",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          buttonWidget(
                            color: Colors.red,
                            onTap: () {
                              // Add functionality to read the PDF
                            },
                            path: "asserts/images/pdf3.png",
                            title: "Read the PDF",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Developed by Tiny coders",
            style: textStyle(color: Colors.black54, font: FontWeight.normal, size: 14),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget({required Color color, required String path, required String title, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                path,
                width: 45,
              ),
              Text(
                title,
                style: textStyle(font: FontWeight.normal, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
