import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="tagify"
export default class extends Controller {
  connect() {
    if (this.element.nodeName == 'INPUT') {
      this.tagify = new Tagify(this.element, {
        // html regex pattern for the tag item
        // pattern: /\/\/.+/,
      })
    } else {
      this.tagify = new Tagify(this.element.querySelector('input'), {
        // html regex pattern for the tag item
        // pattern: /\/\/.+/,
      })
    }
  }

  onAddNewTag() {
    this.tagify.addEmptyTag()
  }
}
