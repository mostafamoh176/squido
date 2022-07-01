class DifferenSize{
  static const double appWidth=1080;
  static const double appHeight=2728;
  static const double carousalHeight=675;
  static const double carousalWidth=1080;
}
class CommonUse{
  static const String BASE_URL="https://api.themoviedb.org/3/person/popular?api_key=dc8885f9816eb98abd46a772b382b73f&language=en-US&page=";
  static const String CASHEDNETWORK="CASHED_DATA";
  static const String failureServer="Please Try Again later";
  static const String EmptyCashMsg="No Data";
  static const String OfflineFailureMsg="Please Check Your Internet Connection";
  static const String defaultFailureMsg="Please Check Your Internet Connection";

}

extension NumberParsing on String {
  double toDouble() {
    return double.parse(this);
  }
}