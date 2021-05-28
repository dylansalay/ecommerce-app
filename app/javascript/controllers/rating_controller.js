import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["star"]
  
  
  addFill(event) {
    const selection = event.target
    const index = this.starTargets.findIndex(s => s.classList == selection.classList)
    const add = this.starTargets.splice(0, index+1)
    add.forEach( star => {
      star.classList.remove('far')
      star.classList.add('fas')
      star.classList.add('star')
    })
  }

  removeFill(event) {
    rating = document.getElementById("rating").value
    const selection = event.target
    const index = this.starTargets.findIndex(s => s.classList == selection.classList)
    const remove = this.starTargets.slice(rating)
    remove.forEach( star => {
      star.classList.remove('fas')
      star.classList.add('far')
    })
  }

  addRating(event) {
    const selection = event.target
    const index = this.starTargets.findIndex(s => s.classList == selection.classList)
    rating = document.getElementById("rating")
    rating.value = index+1

    this.removeFill(event)
    this.addFill(event)
  }
}