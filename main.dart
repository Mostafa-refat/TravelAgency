import 'dart:io';
import 'dart:core';

main() {
  try {
    bool z = true;
    List<Trip> list = [];
    add() {
      print('id :');
      int id = int.parse(stdin.readLineSync());
      print('Location :');
      String location = stdin.readLineSync();
      print('Passenger limit :');
      int passengerLimit = int.parse(stdin.readLineSync());
      print('Date ');
      print('day: ');
      int day=int.parse(stdin.readLineSync());
      print('month: ');
      int month=int.parse(stdin.readLineSync());
      print('year: ');
      int year=int.parse(stdin.readLineSync());
      print('Price:');
      int price = int.parse(stdin.readLineSync());
      list.add(Trip(id: id ,location: location , passengerLimit: passengerLimit ,day: day,month: month,year: year ,price: price));
      print('Added!');
    }



    delete() {
      for(var i =0 ;i<list.length;i++ ){
        print(
            "trip  ->  id : ${list[i].id}  -  location : ${list[i].location}  -  limit : ${list[i].passengerLimit}  -  price : ${list[i].price}  -  date : ${list[i].day}-${list[i].month}-${list[i].year} \n ");
      }
      print('Enter the ID of the trip you want to delete');
      int tripId = int.parse(stdin.readLineSync());
      for(int i=0; i<list.length;i++){
        if(list[i].id == tripId){
          list.removeAt(i);

        }
      }
      print('deleted !');
    }

    edit(){
      for(var i =0 ;i<list.length;i++ ){
        print(
            "trip  ->  id : ${list[i].id}  -  location : ${list[i].location}  -  limit : ${list[i].passengerLimit}  -  price : ${list[i].price}  -  date : ${list[i].day}-${list[i].month}-${list[i].year} \n ");
      }
      print('Enter the ID of the trip you want to edit / rewrite');
      int tripId = int.parse(stdin.readLineSync());
      print('Location :');
      String location = stdin.readLineSync();
      print('Passenger limit :');
      int passengerLimit = int.parse(stdin.readLineSync());
      print('Date ');
      print('day: ');
      int day=int.parse(stdin.readLineSync());
      print('month: ');
      int month=int.parse(stdin.readLineSync());
      print('year: ');
      int year=int.parse(stdin.readLineSync());
      print('Price :');
      int price = int.parse(stdin.readLineSync());

      for(var i =0 ;i<list.length;i++ ){
        if(list[i].id == tripId) {
          list[i] = Trip(id: tripId ,location: location , passengerLimit: passengerLimit ,day: day,month: month,year: year ,price: price);
        }
      }

      print("edited");
    }

    view() {
      for(var i =0 ;i<list.length;i++ ){
        print(
            "trip  ->  id : ${list[i].id}  -  location : ${list[i].location}  -  limit : ${list[i].passengerLimit}  -  price : ${list[i].price}  -  date : ${list[i].day}-${list[i].month}-${list[i].year} \n ");

      }

    }

    search(){
      Trip result;
      print("Enter the price of the trip you want to search ");
      int priceTrip = int.parse(stdin.readLineSync());
      for(var i =0 ;i<list.length;i++ ){
        if(list[i].price == priceTrip){
          result = list[i];
          print(
              "trip  ->  id : ${list[i].id}  -  location : ${list[i].location}  -  limit : ${list[i].passengerLimit}  -  price : ${list[i].price}  -  date : ${list[i].day}-${list[i].month}-${list[i].year} \n ");

        }
      }

      if (result == null) {
        print("There is no trip with that price");
      }
    }

    reserve(){
      print("Enter the id of the trip you want to reserve");
      int tripId = int.parse(stdin.readLineSync());

      for(int i=0;i<list.length;i++){
        if(list[i].id == tripId){
          print("Enter the numbers of the passengers");
          int passNum = int.parse(stdin.readLineSync());
          if(list[i].availablePlaces >= passNum){
            list[i].passengersNum += passNum;
            print(
                "trip  ->  id : ${list[i].id}  -  location : ${list[i].location}  -  limit : ${list[i].passengerLimit}  -  price : ${list[i].price}  -  date : ${list[i].day}-${list[i].month}-${list[i].year}  -  available places: ${list[i].availablePlaces}\n ");
            print("resereved !");
          }else{
            print("No available places");
          }
        }else{
          print("There no trip with that id");
        }
      }
    }



    while (z) {
      print('''
-----------------------------------------------
1- Add Trip     2-Edit Trip               3-Delete Trip
4- view Trips   5-search with the price   6- Reserve 
7- Exit
-----------------------------------------------
''');
      int input = int.parse(stdin.readLineSync());

      switch (input) {
        case 1:
          add();
          break;
        case 2:
          edit();
          break;
        case 3:
          delete();
          break;
        case 4:
          view();
          break;
        case 5:
          search();
          break;
        case 6:
          reserve();
          break;
        case 7:
          z = false;
          break;
        default:
          print('Invalid');
          break;
      }
    }
  } catch (e) {
    main();
  }
}

class Trip {
  int id;
  String location;
  int passengerLimit;
  int day;
  int month;
  int year;
  int price;
  int passengersNum;

  int get availablePlaces {
    return passengerLimit - passengersNum  ;
  }

  Trip({this.id, this.location, this.passengerLimit, this.day,this.month, this.year, this.price,this.passengersNum = 0 });

  String getTrips() {
    return 'id: $id. location: $location . passenger limit: $passengerLimit. date: $day-$month-$year. price: $price';
  }

}
