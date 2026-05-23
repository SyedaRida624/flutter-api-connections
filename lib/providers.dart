import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models.dart';
import '../services.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final usersProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.read(apiServiceProvider).fetchUsers();
});