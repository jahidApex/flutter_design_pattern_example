import 'dart:convert';

class MadrasahBackground {
  String getMadrasahStudent() {
    return '''
    [
    {
    "dhakil" : "2011",
    "background" : "madrasah",
    "name" : "jahid"
    },
    {
    "dhakil" : "2010",
    "background" : "madrasah",
    "name" : "hasan"
    },
    {
    "dhakil" : "2013",
    "background" : "madrasah",
    "name" : "nahid"
    }
    ]
    
    ''';
  }
}

class SchoolBackground {
  String getSchoolStudent() {
    return '''
    [
    {
    "ssc" : "2011",
    "background" : "school",
    "name" : "rasel"
    },
    {
    "ssc" : "2010",
    "background" : "school",
    "name" : "abir"
    },
    {
    "ssc" : "2013",
    "background" : "school",
    "name" : "soccho"
    }
    ]
    
    ''';
  }
}

abstract class IStudentInformation {
  List<Student> getStudentInformation();
}

class Student {
  String background;
  String schoolPassingYear;
  String studentName;

  Student(this.background, this.schoolPassingYear, this.studentName);
}

class MadrasahAdapter implements IStudentInformation {
  final student = MadrasahBackground();
  @override
  getStudentInformation() {
    final data = jsonDecode(student.getMadrasahStudent()) as List;
    return data
        .map((e) => Student(
              e['background'],
              e['dhakil'],
              e['name'],
            ))
        .toList();
  }
}

class SchoolAdapter implements IStudentInformation {
  final student = SchoolBackground();
  @override
  List<Student> getStudentInformation() {
    final data = jsonDecode(student.getSchoolStudent()) as List;
    return data
        .map((e) => Student(
              e['background'],
              e['ssc'],
              e['name'],
            ))
        .toList();
  }
}

class StudentInformation implements IStudentInformation {
  final madrasahStudent = MadrasahAdapter();
  final schoolStudent = SchoolAdapter();
  @override
  List<Student> getStudentInformation() {
    return madrasahStudent.getStudentInformation() +
        schoolStudent.getStudentInformation();
  }
}
