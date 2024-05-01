// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'database_service.dart';
import 'up_boxes.dart';

class HiveDatabaseService implements DatabaseService {
  @override
  Future<void> create(
      {required dynamic collection, String? key, dynamic value}) async {
    if (collection is UpBoxes) {
      final boxT = await _openBox<Map>(collection);

      final mappedValue = {"data": value};
      await boxT.put(key, mappedValue);
    } else {
      throw Exception("`collection` must be of type UpBoxes");
    }
  }

  @override
  Future<Map<String, dynamic>> retrieve({
    required dynamic collection,
    String? key,
    required dynamic notFoundDefault,
  }) async {
    if (collection is UpBoxes) {
      final boxT = await _openBox<Map>(collection);
      final boxTContent = boxT.get(key);

      return boxTContent?.cast<String, dynamic>() ?? {'data': notFoundDefault};
    } else {
      throw Exception("`collection` must be of type UpBoxes");
    }
  }

  @override
  Future<void> update(
          {required dynamic collection, String? key, dynamic value}) async =>
      create(collection: collection, key: key, value: value);

  @override
  Future<void> delete({required dynamic collection, String? key}) async {
    if (collection is UpBoxes) {
      final boxT = await _openBox<Map>(collection);
      await boxT.delete(key);
    } else {
      throw Exception("`collection` must be of type UpBoxes");
    }
  }

  @override
  Future<void> clearData() async {
    await _clearBox<Map>(UpBoxes.pin);
    await _clearBox<Map>(UpBoxes.users);
    await _clearBox<Map>(UpBoxes.settings);
  }

  /*
   *
   * Methods below are helpers that handle the actual DB implementation 
   * details of opening and reading to and from the DB.
   * These details would be different (of course) depending on what
   * underlying DB is used as backing. These are all private methods
   * because they should ideally be hidden from the outside world.
   */

  String _getBoxId(UpBoxes box) => box.index.toStringAsExponential();

  Future<Box<T>> _openBox<T>(UpBoxes box) async {
    Box<T> boxT;
    final boxId = _getBoxId(box);

    if (Hive.isBoxOpen(boxId)) {
      boxT = Hive.box<T>(boxId);
    } else {
      try {
        boxT = await Hive.openBox<T>(boxId);
      } catch (_) {
        await Hive.deleteBoxFromDisk(boxId);
        boxT = await Hive.openBox<T>(boxId);
      }
    }

    return boxT;
  }

  Future<void> _clearBox<T>(UpBoxes box) async {
    try {
      final Box<T> boxT = await _openBox<T>(box);
      await boxT.clear();

      await boxT.deleteFromDisk();
    } catch (_) {}
  }
}
