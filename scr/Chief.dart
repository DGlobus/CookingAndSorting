
class Chief{

  Recipe recipe;
  late Mixture result;

  Chief(this.recipe);

  void cook(){
    for(int i = 0; i<recipe.ingredients.length; i++){

      var currentRecipeLine = recipe.ingredients[i];
      var action = currentRecipeLine[0] as String;
      Ingredient firstIngredient = currentRecipeLine[1] as Ingredient;

      switch(action){
        case "prepare": firstIngredient.prepare();
          break;
        case "mix": {
          mixEverythingInCurrentLine(firstIngredient, currentRecipeLine);
          break;
        }
      }
    }
  }

  void mixEverythingInCurrentLine(Ingredient firstIngredient, List<Object> currentRecipeLine) {

    result = firstIngredient.mix(currentRecipeLine[2] as Ingredient);

    for(int j = 3; j<currentRecipeLine.length; j++){
      result = result.mix(currentRecipeLine[j]as Ingredient);
      result.prepare();
    }
  }

  void serve(){
    print("Я приготовил " + recipe.name + " из "+ result.name);
  }
}

abstract class Ingredient{

  String name;
  double mass;

  Ingredient(this.name, this.mass);

  void prepare();

  Mixture mix(Ingredient ing){
    print("Смешали "+name + " с " + ing.name);
    return new Mixture(name + " + " + ing.name, mass+ing.mass);
  }
}

class Mixture extends Ingredient{

  Mixture(super.name, super.mass);

  @override
  Mixture mix(Ingredient ing) {

    print("Смешали " + name + " с " + ing.name);
    mass+=ing.mass;
    name+=" + " + ing.name;
    return this;
  }

  @override
  void prepare() {
    print("Тщательно перемешиваем " + name);
  }
}

class Potato extends Ingredient{
  Potato(super.name, super.mass);

  @override
  void prepare() {
    mass-= mass*0.05;
    print("Картоха почищена и отварена");
  }

}

class Broccoli extends Ingredient{
  Broccoli(super.name, super.mass);

  @override
  void prepare() {
    print("Помыли и отварили брокколи");
  }

}

class Cream extends Ingredient{
  Cream(super.name, super.mass);

  @override
  void prepare() {
    print("Вскрыли пачку сливок");
  }

}

class Recipe{

  List<List<Object>> ingredients;
  String name;

  Recipe(this.name, this.ingredients);
}