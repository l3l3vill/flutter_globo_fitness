import 'package:http/http.dart' as http; // as is casting, is adding an alias 

class HttpHelper {
  //the following line is a URI
  //https://api.openweathermap.org/data/2.5/weather?q=bogota&appid=84791250baac3ece57bdfcecd2930f65
  //these are the constants related to the URI (URL) :
  //https:// -> is the protocol
  final String authority ='api.openweathermap.org'; //-> is the authority, whuose author
  final String path ='data/2.5/weather'; //-> is the path, the way to get acces to the information we want
  final String apiKey ='84791250baac3ece57bdfcecd2930f65'; //-> is the key the author give us to can have access to their info
  //this part of the URI is variable, we are going to complete it with an asyncrhonous function
  //https:q=bogota// -> is the parametrer, it is variable
  
  //asynchronous function
  //it will return a FUTURE value type String with this async method 
  Future<String> getWeather (String location) async {
    //we will retourn a map with keys Strings and values "dynamic" because they will change
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey };
    //now we have everithing ready to build the URI
    Uri uri = Uri.https(authority, path, parameters);
    //asynchronous call - now we are going to have the result inside this uri. await in a secuancial way to run the tasks inside the async function  
    //when there is an async function, there would be also an await next to the "futures" values that will be returned
    http.Response result = await http.get(uri);
    return result.body;
  }


}
