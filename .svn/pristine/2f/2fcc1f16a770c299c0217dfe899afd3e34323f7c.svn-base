package com.csu.crawler;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;

import com.csu.entity.Article;


public class BaiduArticleCrawler {
    private Article article;
    private String seed;


    public String getSeed() {
        return seed;
    }

    public void setSeed(String seed) {
        this.seed = seed;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public BaiduArticleCrawler() {

    }

    public BaiduArticleCrawler(String seed) {
        this.seed = seed;
    }

    public void start() {
        if (article == null) {
            article = new Article();
        }
        try {
            String html = HttpUtils.doGet(seed);
            if (html == null) return;
            org.jsoup.nodes.Document doc = Jsoup.parse(html);
            System.out.println(">>>>>>>>>>>excute baidu article crawler");
            // System.out.println(page.doc());

            String title = doc.select("div[id=dtl_l]>div[data-click=\"{'act_block':'main'}\"]>h3").first()
                    .text();
            System.out.println(title);
            String authors = doc.select("p[class=author_text]").first().text();
            System.out.println(authors);
            String articleAbstract = doc.select("div[class=abstract_wr]>p[class=\"abstract\"]").first().text();
            System.out.println(articleAbstract);
            //处理出版源信息，包括出版方，时间，页码等
            String publishinfo = doc.select("p[class=publish_text]").first().text();
            publishinfo = publishinfo.replaceAll((char) 160 + "", "");
            System.out.println(publishinfo);
            String[] strs = StringUtils.split(publishinfo, ",:");
            String publish = strs[0];
            String publishDate = strs[1];

            article.setPtitle(title);
            article.setAuthors(authors);
            article.setPabstract(articleAbstract);
            article.setPublish(publish);
            article.setPublishdate(publishDate);

            System.out.println(">>>>>>>>>>>baidu crawler end");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(">>>>>>>>>>>baidu crawler excute failed");
        }
    }

    public static void main(String[] args) {
        String seed = "http://xueshu.baidu.com/s?wd=10.1186/1471-2105-9-398";
        new BaiduArticleCrawler(seed).start();

    }

}
