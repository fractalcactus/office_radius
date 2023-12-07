import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Range slider connected");
  }

  change(event) {
    console.log("Range slider value changed to", event.target.value);
  }
}
