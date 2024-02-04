import 'package:flutter_grpc_chat/features/files/domain/i_files_repo.dart';

final class ProdFilesRepo implements IFilesRepo {
  @override
  String get name => 'ProdFilesRepo';
}
