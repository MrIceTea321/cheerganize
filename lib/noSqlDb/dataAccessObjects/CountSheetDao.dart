import 'package:cheerganize/noSqlDb/AppDatabase.dart';
import 'package:cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:sembast/sembast.dart';

class CountSheetDao {
  static const String COUNTSHEET_STORE_NAME = 'countSheet';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _countSheetStore = intMapStoreFactory.store(COUNTSHEET_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(CountSheet countSheet) async {
    await _countSheetStore.add(await _db, countSheet.toMap());
  }

  // Get a countSheet by name
  Future<CountSheet> getCountSheet(int id) async {
    var map = await _countSheetStore.record(id).get(await _db);
    return map == null ? null : CountSheet.buildFromMap(map);
  }

  Future update(CountSheet countSheet) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(countSheet.id));
    await _countSheetStore.update(
      await _db,
      countSheet.toMap(),
      finder: finder,
    );
  }

  Future delete(CountSheet countSheet) async {
    final finder = Finder(filter: Filter.byKey(countSheet.id));
    await _countSheetStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<CountSheet>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _countSheetStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final countSheet = CountSheet.buildFromMap(snapshot.value);
      // An ID is a key of a record from the database.
      countSheet.id = snapshot.key;
      return countSheet;
    }).toList();
  }
}
