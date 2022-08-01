//
//  ImageList.swift
//  NetworkStudy
//
//  Created by JH on 2022/07/30.
//

import Foundation

struct ImageList: Decodable {
	let kind: String?
	let url: ImageURL?
	let queries: Queries?
	let searchInformation: SearchInformation?
}

/**

{
  "kind": "customsearch#search",
  "url": {
	"type": "application/json",
	"template": "https://www.googleapis.com/customsearch/v1?q={searchTerms}&num={count?}&start={startIndex?}&lr={language?}&safe={safe?}&cx={cx?}&sort={sort?}&filter={filter?}&gl={gl?}&cr={cr?}&googlehost={googleHost?}&c2coff={disableCnTwTranslation?}&hq={hq?}&hl={hl?}&siteSearch={siteSearch?}&siteSearchFilter={siteSearchFilter?}&exactTerms={exactTerms?}&excludeTerms={excludeTerms?}&linkSite={linkSite?}&orTerms={orTerms?}&relatedSite={relatedSite?}&dateRestrict={dateRestrict?}&lowRange={lowRange?}&highRange={highRange?}&searchType={searchType}&fileType={fileType?}&rights={rights?}&imgSize={imgSize?}&imgType={imgType?}&imgColorType={imgColorType?}&imgDominantColor={imgDominantColor?}&alt=json"
  },
  "queries": {
	"request": [
	  {
		"title": "Google Custom Search - test",
		"searchTerms": "test",
		"count": 10,
		"startIndex": 1,
		"inputEncoding": "utf8",
		"outputEncoding": "utf8",
		"safe": "off",
		"cx": "d0857c8964bf99e76"
	  }
	]
  },
  "searchInformation": {
	"searchTime": 0.348613,
	"formattedSearchTime": "0.35",
	"totalResults": "0",
	"formattedTotalResults": "0"
  }
}

*/
