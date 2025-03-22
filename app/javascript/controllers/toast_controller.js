import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
    setTimeout(() => this.fadeOutToast(this.element), 5000);
  }

  fadeOutToast(toastMessage) {
    toastMessage.classList.add('opacity-0');

    setTimeout(() => {
      toastMessage.remove();
    }, 1000);
  }
}
