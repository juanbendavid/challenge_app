import 'package:intl/intl.dart';

class ProductUtils {
  static String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String getCalculatedPriceWithDiscount(double price, double discountPercentage) {
    final discount = price * (discountPercentage / 100);
    return (price - discount).toStringAsFixed(2);
  }
}
