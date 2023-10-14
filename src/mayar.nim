import std/[json, httpclient, strformat, strutils, tables]

type
  MayarConfig* = object
    apiKey: string
    apiUrl: string

type
  PageSize* = ref object
    page: int = 1
    pageSize: int = 10

var actionUrl = to_table({
  "indexProduct": "/product/",
  "detailProduct": "/product/"
  })

proc initMayar*(apiKey: string, apiUrl: string): MayarConfig =
  result.apiKey = apiKey
  result.apiUrl = apiUrl

proc getMayar(cfg: var MayarConfig, url: string): string =
  var client = newHttpClient()
  let barier = "Bearer " & cfg.apiKey
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Authorization": barier })
  let response = client.request(url, httpMethod = HttpGet)
  result = response.body

proc getData*(cfg: var MayarConfig, endpoint: string): JsonNode =
  # bisa aja
  let url = actionUrl[endpoint]
  var client = newHttpClient()
  let barier = "Bearer " & cfg.apiKey
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Authorization": barier })
  let response = client.request(url, httpMethod = HttpGet)
  result = parseJson(response.body)

proc allProduct*(cfg: var MayarConfig, page, pageSize: int): JsonNode =
    let url = fmt"{cfg.apiUrl}/product/?page={page}&pageSize={pageSize}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc typeProduct*(cfg: var MayarConfig, tipe:string, page, pageSize: int): JsonNode =
    let url = fmt"{cfg.apiUrl}/product/type/{tipe}?page={page}&pageSize={pageSize}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc detailProduct*(cfg: var MayarConfig, id: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/product/{id}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc searchProduct*(cfg: var MayarConfig, search: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/product/?search={search}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc closeProduct*(cfg: var MayarConfig, id: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/product/close/{id}"
    let request = getMayar(cfg, url)
    result = parseJson(request)

proc openProduct*(cfg: var MayarConfig, id: string): JsonNode =
    let url = fmt"{cfg.apiUrl}/product/open/{id}"
    let request = getMayar(cfg, url)
    result = parseJson(request)
