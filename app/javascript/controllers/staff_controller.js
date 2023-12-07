import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["list"];
  connect() {
    this.displayStaff(500);
  }

  change(event) {
    const max = event.target.value;
    this.displayStaff(max);
  }

  displayStaff(max) {
    fetch(`/staff/within_radius?max=${max}`)
      .then((response) => response.text())
      .then((html) => (this.listTarget.innerHTML = html));
  }
}
