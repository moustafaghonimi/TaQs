import 'package:location/location.dart';


Location location = Location();
PermissionStatus? permissionStatus;
bool serviceEnable=false;
LocationData? locationData;

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

getCurrentLocation()async{
  var permission=await isPermissionGranted();
  if(permission==false) return;
  var services=await isServicesEnable();
  if(services==false) return;

  locationData= await location.getLocation();
  print('lat ${locationData?.latitude} , long ${locationData?.longitude}');


}
