import 'package:dars8/screens/summary_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        actions: [
          IconButton(
            onPressed: () async {
              try {
                final image = await _screenshotController.capture();
                if (image != null) {
                  final directory = await getApplicationDocumentsDirectory();
                  final imagePath =
                      await File('${directory.path}/screenshot.png').create();
                  await imagePath.writeAsBytes(image);

                  // XFile ob'ektiga aylantiramiz
                  final xFile = XFile(imagePath.path);

                  // shareXFiles bilan ulashamiz
                  await Share.shareXFiles([xFile],
                      text: 'Bu mening skrinshotim!');
                }
              } catch (error) {
                if (kDebugMode) {
                  print('Screenshot olishda xatolik: $error');
                }
              }
            },
            icon: const Icon(
              Icons.camera,
              color: Colors.blue,
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.picture_as_pdf))
        ],
      ),
      drawer: const Drawer(),
      body: Screenshot(
        controller: _screenshotController,
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/photo.jpg"),
            ),
            const SizedBox(height: 20),
            Text(
              "Abrorov Javohir Jasurbek O'gli",
              style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              "Flutter Developer",
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              "Do not have Experience",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: Colors.blue[900],
                ),
                Text(
                  "Uzbekistan, Tashkent",
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue[50],
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[300],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  child: const Text("Contact"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SummaryScreen();
                    }));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue[50],
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white), label: ''),
        ],
      ),
    );
  }
}
