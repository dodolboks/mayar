Mayar Nim Clinet Unofficial. Lib ini sedang dalam pengembangan

Fitur yang sudah didukung:
  
* Product
  * All product
  * Product by Type
  * Detail product
  * Close Product by id
  * Open product   

## Product

```nim
from mayar import initMayar, allProduct, detailProduct, closeProduct

# your credential
var mayar = initMayar(apiKey, apiUrl)
var allProduct = mayar.allProduct()
# with pagination (page, pageSize)
var pageProduct = mayar.allProduct(1, 10)

var detailProduct = mayar.detailProduct("00a1cd6a-0a30-4746-bd30-06d2f619041e")
var closeProduct = mayar.closeProduct("00a1cd6a-0a30-4746-bd30-06d2f619041e")
var openProduct = mayar.openProduct("00a1cd6a-0a30-4746-bd30-06d2f619041e")

# echo closeProduct


```
