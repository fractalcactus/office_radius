import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "list"];
  connect() {
    console.log("Range slider connected");
  }

  change(event) {
    const max = event.target.value;
    console.log("Range slider value changed to", max);
    // this.formTarget.submit();
    // make GET request to /staff/index with param of max
    fetch(`/staff/within_radius?max=${max}`)
      .then((response) => response.text())
      .then((html) => (this.listTarget.innerHTML = html));
  }
}
