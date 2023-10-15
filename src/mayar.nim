import std/[json, httpclient, strformat, strutils]

type
  MayarConfig* = object
    apiKey: string
    apiUrl: string

# var actionUrl = to_table({
#  "indexProduct": "/product/",
#  "detailProduct": "/product/detail/"
#  })

proc initMayar*(apiKey: string, apiUrl: string): MayarConfig =
  result.apiKey = apiKey
  result.apiUrl = apiUrl

proc getMayar(cfg: var MayarConfig, url: string): string =
  var client = newHttpClient()
  let barier = "Bearer " & cfg.apiKey
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Authorization": barier })
  let response = client.request(url, httpMethod = HttpGet)
  result = response.body

proc postMayar(cfg: var MayarConfig, url: string, data: string): string =
  var client = newHttpClient()
  let barier = "Bearer " & cfg.apiKey
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Authorization": barier })
  let response = client.request(url, httpMethod = HttpPost, body = data)
  result = response.body

proc allProduct*(cfg: var MayarConfig, tipe: string = "all", page: int = 1, pageSize: int = 10): JsonNode =
  var url = fmt"{cfg.apiUrl}/product/?page={page}&pageSize={pageSize}"
  if tipe != "all":
    url = fmt"{cfg.apiUrl}/product/type/{tipe}/?page={page}&pageSize={pageSize}"

  let request = getMayar(cfg, url)
  result = parseJson(request)

proc detailProduct*(cfg: var MayarConfig, id: string, tipe="detail"): JsonNode =
    var url = fmt"{cfg.apiUrl}/product/{id}"
    if tipe == "close":
      url = fmt"{cfg.apiUrl}/product/close/{id}"
    elif tipe == "open":   
      url = fmt"{cfg.apiUrl}/product/open/{id}"

    let request = getMayar(cfg, url)
    result = parseJson(request)

proc searchProduct*(cfg: var MayarConfig, search: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/product/?search={search}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc createInvoice*(cfg: var MayarConfig, data: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/invoice/create"
    let request = postMayar(cfg, url, data)
    result = parseJson(request)

proc editInvoice*(cfg: var MayarConfig, data: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/invoice/edit"
    let request = postMayar(cfg, url, data)
    result = parseJson(request)

proc allInvoice*(cfg: var MayarConfig, tipe: string = "all", page: int = 1, pageSize: int = 10): JsonNode =
  var url = fmt"{cfg.apiUrl}/invoice/?page={page}&pageSize={pageSize}"
  if tipe != "all":
    url = fmt"{cfg.apiUrl}/invoice/?sort={tipe}&?page={page}&pageSize={pageSize}"

  let request = getMayar(cfg, url)
  result = parseJson(request)


proc detailInvoice*(cfg: var MayarConfig, id: string, tipe="detail"): JsonNode =
    var url = fmt"{cfg.apiUrl}/invoice/{id}"
    if tipe == "close":
      url = fmt"{cfg.apiUrl}/invoice/close/{id}"
    elif tipe == "open":   
      url = fmt"{cfg.apiUrl}/invoice/open/{id}"

    let request = getMayar(cfg, url)
    result = parseJson(request)

proc createSinglePayment*(cfg: var MayarConfig, data: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/payment/create"
    let request = postMayar(cfg, url, data)
    result = parseJson(request)

proc editSinglePayment*(cfg: var MayarConfig, data: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/payment/edit"
    let request = postMayar(cfg, url, data)
    result = parseJson(request)

proc allSinglePayment*(cfg: var MayarConfig, tipe: string = "all", page: int = 1, pageSize: int = 10): JsonNode =
  var url = fmt"{cfg.apiUrl}/payment/?page={page}&pageSize={pageSize}"
  if tipe != "all":
    url = fmt"{cfg.apiUrl}/payment/?status={tipe}&?page={page}&pageSize={pageSize}"

  let request = getMayar(cfg, url)
  result = parseJson(request)

proc detailSinglePayment*(cfg: var MayarConfig, id: string, tipe="detail"): JsonNode =
    var url = fmt"{cfg.apiUrl}/payment/{id}"
    if tipe == "close":
      url = fmt"{cfg.apiUrl}/payment/close/{id}"
    elif tipe == "open":   
      url = fmt"{cfg.apiUrl}/payment/open/{id}"

    let request = getMayar(cfg, url)
    result = parseJson(request)

proc balance*(cfg: var MayarConfig): JsonNode =
    let url = fmt"{cfg.apiUrl}/balance"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc paidTransactions*(cfg: var MayarConfig, page: int = 1, pageSize: int = 10): JsonNode =
    let url = fmt"{cfg.apiUrl}/transactions//?page={page}&pageSize={pageSize}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc unpaidTransactions*(cfg: var MayarConfig, page: int = 1, pageSize: int = 10): JsonNode =
    let url = fmt"{cfg.apiUrl}/transactions/unpaid/?page={page}&pageSize={pageSize}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc allCustomer*(cfg: var MayarConfig, page: int = 1, pageSize: int = 10): JsonNode =
    let url = fmt"{cfg.apiUrl}/customer/?page={page}&pageSize={pageSize}"
    let request = getMayar(cfg, url)
    result = parseJson(request)
