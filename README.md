Mayar Nim Clinet. **Under heavy development** 

Untuk mulai menggunakan Mayar Headless API, Tentunya kita butuh akun account, untuk membuat akun bisa ke https://mayar.id. jika sudah punya akun, API KEY bisa di dapatkan dari https://web.mayar.id/api-keys. 

Fitur yang sudah didukung:
  
* Product
  * All product
  * Product by Type
  * Search product by name
  * Detail product
  * Close Product by id
  * Open product by id
* Invoice 
  * create Invoice
  * edit Invoice
  * detail Invoice
  * close invoice
  * all Invoice
  * closed invoice
  * re open invoice
* Single Payment
  * create single payment
  * edit single payment
  * all single payment
  * closed single payment
  * re open single payment
* Transaction
  * paid transaction
  * unpaid transaction
* Customer
  * all customer
* Balance
  * balance account     


## Product

```nim
import lib/mayar

# your credential
var mayar = initMayar(apiKey, apiUrl)
let allProduct = mayar.allProduct()
# with pagination (page, pageSize)
let pageProduct = mayar.allProduct(page=1, pageSize=10)
# tipe product. untuk detail lengkap tipe product, silahlan merujuk ke dokumentasi mayar
let tipeProduct = mayar.allProduct(tipe="generic_link", page=1, pageSize=10)
# search product
let searchProduct = mayar.searchProduct("nama produk")
# detail product
let detailProduct = mayar.detailProduct(id="00a1cd6a-0a30-4746-bd30-06d2f619041e")
# close product
let closeProduct = mayar.detailProduct(id="00a1cd6a-0a30-4746-bd30-06d2f619041e", action="closed")
# open product
let openProduct = mayar.detailProduct("00a1cd6a-0a30-4746-bd30-06d2f619041e",  action="open")

# Jika menggunakan async. 
let allProduct = waitFor mayar.allProduct()

```

## Invoice

```nim
import lib/mayar

var mayar = initMayar(apiKey, apiUrl)
let allInvoice = mayar.allInvoice()
# with pagination (page, pageSize)
let pageInvoice = mayar.allInvoice(page=1, pageSize=10)
# tipe open/closed. untuk detail lengkap tipe product, silahlan merujuk ke dokumentasi mayar
let tipeInvoice = mayar.allProduct(tipe="closed", page=1, pageSize=10) # tipe="open"
# detail product
let detailInvoice = mayar.detailInvoice(id="00a1cd6a-0a30-4746-bd30-06d2f619041e")
# close product
let closeInvoice = mayar.detailInvoice(id="00a1cd6a-0a30-4746-bd30-06d2f619041e", action="closed")
# open product
let openInvoice = mayar.detailInvoice("00a1cd6a-0a30-4746-bd30-06d2f619041e",  action="open")

# create Invoice
import std/json
let body = %*{
      "name": "andre",
      "email": "kugutsu.hiruko@gmail.com",
      "mobile": "0857975222",
      "redirectUrl": "https://kelaskami.com/nexst23", # optional, bisa lihat lengkap di dokumentasi mayar
      "description": "kemana ini menjadi a amin",
      "items":[
        {
          "quantity": 3,
          "rate": 15000,
          "description": "ayam jago"
        }
      ]
    }
let createInvoice = mayar.createInvoice($body)
# edit invoice
let editBody = %*{
      "id": "bdf9d972-811f-4472-8fdc-2baae04b5148",
      "name": "andre",
      "email": "kugutsu.hiruko@gmail.com",
      "mobile": "0857975222",
      "redirectUrl": "https://kelaskami.com/okeoce",
      "description": "coba dulu kak",
      "items":[
        {
          "quantity": 3,
          "rate": 12000,
          "description": "ayam jago kecil"
        }
      ]
    }

let editInvoice = mayar.editInvoice($body)

```

## Single Payment

```nim
import lib/mayar

var mayar = initMayar(apiKey, apiUrl)
let allSinglePayment = mayar.allSinglePayment()
# with pagination (page, pageSize)
let pageSinglePayment = mayar.allSinglePayment(page=1, pageSize=10)
# tipe closed/open. untuk detail lengkap tipe product, silahlan merujuk ke dokumentasi mayar
let tipeSinglePayment= mayar.allSinglePayment(tipe="closed", page=1, pageSize=10) # tipe="open"
# detail product
let detailSinglePayment = mayar.detailSinglePayment(id="00a1cd6a-0a30-4746-bd30-06d2f619041e")
# close product
let closeSinglePayment = mayar.detailSinglePayment(id="00a1cd6a-0a30-4746-bd30-06d2f619041e", action="closed")
# open product
let openSinglePayment = mayar.detailSinglePayment("00a1cd6a-0a30-4746-bd30-06d2f619041e",  action="open")

# create Single Payment
import std/json
let body = %*{
      "name": "andre",
      "email": "kugutsu.hiruko@gmail.com",
      "amount": 170000,
      "mobile": "085797522261",
      "redirectUrl": "https://kelaskami.com/nexst23",
      "description": "cobalah dulu yak gaes"
    }

let createInvoice = mayar.createSinglePayment($body)
# edit invoice. selain id opsional, hanya provide data yg ingin diubah
let editBody = %*{
      "id": "bdf9d972-811f-4472-8fdc-2baae04b5148",
      "name": "andre", 
      "email": "kugutsu.hiruko@gmail.com",
      "amount": 270000,
      "mobile": "085797522261",
      "redirectUrl": "https://kelaskami.com/nexst23",
      "description": "cobalah dulu yak gaes"
    }

let editInvoice = mayar.SinglePayment($body)

```

## Customer

```nim
import lib/mayar

# your credential
var mayar = initMayar(apiKey, apiUrl)
let allCustomer = mayar.allCustomer()
# with pagination (page, pageSize)
let pageProduct = mayar.allCustomer(page=1, pageSize=10)
```

## Transaction

```nim
import lib/mayar

# your credential
var mayar = initMayar(apiKey, apiUrl)
# paid transaction
let allCustomer = mayar.paidTransactions()
# unpaid transaction
let pageProduct = mayar.unpaidTransactions(page=1, pageSize=10)
```
## Account Balance

```nim
import lib/mayar

# your credential
var mayar = initMayar(apiKey, apiUrl)
# paid transaction
let balance = mayar.balance()

```

