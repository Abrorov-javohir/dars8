import 'package:dars8/screens/experience_screen.dart';
import 'package:dars8/screens/summary_screen.dart';
import 'package:flutter/material.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({super.key});

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
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
                "Academic backgr.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30),
              _buildAcademicItem(
                title: "GRADUATE",
                degree: "JOURNALISM",
                institution: "Universidad Pontificia de Salamanca",
                year: "2007",
              ),
              SizedBox(height: 20),
              _buildAcademicItem(
                title: "MASTER",
                degree: "GALICIAN LANG.",
                institution: "Universidade da Coruña",
                year: "2009",
              ),
              SizedBox(height: 20),
              _buildAcademicItem(
                title: "SUPERIOR TECHNICIAN",
                degree: "WEB APP DEVELOPMENT",
                institution: "IES Fernando Wirtz (A Coruña)",
                year: "2016",
              ),
              SizedBox(height: 20),
              _buildAcademicItem(
                title: "SPECIALIZATION",
                degree: "UX/UI DESIGN",
                institution: "La Zona - FUE (Fundación Universidad Empresa)",
                year: "2022",
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                        return const ExperienceScreen();
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

  Widget _buildAcademicItem({
    required String title,
    required String degree,
    required String institution,
    required String year,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.bookmark,
          color: Colors.pink[100],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.pink[100],
                ),
              ),
              SizedBox(height: 5),
              Text(
                degree,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                institution,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Year: $year",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
