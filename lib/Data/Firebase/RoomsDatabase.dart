import 'package:chat/Models/Room/RoomDTO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomsDatabase {

  // obtain the singleton pattern
  RoomsDatabase._();
  static RoomsDatabase? _instance ;
  static getRoomDatabase(){
    _instance ??= RoomsDatabase._();
    return _instance;
  }

  // get the collection reference from firebase
  CollectionReference<RoomDTO> getRoomCollectionReference (){
    return FirebaseFirestore.instance.collection("Rooms").withConverter(
        fromFirestore: (snapshot, options) => RoomDTO.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore(),
    );
  }

  // add room to the database
  Future<String> addRoom(RoomDTO room)async{
    var ref = getRoomCollectionReference();
    var doc = ref.doc();
    room.id = doc.id;
    await doc.set(room);
    return room.id;
  }

  Future<void> updateRoomData(RoomDTO room)async{
    var ref = getRoomCollectionReference();
    var doc = ref.doc(room.id);
    await doc.update(room.toFireStore());
  }

  // get the data of the rooms
  Stream<QuerySnapshot<RoomDTO>> getPublicRooms(){
    var ref = getRoomCollectionReference();
    var data = ref.where("type" , isEqualTo: "Public").snapshots();
    return data;
  }

  // get the data of the rooms
  Stream<QuerySnapshot<RoomDTO>> getUserRooms(String uid){
    var ref = getRoomCollectionReference();
    var data = ref.where("users" , arrayContains: uid).snapshots();
    return data;
  }

  // get room by id
  Future<RoomDTO> getRoomById(String roomId)async{
    var ref = getRoomCollectionReference();
    var doc = await ref.doc(roomId).get();
    return doc.data()!;
  }
  
  // get rooms for search 
  Future<List<RoomDTO>> getSearchRooms(String query)async{
    var ref = await getRoomCollectionReference().where('name' , isEqualTo: query).get();
    return ref.docs.map((e) => e.data()).toList();
  }

  // delete room from data base
  Future<void> deleteRoom(String roomId)async{
    var ref  =  getRoomCollectionReference();
    var doc = ref.doc(roomId);
    await doc.delete();
  }

}