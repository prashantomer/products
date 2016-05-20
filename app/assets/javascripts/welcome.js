function addParam(link){
  var name  = $('name');
  if(name && !name.value.blank()){
    link.href += ''?query=" + escpe(name.value);
    return true;
  } else {
    alert('Input string for search');
    return false;
  }
}

