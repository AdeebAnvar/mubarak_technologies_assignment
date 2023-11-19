import 'dart:math';

import '../model/dormitory_bed_model.dart';
import '../model/dormitory_model.dart';
import '../model/dormitory_rooms_model.dart';
import '../model/food_model.dart';
import 'global_repository.dart';

class DormitoriesRepository {
  List<DormitoryModel> getDormitories() => <DormitoryModel>[
        DormitoryModel(
          name: 'CNS Stadium',
          imageUrls: <String>[
            'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/htl-imgs/201705030821398994-c02ad4d40c9911e7b9730a9df65c8753.jpg',
            'https://www.momondo.in/himg/52/36/f7/expediav2-2785162-7e1e8e-065755.jpg'
          ],
          badgeText: '',
          userRating: 3,
          activities: <String>[
            'swimming',
            'badminton',
            'photoshoot',
            'scubaDiving'
          ],
          fecilities: <String>[
            'King Bed',
            'Bed',
            'Highway View',
            'Refreshments',
            'Vallet parking',
            'Bussiness lounge',
            'Multi Gym',
            'Shuttle',
            'Bussiness Lounge'
          ],
          rooms: _getRooms(),
        ),
      ];

  List<DormitoryRoomModel> _getRooms() => <DormitoryRoomModel>[
        DormitoryRoomModel(
            rows: 6,
            columns: 2,
            beds: _generateBeds(6, 2, 1, price: 220),
            no: '1A',
            roomType: 'Dormitory',
            amenities: _amenities,
            name: 'Single Bed',
            maxOccupents: 12,
            offers: GlobalRepo.offers[1],
            taxPercent: GlobalRepo.taxes[2],
            imageUrls: <String>[
              'https://media-cdn.tripadvisor.com/media/photo-m/1280/19/7b/60/1d/beds-in-ac-dormitory.jpg'
            ]),
        DormitoryRoomModel(
            rows: 6,
            columns: 2,
            beds: _generateBeds(6, 2, 2, price: 200),
            no: '1B',
            roomType: 'Dormitory',
            amenities: _amenities,
            foods: _getFoods(),
            name: '8 Bunk Bed',
            maxOccupents: 10,
            offers: GlobalRepo.offers[0],
            taxPercent: GlobalRepo.taxes[1],
            imageUrls: <String>[
              'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/room-imgs/202001301547504165-221416-7a91671c4d8711eab3030242ac110003.jpg'
            ]),
        DormitoryRoomModel(
            rows: 6,
            columns: 2,
            beds: _generateBeds(6, 2, 3),
            no: '1C',
            roomType: 'Dormitory',
            amenities: _amenities,
            name: '3 Level Bunk Bed',
            maxOccupents: 12,
            offers: GlobalRepo.offers[1],
            taxPercent: GlobalRepo.taxes[2],
            imageUrls: <String>[
              'https://5.imimg.com/data5/OQ/LH/YJ/SELLER-10345626/ac-dormitories-rental-service.png'
            ]),
        DormitoryRoomModel(
            rows: 8,
            columns: 2,
            beds: _generateBeds(8, 2, 4, price: 200),
            no: '1D',
            roomType: 'Dormitory',
            amenities: _amenities,
            foods: _getFoods(),
            name: '4 Level Bunk Bed',
            maxOccupents: 16,
            cess: GlobalRepo.cesses[4],
            offers: GlobalRepo.offers[1],
            taxPercent: GlobalRepo.taxes[2],
            imageUrls: <String>[
              'https://3.imimg.com/data3/CN/HS/MY-3538801/var-m_0-0e-0e2-6662-79802-2.png'
            ]),
        DormitoryRoomModel(
            rows: 6,
            columns: 1,
            beds: _generateBeds(6, 1, 1, price: 230),
            no: '1A',
            roomType: 'Dormitory',
            amenities: _amenities,
            name: 'Executive Single Bed (1Row)',
            maxOccupents: 6,
            offers: GlobalRepo.offers[1],
            cess: GlobalRepo.cesses[2],
            taxPercent: GlobalRepo.taxes[2],
            imageUrls: <String>[
              'https://media-cdn.tripadvisor.com/media/photo-m/1280/19/7b/60/1d/beds-in-ac-dormitory.jpg'
            ]),
        DormitoryRoomModel(
            rows: 6,
            columns: 1,
            beds: _generateBeds(6, 1, 2, price: 180),
            no: '1B',
            roomType: 'Dormitory',
            amenities: _amenities,
            foods: _getFoods(),
            name: '3 Level Bunk Bed (1 Row)',
            maxOccupents: 9,
            offers: GlobalRepo.offers[1],
            taxPercent: GlobalRepo.taxes[2],
            cess: GlobalRepo.cesses[3],
            imageUrls: <String>[
              'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/room-imgs/202001301547504165-221416-7a91671c4d8711eab3030242ac110003.jpg'
            ]),
        DormitoryRoomModel(
            rows: 6,
            columns: 1,
            beds: _generateBeds(6, 1, 3).sublist(10),
            no: '1C',
            roomType: 'Dormitory',
            amenities: _amenities,
            name: '4 Level Bunk Bed (1 Row)',
            maxOccupents: 8,
            offers: GlobalRepo.offers[4],
            taxPercent: GlobalRepo.taxes[0],
            cess: GlobalRepo.cesses[0],
            imageUrls: <String>[
              'https://5.imimg.com/data5/OQ/LH/YJ/SELLER-10345626/ac-dormitories-rental-service.png'
            ]),
        DormitoryRoomModel(
            rows: 8,
            columns: 1,
            beds: _generateBeds(8, 1, 4),
            no: '1D',
            roomType: 'Dormitory',
            amenities: _amenities,
            foods: _getFoods(),
            name: '2 Level Bunk Bed (1 Row)',
            maxOccupents: 6,
            offers: GlobalRepo.offers[1],
            taxPercent: GlobalRepo.taxes[2],
            imageUrls: <String>[
              'https://3.imimg.com/data3/CN/HS/MY-3538801/var-m_0-0e-0e2-6662-79802-2.png'
            ]),
      ];

  List<FoodModel> _getFoods() => <FoodModel>[
        FoodModel(name: 'Breakfast', price: 538),
        FoodModel(name: 'Lunch', price: 750),
        FoodModel(name: 'Dinner', price: 750),
      ];

  List<String> get _amenities => <String>[
        'drink',
        'wifi',
        'shower',
        'sofa',
        'balcony',
      ];

  List<DormitoryBedModel> _generateBeds(int rows, int columns, int level,
      {double price = 150}) {
    final List<DormitoryBedModel> beds = <DormitoryBedModel>[];

    List<dynamic>.generate(columns, (int col) {
      final String cn = String.fromCharCode(65 + col);
      List<dynamic>.generate(rows, (int row) {
        List<dynamic>.generate(level, (int lvl) {
          final bool isOccupied = Random().nextBool();
          beds.add(DormitoryBedModel(
              column: col,
              row: row,
              level: lvl,
              bedNo: '${row + 1}$cn${lvl + 1}',
              isOccuppied: isOccupied,
              isUpperDeck: lvl != 0,
              price: price + (Random().nextInt(4) * 10)));
        });
      });
    });

    return beds;
  }
}
