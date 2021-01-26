module Home::PromotionsHelper

  def Price(product)
    ret = ""
    ret += "<p class='text-danger' style='font-size:18px;'><s>De #{number_to_currency(product.price)}</s></p>"
    ret += "<p class='text-primary' style='font-size:25px;'>por #{number_to_currency(product.discount)}</p>" if product.discount > 0
    ret += "<p class='text-info' style='font-size:15px;'>Cliente especial paga<br><span style='font-size:25px;'> #{number_to_currency(product.special)}</span></p>" if product.special > 0

    ret.html_safe
  end
end
