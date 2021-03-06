import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "styles", "select_dropdown", "add_style"]

  connect() {
    $(".style-form").map(function() {
      this.classList.add('hide')
    })
    console.log($('#style').val("Select Style"))

    this.add_styleTarget.classList.add('hide')
  }


  select(event) {
    $(".style-form").map(function() {
      this.classList.add('hide')
    })
    var style_select = "style-form-"+this.select_dropdownTarget.value
    var target_style = document.getElementById(style_select)

    if(target_style != null){
      if(style_select == target_style.id){
        target_style.classList.remove('hide')
      }
    }

    var select = document.getElementById("style")
    var select_text = select.selectedOptions[0].firstChild.data

    if(select_text == "Add Style"){
      this.add_styleTarget.click()
    }
  }
}