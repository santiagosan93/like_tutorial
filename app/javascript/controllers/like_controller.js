import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {

  connect() {
    console.log('We are connected')
  }

  updateLike(e) {
    const heart = e.currentTarget
    const placeId = heart.dataset.placeId
    const type = heart.dataset.method
    const url = `/places/${placeId}/${type == 'post' ? 'like' : 'unlike'}`
    Rails.ajax({
      type: heart.dataset.method,
      url: url,
      success: (data) => {
        heart.outerHTML = data.heart
      }
    })
  }
}
