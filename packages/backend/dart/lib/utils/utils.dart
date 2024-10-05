mixin SessionUtils {
  Future<T> retry<T>({
    required Future<T> Function() action,
    int maxRetries = 3,
    Duration delay = const Duration(seconds: 1),
    bool Function(T)? shouldRetry,
  }) async {
    int attempt = 0;
    while (attempt < maxRetries) {
      final result = await action();

      // Check if the result indicates a need to retry
      if (shouldRetry != null && !shouldRetry(result)) {
        return result; // Success, no need to retry
      }

      attempt++;
      if (attempt >= maxRetries) {
        throw Exception('Operation failed after $maxRetries attempts.');
      }

      // Optionally delay before next retry
      await Future.delayed(delay);
    }

    throw Exception('Unexpected retry logic flow');
  }
}
