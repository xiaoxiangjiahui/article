package com.csu.crawler;

public class CrawlerFactory {

	public static BaiduArticleCrawler createBaiduCrawler(String SearchContent) throws Exception {
		SearchContent= java.net.URLEncoder.encode(SearchContent, "UTF-8");
		String seed = "http://xueshu.baidu.com/s?wd=" + SearchContent;
		System.out.println("your searching address:" + seed);
		
		BaiduArticleCrawler crawler = new BaiduArticleCrawler(seed);
		return crawler;
		
	}

	public static DOIArticleCrawler createDOiCralwer(String SearchContent) throws Exception {
		SearchContent= java.net.URLEncoder.encode(SearchContent, "UTF-8");
		String seed = "https://api.crossref.org/works/" + SearchContent;
		System.out.println("your searching address:" + seed);

		DOIArticleCrawler crawler = new DOIArticleCrawler(seed);
		return crawler;

	}

	public static void main(String[] args) {
		try {
			DOIArticleCrawler  doiArticleCrawler=CrawlerFactory.createDOiCralwer("");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	public static ArticleInfoCrawler createPaperInfoCrawer(String SearchContent) throws Exception {
//
//		String seed = "http://xueshu.baidu.com/s?wd=" + SearchContent;
//		// 格式化url
//		seed = StringUtils.replace(seed, " ", "%20");
//		System.out.println("your searching address:" + seed);
//		ArticleInfoCrawler crawler = new ArticleInfoCrawler("crawl"+RandomStringUtils.randomAlphanumeric(5), true, seed);
//		return crawler;
//	}

}
