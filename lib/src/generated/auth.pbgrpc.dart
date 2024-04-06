//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

@$pb.GrpcServiceName('AuthRpc')
class AuthRpcClient extends $grpc.Client {
  static final _$signIn = $grpc.ClientMethod<$0.UserDto, $0.TokensDto>(
      '/AuthRpc/SignIn',
      ($0.UserDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokensDto.fromBuffer(value));
  static final _$signUp = $grpc.ClientMethod<$0.UserDto, $0.TokensDto>(
      '/AuthRpc/SignUp',
      ($0.UserDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokensDto.fromBuffer(value));
  static final _$refreshToken = $grpc.ClientMethod<$0.TokensDto, $0.TokensDto>(
      '/AuthRpc/RefreshToken',
      ($0.TokensDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokensDto.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UserDto, $0.UserDto>(
      '/AuthRpc/UpdateUser',
      ($0.UserDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserDto.fromBuffer(value));
  static final _$deleteUser = $grpc.ClientMethod<$0.RequestDto, $0.ResponseDto>(
      '/AuthRpc/DeleteUser',
      ($0.RequestDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResponseDto.fromBuffer(value));
  static final _$fetchUser = $grpc.ClientMethod<$0.RequestDto, $0.UserDto>(
      '/AuthRpc/FetchUser',
      ($0.RequestDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserDto.fromBuffer(value));
  static final _$findUser = $grpc.ClientMethod<$0.FindDto, $0.ListUsersDto>(
      '/AuthRpc/FindUser',
      ($0.FindDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListUsersDto.fromBuffer(value));
  static final _$signInSms = $grpc.ClientMethod<$0.RequestDto, $0.ResponseDto>(
      '/AuthRpc/SignInSms',
      ($0.RequestDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResponseDto.fromBuffer(value));
  static final _$sendSms = $grpc.ClientMethod<$0.RequestDto, $0.TokensDto>(
      '/AuthRpc/SendSms',
      ($0.RequestDto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokensDto.fromBuffer(value));

  AuthRpcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.TokensDto> signIn($0.UserDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokensDto> signUp($0.UserDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokensDto> refreshToken($0.TokensDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserDto> updateUser($0.UserDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDto> deleteUser($0.RequestDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserDto> fetchUser($0.RequestDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUsersDto> findUser($0.FindDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDto> signInSms($0.RequestDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signInSms, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokensDto> sendSms($0.RequestDto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendSms, request, options: options);
  }
}

@$pb.GrpcServiceName('AuthRpc')
abstract class AuthRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'AuthRpc';

  AuthRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserDto, $0.TokensDto>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserDto.fromBuffer(value),
        ($0.TokensDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserDto, $0.TokensDto>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserDto.fromBuffer(value),
        ($0.TokensDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TokensDto, $0.TokensDto>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TokensDto.fromBuffer(value),
        ($0.TokensDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserDto, $0.UserDto>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserDto.fromBuffer(value),
        ($0.UserDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDto, $0.ResponseDto>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDto, $0.UserDto>(
        'FetchUser',
        fetchUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestDto.fromBuffer(value),
        ($0.UserDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FindDto, $0.ListUsersDto>(
        'FindUser',
        findUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FindDto.fromBuffer(value),
        ($0.ListUsersDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDto, $0.ResponseDto>(
        'SignInSms',
        signInSms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDto, $0.TokensDto>(
        'SendSms',
        sendSms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestDto.fromBuffer(value),
        ($0.TokensDto value) => value.writeToBuffer()));
  }

  $async.Future<$0.TokensDto> signIn_Pre($grpc.ServiceCall call, $async.Future<$0.UserDto> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.TokensDto> signUp_Pre($grpc.ServiceCall call, $async.Future<$0.UserDto> request) async {
    return signUp(call, await request);
  }

  $async.Future<$0.TokensDto> refreshToken_Pre($grpc.ServiceCall call, $async.Future<$0.TokensDto> request) async {
    return refreshToken(call, await request);
  }

  $async.Future<$0.UserDto> updateUser_Pre($grpc.ServiceCall call, $async.Future<$0.UserDto> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$0.ResponseDto> deleteUser_Pre($grpc.ServiceCall call, $async.Future<$0.RequestDto> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$0.UserDto> fetchUser_Pre($grpc.ServiceCall call, $async.Future<$0.RequestDto> request) async {
    return fetchUser(call, await request);
  }

  $async.Future<$0.ListUsersDto> findUser_Pre($grpc.ServiceCall call, $async.Future<$0.FindDto> request) async {
    return findUser(call, await request);
  }

  $async.Future<$0.ResponseDto> signInSms_Pre($grpc.ServiceCall call, $async.Future<$0.RequestDto> request) async {
    return signInSms(call, await request);
  }

  $async.Future<$0.TokensDto> sendSms_Pre($grpc.ServiceCall call, $async.Future<$0.RequestDto> request) async {
    return sendSms(call, await request);
  }

  $async.Future<$0.TokensDto> signIn($grpc.ServiceCall call, $0.UserDto request);
  $async.Future<$0.TokensDto> signUp($grpc.ServiceCall call, $0.UserDto request);
  $async.Future<$0.TokensDto> refreshToken($grpc.ServiceCall call, $0.TokensDto request);
  $async.Future<$0.UserDto> updateUser($grpc.ServiceCall call, $0.UserDto request);
  $async.Future<$0.ResponseDto> deleteUser($grpc.ServiceCall call, $0.RequestDto request);
  $async.Future<$0.UserDto> fetchUser($grpc.ServiceCall call, $0.RequestDto request);
  $async.Future<$0.ListUsersDto> findUser($grpc.ServiceCall call, $0.FindDto request);
  $async.Future<$0.ResponseDto> signInSms($grpc.ServiceCall call, $0.RequestDto request);
  $async.Future<$0.TokensDto> sendSms($grpc.ServiceCall call, $0.RequestDto request);
}
