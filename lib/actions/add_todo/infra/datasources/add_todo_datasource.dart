abstract class AddToDoDatasource {
  Future<void> addTask({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required bool done,
  });
}
