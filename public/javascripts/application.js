// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function addTextHint(elem, hintText) {           
  if (elem.value == '') {               
    elem.value = hintText;
    elem.className += ' ghost';
  }

  elem.onfocus = function () {                       
    if (elem.value == hintText) {
      elem.value = '';
      elem.className = elem.className.replace(' ghost', "");
    }
  }

  elem.onblur = function () {
    if (elem.value == '') {
      elem.value = hintText;
      elem.className += ' ghost';
    }
  }                       
}
