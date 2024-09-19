import 'package:challenge_app/config/utils/funciones.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductUtils', () {
    test('getFormattedDate returns correct format', () {
      final date = DateTime(2024, 5, 23);
      final result = ProductUtils.getFormattedDate(date);
      expect(result, '23/05/2024');
    });

    test('getCalculatedPriceWithDiscount returns correct value', () {
      const price =  19.99;
      const discount = 5.5; 
      final result = ProductUtils.getCalculatedPriceWithDiscount(price, discount);
      expect(result, "18.89");
    });
  });
}
