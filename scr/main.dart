import 'Chief.dart';

void main() {
  var arr = ["firstWord", "secondWord", "thirdWord", "forthWord", "fifthWord",
    "sixthWord", "seventhWord"];
  print(arr);
  bubleSort(arr);
  print("\n");

  var potato = new Potato("картоха", 300);
  var broccoli = new Broccoli("брокколи", 200);
  var cream = new Cream("сливки", 100);
  var recipe = new Recipe("Суп-пюре",
                          [["prepare", potato], ["prepare", broccoli], ["prepare", cream], ["mix", potato, broccoli, cream] ]);
  var chief = new Chief(recipe);
  chief.cook();
  chief.serve();

}

void bubleSort(List<String> array){
  for(int i = 0; i<array.length-1; i++){
    for(int j = i+1; j<array.length; j++){
      if(array[i].compareTo(array[j])>0){
        var buffer = array[i];
        array[i] = array [j];
        array[j] = buffer;
      }
    }
    print(array);
  }
}
