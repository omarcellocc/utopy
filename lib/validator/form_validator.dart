
bool isMail(String mail){

  if (mail.contains('@') && mail.contains('.') && mail.length>5){
    return true;
  }else{
  return false;}
}

bool isCPF(String cpf){
  if (cpf.length == 11){
    return true;
  }
  return false;
}

bool isDate(String date){

  return false;
}