import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  connect() {
    console.log('We are connected')
  }

  updateHeart(type, url, heart) {
    Rails.ajax({
      type: type,
      url: url,
      success: (data) => {
        heart.outerHTML = data.heart
      }
    })
  }

  createLike(e) {
    const heart = e.currentTarget
    const placeId = heart.dataset.placeId
    this.updateHeart("post", `/places/${placeId}/likes`, heart)
  }

  destroyLike(e) {
    const heart = e.currentTarget
    const placeId = heart.dataset.placeId
    const likeId = heart.dataset.likeId
    this.updateHeart("delete", `/places/${placeId}/likes/${likeId}`, heart)
  }
}
