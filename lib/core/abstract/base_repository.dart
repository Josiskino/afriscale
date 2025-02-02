import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';
import '../utils/api_response.dart';
import '../utils/api_response_exception.dart';
import '../utils/network_info.dart';

abstract class BaseRepository {
  final NetworkInfo networkInfo;

  BaseRepository(this.networkInfo);

  Future<Either<Failure, T>> execute<T>(Future<ApiResponse<T>> Function() action) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final response = await action();
      return response.success
        ? Right(response.data!)
        : Left(_mapResponseToFailure(response));
        
    } on ApiException catch (e) {
      return Left(_handleApiException(e));
      
    } on TimeoutException {
      return Left(NetworkFailure('Request timeout'));
      
    } catch (e, stackTrace) {
      return Left(UnexpectedFailure(e.toString(), stackTrace));
    }
  }

  Failure _mapResponseToFailure(ApiResponse response) {
    switch (response.statusCode) {
      case 401:
        return AuthFailure(response.message ?? 'Unauthorized');
      case 403:
        return ForbiddenFailure(response.message ?? 'Forbidden');
      case 404:
        return NotFoundFailure(response.message ?? 'Not found');
      default:
        return BusinessFailure(response.message ?? 'Operation failed');
    }
  }

  Failure _handleApiException(ApiException e) {
    if (e.statusCode == 401) {
      // TODO: Trigger logout
      return AuthFailure(e.message);
    }
    return BusinessFailure(e.message);
  }
}

// Add new failure types
class AuthFailure extends Failure {
  AuthFailure(super.message);
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure(super.message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(super.message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure(super.message, [super.stackTrace]);
}