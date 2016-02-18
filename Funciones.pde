void loadData() {
  json= loadJSONObject("data.json");// inicializo mi objeto y cargo mi archivo JSON 
  JSONArray ubicaciones= json.getJSONArray("ubicaciones"); // CREO Y COJO mi array "ubicaciones" dentro de mi json
  for ( int i=0; i<ubicaciones.size (); i++) { /// CREO un loop para poder coger todos los datos dentro de cada objeto de mi array
    JSONObject objetos= ubicaciones.getJSONObject(i); // coger todos los objetos disponibles dentro de mi array ubicaciones
    double lat= objetos.getFloat("verbat_latitud_ubicacion"); // cogo mi flaot "elevacionubicacion" de cada uno de mi objetos
    double lon= objetos.getFloat("verbat_longitud_ubicacion");
    UTMRef conversion = new UTMRef(lat, lon, 'M', 17); // declaro y creo mi variable UTMref de mi libreria para convertir valores de lat y long.
    String conversionlatlng=conversion.toLatLng().toString();  
    String text1 = conversionlatlng.substring (1, conversionlatlng.length()-1  ); // (indice primero, indice final) como los extremos.
    float [] valorlatlng= float(split(text1, ","));
    Location location = new Location(valorlatlng[0], valorlatlng[1]);
    locations.add(location);
    println(location);
  }
}

