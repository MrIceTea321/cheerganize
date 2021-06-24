import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:sembast/sembast.dart';

import '../DbInitiator.dart';

class RoutineDao {
  static const String ROUTINE_STORE_NAME = 'routine';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _routineStore = intMapStoreFactory.store(ROUTINE_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Routine routine) async {
    await _routineStore.add(await _db, routine.toMap());
  }

  // Get a countSheet by name
  Future<Routine> getRoutine(int id) async {
    var map = await _routineStore.record(id).get(await _db);
    return map == null ? null : Routine.buildFromMap(map);
  }

  // Get a routine by name
  Future<Routine> getRoutineByName(String name) async {
    final finder = Finder(filter: Filter.equals('name', name));
    final recordSnapshots = await _routineStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots
        .map((snapshot) => new Routine(
            id: snapshot.key,
            name: snapshot.value.entries.elementAt(1).key,
            typeofsport: snapshot.value.entries.elementAt(2).key))
        .firstWhere((element) => element.name == name);
  }

  Future update(Routine routine) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(routine.id));
    await _routineStore.update(
      await _db,
      routine.toMap(),
      finder: finder,
    );
  }

  Future delete(Routine routine) async {
    final finder = Finder(filter: Filter.byKey(routine.id));
    await _routineStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Routine>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _routineStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final routine = Routine.buildFromMap(snapshot.value);
      print(routine);
      // An ID is a key of a record from the database.
      routine.id = snapshot.key;
      return routine;
    }).toList();
  }
}
