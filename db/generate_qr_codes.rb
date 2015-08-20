# Go through all existing products, generating QR codes for them
require 'rqrcode'

host = '197.232.14.74:7070/'
resource = 'products/'

Product.all.each do |product|
    product_url = host + resource + product.id.to_s
    qrcode = RQRCode::QRCode.new(product_url)
    f = File.new('/tmp/qr_code_' + product.id.to_s + '.png', "w")
    f.write(qrcode.as_png)
    product.qr_code = f
    if product.save! then 
	puts 'Product with ID ' + product.id.to_s + ' successfully saved!'
    end
end
