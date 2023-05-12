import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants.dart';
import 'package:flutter_grade_calculator/data.dart';
import 'package:flutter_grade_calculator/show_average.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var formKey = GlobalKey<FormState>();
  double? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Constants.title,
          style: Constants.textStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.pink.shade300,
                  child: createForm(),
                ),
              ),
              const Expanded(
                flex: 1,
                child: ShowAverage(
                  average: 2.5,
                  numberOfLesson: 0,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.pink.shade600,
              child: const Text(
                'For List',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          createTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [createLetterGrade()],
          )
        ],
      ),
    );
  }

  Widget createTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: 'Lesson',
        filled: true,
        fillColor: Constants.mainColor.shade100,
      ),
    );
  }

  Widget createLetterGrade() {
    return Container(
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.5),
        borderRadius: Constants.radius,
      ),
      child: DropdownButton<double>(
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value!;
          });
        },
        items: DataHelper.allLessonsLetter(),
      ),
    );
  }
}
