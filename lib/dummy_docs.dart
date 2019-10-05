import 'models/doctor.dart';

class DummyDocs{

  List<Doctor> dummyDocs = [
    Doctor(name: 'Dr. Archeel Parekh', locationId: 'c1', specialization: 'd1'),
    Doctor(name: 'Dr. Yogesh Despande', locationId: 'c2', specialization: 'd2'),
    Doctor(name: 'Dr. Yash Tailor', locationId: 'c3', specialization: 'd3'),
    Doctor(name: 'Dr. Sagar Dholakia', locationId: 'c4', specialization: 'd4'),
    Doctor(name: 'Dr. Advait Sankhe', locationId: 'c5', specialization: 'd5'),
    Doctor(name: 'Dr. Parth Shah', locationId: 'c6', specialization: 'd1'),
    Doctor(name: 'Dr. Yashwik Panchal', locationId: 'c1', specialization: 'd2'),
    Doctor(name: 'Dr. Akshat Savla', locationId: 'c2', specialization: 'd3'),
    Doctor(name: 'Dr. Aditya Patkar', locationId: 'c1', specialization: 'd4'),
    Doctor(name: 'Dr. Mitesh Desai', locationId: 'c2', specialization: 'd5'),
  ];

  List<Doctor> findByLocation(String locId){

    List<Doctor> newDocs = [];
    for(int i=0;i<dummyDocs.length;i++){
      if(dummyDocs[i].locationId == locId){
        newDocs.add(dummyDocs[i]);
      }
    }
    return newDocs;
  }

  List<Doctor> findByDisease(String diseaseId){

    List<Doctor> newDocs = [];
    for(int i=0;i<dummyDocs.length;i++){
      if(dummyDocs[i].locationId == diseaseId){
        newDocs.add(dummyDocs[i]);
      }
    }
    return newDocs;
  }

}