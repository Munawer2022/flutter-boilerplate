import 'package:equatable/equatable.dart';

class MockProfileSuccessModel extends Equatable {
  const MockProfileSuccessModel();



  MockProfileSuccessModel copyWith() {
    return MockProfileSuccessModel();
  }

  factory MockProfileSuccessModel.empty() =>
      const MockProfileSuccessModel();

  @override
  List<Object?> get props => [

      ];
}

/*
{
	"id": 15,
	"username": "kminchelle",
	"email": "kminchelle@qq.com",
	"firstName": "Jeanne",
	"lastName": "Halvorson",
	"gender": "female",
	"image": "https://robohash.org/Jeanne.png?set=set4",
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvSmVhbm5lLnBuZz9zZXQ9c2V0NCIsImlhdCI6MTcxNDU2OTc0MywiZXhwIjoxNzE0NTczMzQzfQ.-JEN36WJ55Es2NQ0bVDf7xTTDoDI5J6Cqkk5-2MWKaE"
}*/
