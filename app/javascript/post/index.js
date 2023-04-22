function pullDown() {
  const pullDownButton1 = document.getElementById("list1");
  addUnderline(pullDownButton1)
  const pullDownButton2 = document.getElementById("list2");
  addUnderline(pullDownButton2)
  const pullDownButton3 = document.getElementById("list3");
  addUnderline(pullDownButton3)
  const pullDownButton4 = document.getElementById("list4");
  addUnderline(pullDownButton4)
  const pullDownButton5 = document.getElementById("list5");
  addUnderline(pullDownButton5)

  function addUnderline(element) {
    element.addEventListener('mouseover', function(){
      this.style.textDecoration = 'underline';
  })

    element.addEventListener('mouseout', function(){
      this.style.textDecoration = 'none';
  })
 }
}

window.addEventListener('load', pullDown)