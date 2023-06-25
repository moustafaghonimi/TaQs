import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:taqs/location/convertAddresse.dart';
import 'package:taqs/provider/weatherProvider.dart';




Location location = Location();
PermissionStatus? permissionStatus;
bool serviceEnable=false;
LocationData? locationData;
String? currentAddress;

Future<bool> isServicesEnable()async{
  serviceEnable =await location.serviceEnabled();
  if(serviceEnable==false){
serviceEnable=await location.requestService();
return serviceEnable;
  }
  else{
    return serviceEnable;
  }

}

Future<bool> isPermissionGranted()async{
  permissionStatus=await location.hasPermission();
  if(permissionStatus==PermissionStatus.denied){
    permissionStatus=await location.requestPermission();
    return permissionStatus==PermissionStatus.granted;

  }
  else if(permissionStatus==PermissionStatus.deniedForever){
    permissionStatus=await location.requestPermission();
    return permissionStatus==PermissionStatus.granted;
  }
  else{
    return permissionStatus==PermissionStatus.granted;
  }

}




