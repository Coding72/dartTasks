//#region [rgba(165,245,205,0.1)] =====  =====
  /**
   * @todo
  */
//#endregion =====  =====

//#region [rgba(165,245,205,0.1)] ===== imports =====
  import "dart:io";
//#endregion ===== imports =====

//#region [rgba(165,245,205,0.1)] ===== globals =====
  List<Map<String,bool>> todoList = [];  // id->{"todo":done?}   
  String tab = "    ";
//#endregion ===== globals =====

void main(){
  stdout.write('\x1B[2J\x1B[H');
  printUsage_EN();  

  handleInput();

}

void testSetValues(){
  addTask("fadsfds");
  addTask("     ");
  addTask("fadsfdsasdf");
  addTask("fadsfds3333");  
  showList("undone");
  int? number = int.tryParse("2"); setDone(number??-1);
  setDone(0);
  setDone(1,false);
  showList("done");
}

void printUsage_EN(){
  String usage = 
  """
    Usage:
      help                   - print usage
      add <task>             - add task
      remove <index>         - remove task
      reset                  - remove all tasks
      clear                  - clear Screen
      list                   - list tasks
      list.done              - list tasks that are done
      list.undone            - list tasks that are done
      done <index>           - mark task as done
      undone <index>         - mark task as undone
      exit                   - exit program
  """;
  usage = 
  """
    Usage:
      add <todo>      
      list
      done <todo-ID>
      exit
  """;
  print(usage);
}

void handleInput(){
  
  Map<String, String> checkInput(String userInput){ //no subcmds
    List<String> commands = ["add", "list", "exit", "done", "clear", "undone", "remove", "list.done", "list.undone", "reset", "help"];
    Map<String, String>  inputs = {};
    String cmd = "";
    String parameter = "";
    bool foundSpace = false;
    for (int i=0; i<userInput.length; i++){
      if (!foundSpace) {
        if (userInput[i]!=" ") {    
          cmd+=userInput[i];       
        } else { foundSpace = true;  } // bad:foundSpace=!foundSpace
      } else {
        parameter+=userInput[i];
      }
    }
   
    for (int i=0; i<commands.length;i++){ if (commands[i] == cmd){ /*print ("found ${cmd}"); */} }

    inputs["cmd"] = cmd;
    inputs["param1"] = parameter;
    return inputs;
  };

  while (true){
   
    stdout.write("    > ");
    String? userInput = stdin.readLineSync();
    Map<String, String> inputs = checkInput(userInput??"");
    
    switch (inputs["cmd"]){
      case "add"          : addTask(inputs["param1"]??""); // list auto? add datum
      case "remove"       : int? number = int.tryParse(inputs["param1"]??""); removeTask(number??-1); // list auto? change datum
      case "list"         : showList("all");
      case "exit"         : print("${tab}Tschüss!"); exit(1);
      case "done"         : int? number = int.tryParse(inputs["param1"]??""); setDone(number??-1); // change datum
      case "undone"       : int? number = int.tryParse(inputs["param1"]??""); setDone(number??-1, false); // change datum
      case "clear"        : stdout.write('\x1B[2J\x1B[H'); // printUsage_EN();
      case "reset"        : resetList();
      case "list.done"   : showList("done");
      case "list.undone" : showList("undone");
      case "help"         : printUsage_EN();
      default: stdout.writeln("${tab}Falsche eingabe");
    }
  }

}

void addTask(String task){
  if (task.trim().length>0){
    todoList.add({task.trim():false});
  } else {
    print("${tab}keine Aufgabe angegeben !");
  }
}

void removeTask(int index){
  int i = index-1;
  if ((i < todoList.length) && (i >=0 )) {
    todoList.removeAt(i);
  } else { 
    print("${tab}Den Eintrag gibt es nicht.");
  }
}

void resetList(){
  // abfrage n Y
  todoList.clear();
}

void setDone(int index, [bool done=true]){
  int i = index-1;
  if ((i < todoList.length) && (i >=0 )) {
    todoList[i][todoList[i].keys.first] = done;
  } else { 
    print("${tab}Den Eintrag gibt es nicht.");
  }
}

void showList([String selection="all"]){
  int i=0;
  for (i=0; i<todoList.length; i++){
    bool done = (todoList[i][todoList[i].keys.first]??false);
    String mark = ""; (todoList[i][todoList[i].keys.first]??false) ? mark="x" : mark=" ";
    String todo = todoList[i].keys.first;
    switch (selection){
      case "done" : done ? print("${tab}[$mark] ${i+1}. $todo"):false;
      case "undone" : done ? false: print("${tab}[$mark] ${i+1}. $todo");
      default : print("${tab}[$mark] ${i+1}. $todo");
    }
  }
  if (i==0){
    print("${tab}Die Liste ist leer !");
  }
}

