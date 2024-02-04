import 'package:flutter_grpc_chat/features/chats/domain/i_chats_repo.dart';

final class ProdChatsRepo implements IChatsRepo {
  @override
  String get name => 'ProdChatsRepo';
}
