import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'databaseObjects/CountSheet.dart';
import 'databaseObjects/Routine.dart';

class DbInitiator {
  static const String TABLE = 'table';
  static const _databaseName = 'cheerganize.db';

  //-----------------Table names---------------------
  static const TABLE_ROUTINE_NAME = 'routine' + TABLE;
  static const TABLE_MAT_NAME = 'mat' + TABLE;
  static const TABLE_COUNT_SHEET_NAME = 'countsheet' + TABLE;
  static const TABLE_FORMATION_NAME = 'formation' + TABLE;
  static const TABLE_MUSIC_NAME = 'music' + TABLE;
  static const TABLE_ATHLETES_NAME = 'athletes' + TABLE;
  static const TABLE_PATTERN_NAME = 'pattern' + TABLE;

  //-----------------RoutineTable------------------------
  static const COLUMN_ROUTINE_ID = 'routineid';
  static const COLUMN_ROUTINE_MUSIC_ID = 'musicid';
  static const COLUMN_ROUTINE_ATHLETES_ID = 'athletesid';
  static const COLUMN_ROUTINE_FORMATION_ID = 'formationid';
  static const COLUMN_ROUTINE_COUNT_SHEET_ID = 'countsheetid';
  static const COLUMN_ROUTINE_NAME = 'name';
  static const COLUMN_ROUTINE_TYPE_OF_SPORT = 'typeofsport';

  //--------------CountSheetTable------------------------
  static const COLUMN_COUNT_SHEET_ID = 'countsheetid';
  static const COLUMN_COUNT_SHEET_MUSIC_ID = 'musicid';
  static const COLUMN_COUNT_SHEET_SKILLS = 'skills';
  static const COLUMN_COUNT_SHEET_LABEL = 'label';
  static const COLUMN_COUNT_SHEET_BPM = 'bpm';
  static const COLUMN_COUNT_SHEET_DURATION = 'duration';

  //---------------MusicTable---------------------------
  static const COLUMN_MUSIC_ID = 'musicid';
  static const COLUMN_MUSIC_TITLE = 'title';
  static const COLUMN_MUSIC_DURATION = 'duration';

  //---------------FormationTable----------------------
  static const COLUMN_FORMATION_ID = 'formationid';
  static const COLUMN_FORMATION_ROUTINE_ID = 'routineid';
  static const COLUMN_FORMATION_ATHLETES_ID = 'athletesid';
  static const COLUMN_FORMATION_MAT_ID = 'matid';
  static const COLUMN_FORMATION_PATTERN_ID = 'patternid';
  static const COLUMN_FORMATION_NAME = 'name';

  //---------------AthletesTable-----------------------
  static const COLUMN_ATHLETES_ID = 'athletesid';
  static const COLUMN_ATHLETES_X_COORDINATE = 'xcoordinate';
  static const COLUMN_ATHLETES_Y_COORDINATE = 'ycoordinate';
  static const COLUMN_ATHLETES_NAME = 'name';
  static const COLUMN_ATHLETES_COLOR = 'color';

  //---------------MatTable---------------------------
  static const COLUMN_MAT_ID = 'matid';
  static const COLUMN_MAT_PATTERN_ID = 'patternid';
  static const COLUMN_MAT_X_COORDINATE = 'xcoordinate';
  static const COLUMN_MAT_Y_COORDINATE = 'ycoordinate';

  //---------------PatternTable---------------------------
  static const COLUMN_PATTERN_ID = 'patternid';
  static const COLUMN_PATTERN_URL = 'url';

  //---------------DatabaseInitiatorCredentials------------------------
  DbInitiator._privateConstructor();

  static final DbInitiator instance = DbInitiator._privateConstructor();

  String path;

  DbInitiator._();

  static final DbInitiator db = DbInitiator._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await init();
    return _database;
  }

  init() async {
    String path = await getDatabasesPath();
    path = join(path, _databaseName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      //-----------------RoutineTable------------------------
      await db.execute('''
          CREATE TABLE $TABLE_ROUTINE_NAME (
            $COLUMN_ROUTINE_ID INTEGER PRIMARY KEY,
            $COLUMN_ROUTINE_MUSIC_ID INTEGER,
            $COLUMN_ROUTINE_ATHLETES_ID INTEGER,
            $COLUMN_ROUTINE_FORMATION_ID INTEGER,
            $COLUMN_ROUTINE_COUNT_SHEET_ID INTEGER,
            $COLUMN_ROUTINE_NAME TEXT,
            $COLUMN_ROUTINE_TYPE_OF_SPORT TEXT,
            FOREIGN KEY ($COLUMN_ROUTINE_MUSIC_ID) REFERENCES $TABLE_MUSIC_NAME
            ($COLUMN_MUSIC_ID)ON DELETE NO ACTION ON UPDATE NO ACTION,
            FOREIGN KEY ($COLUMN_ROUTINE_ATHLETES_ID) REFERENCES 
            $TABLE_ATHLETES_NAME
            ($COLUMN_ATHLETES_ID)ON DELETE NO ACTION ON UPDATE NO ACTION,
            FOREIGN KEY ($COLUMN_ROUTINE_FORMATION_ID) REFERENCES 
            $TABLE_FORMATION_NAME
            ($COLUMN_FORMATION_ID)ON DELETE NO ACTION ON UPDATE NO ACTION,
            FOREIGN KEY ($COLUMN_ROUTINE_COUNT_SHEET_ID) REFERENCES 
            $TABLE_COUNT_SHEET_NAME
            ($COLUMN_COUNT_SHEET_ID)ON DELETE NO ACTION ON UPDATE NO ACTION )
          ''');
      //--------------CountSheetTable------------------------
      await db.execute('''
          CREATE TABLE $TABLE_COUNT_SHEET_NAME (
            $COLUMN_COUNT_SHEET_ID INTEGER PRIMARY KEY,
            $COLUMN_COUNT_SHEET_MUSIC_ID INTEGER,
            $COLUMN_COUNT_SHEET_SKILLS TEXT,
            $COLUMN_COUNT_SHEET_LABEL TEXT,
            $COLUMN_COUNT_SHEET_BPM INTEGER,  
            $COLUMN_COUNT_SHEET_DURATION DOUBLE PRECISION,            
           FOREIGN KEY ($COLUMN_COUNT_SHEET_MUSIC_ID) REFERENCES 
           $TABLE_MUSIC_NAME
            ($COLUMN_MUSIC_ID)ON DELETE NO ACTION ON UPDATE NO ACTION )
          ''');
      //---------------MusicTable----------------------------
      await db.execute('''
          CREATE TABLE $TABLE_MUSIC_NAME (
            $COLUMN_MUSIC_ID INTEGER PRIMARY KEY,
            $COLUMN_MUSIC_TITLE TEXT,
            $COLUMN_MUSIC_DURATION DOUBLE PRECISION )
          ''');
      //---------------FormationTable------------------------
      await db.execute('''
           CREATE TABLE $TABLE_FORMATION_NAME (
           $COLUMN_FORMATION_ID INTEGER PRIMARY KEY,
           $COLUMN_FORMATION_ROUTINE_ID  INTEGER,
           $COLUMN_FORMATION_ATHLETES_ID INTEGER,
           $COLUMN_FORMATION_MAT_ID INTEGER,
           $COLUMN_FORMATION_PATTERN_ID INTEGER,
            $COLUMN_FORMATION_NAME TEXT,
             FOREIGN KEY ($COLUMN_FORMATION_ROUTINE_ID) REFERENCES 
             $TABLE_ROUTINE_NAME
            ($COLUMN_ROUTINE_ID)ON DELETE NO ACTION ON UPDATE NO ACTION,
             FOREIGN KEY ($COLUMN_FORMATION_ATHLETES_ID) REFERENCES 
             $TABLE_ATHLETES_NAME
            ($COLUMN_ATHLETES_ID)ON DELETE NO ACTION ON UPDATE NO ACTION,
             FOREIGN KEY ($COLUMN_FORMATION_MAT_ID) REFERENCES 
             $TABLE_MAT_NAME
            ($COLUMN_MAT_ID)ON DELETE NO ACTION ON UPDATE NO ACTION,
             FOREIGN KEY ($COLUMN_FORMATION_PATTERN_ID) REFERENCES 
             $TABLE_PATTERN_NAME
            ($COLUMN_PATTERN_ID)ON DELETE NO ACTION ON UPDATE NO ACTION )
          ''');
      //---------------AthletesTable-------------------------
      await db.execute('''
          CREATE TABLE $TABLE_ATHLETES_NAME (
            $COLUMN_ATHLETES_ID INTEGER PRIMARY KEY,
            $COLUMN_ATHLETES_X_COORDINATE DOUBLE PRECISION,
            $COLUMN_ATHLETES_Y_COORDINATE DOUBLE PRECISION,
            $COLUMN_ATHLETES_NAME TEXT,
            $COLUMN_ATHLETES_COLOR TEXT)
          ''');
      //---------------MatTable------------------------------
      await db.execute('''
          CREATE TABLE $TABLE_MAT_NAME (
            $COLUMN_MAT_ID INTEGER PRIMARY KEY,
            $COLUMN_MAT_PATTERN_ID INTEGER,
             $COLUMN_MAT_X_COORDINATE DOUBLE PRECISION,
            $COLUMN_MAT_Y_COORDINATE DOUBLE PRECISION,
            FOREIGN KEY ($COLUMN_MAT_PATTERN_ID) REFERENCES 
             $TABLE_PATTERN_NAME
            ($COLUMN_PATTERN_ID)ON DELETE NO ACTION ON UPDATE NO ACTION )
          ''');
      //---------------PatternTable--------------------------
      await db.execute('''
          CREATE TABLE $TABLE_PATTERN_NAME (
            $COLUMN_PATTERN_ID INTEGER PRIMARY KEY,
            $COLUMN_PATTERN_URL TEXT )
          ''');
    });
  }

  Future<int> insert(Map<String, dynamic> row, String tableName) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<int> delete(String idName, int id, String tableName) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$idName = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future<int> updateRoutineObject(Routine routine) async {
    Database db = await instance.database;
    return await db.update(TABLE_ROUTINE_NAME, routine.toMapWithoutId(),
        where: 'routineid =?', whereArgs: [routine.routineid]);
  }

  Future<List<CountSheet>> getCountSheetObjects() async {
    Database db = await instance.database;
    // Query the table
    final List<Map<String, dynamic>> maps =
        await db.query(TABLE_COUNT_SHEET_NAME);
    // Convert the List<Map<String, dynamic> into a List<CountSheet>.
    return List.generate(maps.length, (i) {
      return CountSheet.buildFromDb(
          maps[i]['countsheetid'],
          maps[i]['bpm'],
          maps[i]['duration'],
          maps[i]['skills'],
          maps[i]['label'],
          maps[i]['musicid']);
    });
  }

  Future<CountSheet> getCountSheetObjectFromDb(String countSheetLabel) async {
    CountSheet relevantCountSheet;
    List<CountSheet> countSheetObject = await db.getCountSheetObjects();
    countSheetObject.forEach((sheet) {
      if (sheet.label == countSheetLabel) {
        relevantCountSheet = CountSheet.buildFromDb(sheet.countsheetid, sheet.bpm,
            sheet.duration, sheet.skills, sheet.label, sheet.musicid);
      }
    });
    return relevantCountSheet;
  }

  Future<List<Routine>> getRoutineObjects() async {
    Database db = await instance.database;
    // Query the table
    final List<Map<String, dynamic>> maps = await db.query(TABLE_ROUTINE_NAME);
    // Convert the List<Map<String, dynamic> into a List<CountSheet>.
    return List.generate(maps.length, (i) {
      return Routine.buildFromDb(
          maps[i]['routineid'],
          maps[i]['musicid'],
          maps[i]['athletesid'],
          maps[i]['formationid'],
          maps[i]['countsheetid'],
          maps[i]['name'],
          maps[i]['typeofsport']);
    });
  }

  Future<Routine> getRoutineObjectFromDb(String routineName) async {
    Routine updateRoutine;
    List<Routine> routineObjectlist = await db.getRoutineObjects();
    routineObjectlist.forEach((element) {
      if (element.name == routineName) {
        updateRoutine = Routine.buildFromDb(
            element.routineid,
            element.musicid,
            element.athletesid,
            element.formationid,
            element.countsheetid,
            element.name,
            element.typeofsport);
      }
    });
    return updateRoutine;
  }

  Future<int> updateCountSheetObject(CountSheet countSheet) async {
    Database db = await instance.database;
    return await db.update(TABLE_COUNT_SHEET_NAME, countSheet.toMapWithoutId(),
        where: 'countsheetid =?', whereArgs: [countSheet.countsheetid]);
  }

  Future<int> queryRowCount(String tableName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  void printAll(String tableName) async {
    final allRows = await DbInitiator.db.queryAllRows(tableName);
    allRows.forEach((element) {
      print(element);
    });
  }
}
