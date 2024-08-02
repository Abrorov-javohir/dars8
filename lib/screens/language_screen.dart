import 'package:dars8/screens/contact_screen.dart';
import 'package:dars8/screens/skill_screen.dart';
import 'package:flutter/material.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue[900]),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.picture_as_pdf_rounded,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Languages",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30),
              _buildLanguageRow(
                "assets/english.png",
                "English",
                "Second Language",
              ),
              _buildLanguageRow(
                "assets/russian.png",
                "Russian",
                "Third Language",
              ),
              _buildLanguageRow(
                "assets/uzbek.png",
                "Uzbek",
                "Native Language",
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SkillsScreen();
                      }));
                    },
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
                        return const ContactScreen();
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
            ],
          ),
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

  Widget _buildLanguageRow(
      String assetPath, String languageName, String proficiency) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            assetPath,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                languageName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                proficiency,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
