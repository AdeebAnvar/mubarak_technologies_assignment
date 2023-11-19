import '../model/cess_model.dart';
import '../model/offers_model.dart';
import '../model/tax_model.dart';

class GlobalRepo {
  static List<OffersModel> get offers => <OffersModel>[
        OffersModel(name: 'Flat 50', flatDiscount: 50),
        OffersModel(name: 'Flat 25', flatDiscount: 25),
        OffersModel(name: 'Flat 100', flatDiscount: 100),
        OffersModel(name: 'Deals', offPercent: 20),
        OffersModel(name: 'Exclusive', offPercent: 25),
      ];

  static List<TaxModel> get taxes => <TaxModel>[
        TaxModel(percent: 5, taxOnValue: true, inclusiveTax: false),
        TaxModel(percent: 7, taxOnValue: false, inclusiveTax: false),
        TaxModel(percent: 10, taxOnValue: true, inclusiveTax: false),
        TaxModel(percent: 12, taxOnValue: false, inclusiveTax: true),
        TaxModel(percent: 18, taxOnValue: true, inclusiveTax: true),
      ];

  static List<CessModel> get cesses => <CessModel>[
        CessModel(slabMin: 1000, slabMax: 2000, amount: 10, percent: 2),
        CessModel(slabMin: 1000, slabMax: 4000, amount: 10, percent: 1.5),
        CessModel(slabMin: 500, slabMax: 4000, amount: 50, percent: 1.5),
        CessModel(slabMin: 0, slabMax: 4000, amount: 10, percent: 3),
        CessModel(slabMin: 3000, slabMax: 20000, amount: 100, percent: 2),
      ];
}
