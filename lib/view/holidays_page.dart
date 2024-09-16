import 'package:appadsgp1/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:appadsgp1/controller/holiday.dart';
import 'package:intl/intl.dart';

class HolidaysPage extends StatefulWidget {
  const HolidaysPage ({super.key});

  @override
 HolidaysPageState createState() => HolidaysPageState();
}

class HolidaysPageState extends State<HolidaysPage> {
  final HolidayAPI _holidayService = HolidayAPI();
  late Future<List<dynamic>> holidays;

  @override
  void initState() {
    super.initState();
    holidays = _holidayService.getHolidays(2024); 
  }
String formatDate (String date){
  final DateTime parsedDate = DateTime.parse(date);
  final String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
  return formattedDate;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feriados de 2024'),
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomePage() 
            ));
          },
        )
      ),
      body: FutureBuilder<List<dynamic>>(
        future: holidays,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(child: Text('Nenhum feriado encontrado.'));
          } else {
            final holidays = snapshot.data!;
            return ListView.builder(
              itemCount: holidays.length,
              itemBuilder: (context, index) {
                final holiday = holidays[index];
                return ListTile(
                  title: Text(holiday['name']),
                  subtitle: Text(formatDate(holiday['date'])),
                );
              },
            );
          }
        },
      ),
    );
  }
}