import 'package:flutter_grpc_chat/features/files/domain/i_files_repo.dart';

final class MockFilesRepo implements IFilesRepo {
  @override
  String get name => 'MockFilesRepo';
}
