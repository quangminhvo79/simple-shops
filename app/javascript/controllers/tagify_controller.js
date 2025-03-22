import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="tagify"
export default class extends Controller {
  connect() {
    console.log(this.element.value)
    new Tagify(this.element, {
      // html regex pattern for the tag item
      // pattern: /\/\/.+/,
    })
  }
}
