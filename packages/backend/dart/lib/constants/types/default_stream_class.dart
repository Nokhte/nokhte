class DefaultStreamClass {
  bool isListening = false;

  // Call this method to cancel the stream
  void cancelStream() {
    isListening = false;
  }
}
