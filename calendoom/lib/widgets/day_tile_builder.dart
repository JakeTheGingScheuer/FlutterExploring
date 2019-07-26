import 'package:localstorage/localstorage.dart';
import 'package:test_driving/models/month.dart';
import 'day_tile.dart';

class DayTileListBuilder{

  Month month;
  List<BlankTile> dayTilesForThisMonth = List<BlankTile>();
  int firstWeekdayOfTheMonth;
  LocalStorage storage;

  DayTileListBuilder(this.month, this.storage){
    firstWeekdayOfTheMonth = month.days[0].weekdayNumber;

    addBlankTiles();

    month.days.forEach((day) => dayTilesForThisMonth.add(
        DayTile(day, storage)
    ));
  }

  void addBlankTiles(){
    if(isNotSunday(firstWeekdayOfTheMonth)){
      blankTileListCreatedFor(firstWeekdayOfTheMonth).forEach(
              (blankTile) => dayTilesForThisMonth.add(blankTile));
    }
  }

  bool isNotSunday(int firstWeekdayOfTheMonth){
    return (firstWeekdayOfTheMonth < 7);
  }

  List<BlankTile> blankTileListCreatedFor(int firstWeekdayOfTheMonth){
    List<BlankTile> blankTiles = List<BlankTile>();

    for (int i = 0; i < firstWeekdayOfTheMonth; i++){
      blankTiles.add(BlankTile());
    }
    return blankTiles;
  }
}