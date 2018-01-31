package com.csu.crawler;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.csu.entity.Article;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;


public class DOIArticleCrawler {
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

    public DOIArticleCrawler() {

    }

    public DOIArticleCrawler(String seed) {
        this.seed = seed;
    }

    public void start() {
        if (article == null) {
            article = new Article();
        }
        try {
            String returnedContent = HttpUtils.doGet(seed);
            if (returnedContent == null) {
                System.out.println("Doi search return null");
                return;
            }
           // System.out.println("return content:\n" + returnedContent);
            //解析json数据
            JSONObject jsonObj = JSON.parseObject(returnedContent);
            String status = (String) jsonObj.get("status");
            if (!"ok".equals(status)) {
                System.out.println("Doi search returned data is not ok");
                return;
            }

            JSONObject messageObject = jsonObj.getJSONObject("message");
            String title = (String) messageObject.getJSONArray("title").get(0);

            JSONArray authorArray = messageObject.getJSONArray("author");
            StringBuffer authorssb = new StringBuffer();
            for (int i = 0; i < authorArray.size(); i++) {
                JSONObject authorObj=authorArray.getJSONObject(i);
                authorssb.append(authorObj.get("given")==null?"":authorObj.get("given")+" ");
                authorssb.append(authorObj.get("family")==null?"":authorObj.get("family"));
                if(i<authorArray.size()-1){
                    authorssb.append(", ");
                }
            }
            String publish=  messageObject.getJSONArray("container-title").getString(0);
            String publishDate= messageObject.getJSONObject("created").getJSONArray("date-parts").getJSONArray(0).getString(0);


//            System.out.println(title);
//            System.out.println(authorssb.toString().trim());
//            System.out.println(publish);
//            System.out.println(publishDate);

            article.setPtitle(title);
            article.setAuthors(authorssb.toString().trim());
            //article.setPabstract(articleAbstract);
            article.setPublish(publish);
            article.setPublishdate(publishDate);

            System.out.println(">>>>>>>>>>>DOI crawler end");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(">>>>>>>>>>>DOI crawler excute failed");
        }
    }

    public static void main(String[] args) {
        String seed = "https://api.crossref.org/works/10.1109/TCBB.2010.75";
        new DOIArticleCrawler(seed).start();
//        for (int i = 0; i < 15; i++) {
//
//            String seed = "https://api.crossref.org/works/10.1038/nmeth.42"+i;
//            new DOIArticleCrawler(seed).start();
//            System.out.println(">>>>>>>>>>>>>>>>\n");
//        }
//        String seed = "https://api.crossref.org/works/10.1186/1471-2105-9-388";
//        new DOIArticleCrawler(seed).start();

    }

    /**
     * json data example
     * String str={"status":"ok","message-type":"work","message-version":"1.0.0","message":{"indexed":{"date-parts":[[2017,10,25]],"date-time":"2017-10-25T23:45:17Z","timestamp":1508975117894},"reference-count":0,"publisher":"Springer Nature","issue":"1","content-domain":{"domain":[],"crossmark-restriction":false},"short-container-title":["BMC Bioinformatics"],"published-print":{"date-parts":[[2008]]},"DOI":"10.1186\/1471-2105-9-398","type":"journal-article","created":{"date-parts":[[2008,9,25]],"date-time":"2008-09-25T06:13:28Z","timestamp":1222323208000},"page":"398","source":"Crossref","is-referenced-by-count":99,"title":["Modifying the DPClus algorithm for identifying protein complexes based on new topological structures"],"prefix":"10.1186","volume":"9","author":[{"given":"Min","family":"Li","affiliation":[]},{"given":"Jian-er","family":"Chen","affiliation":[]},{"given":"Jian-xin","family":"Wang","affiliation":[]},{"given":"Bin","family":"Hu","affiliation":[]},{"given":"Gang","family":"Chen","affiliation":[]}],"member":"297","container-title":["BMC Bioinformatics"],"original-title":[],"deposited":{"date-parts":[[2016,5,16]],"date-time":"2016-05-16T13:15:30Z","timestamp":1463404530000},"score":1.0,"subtitle":[],"short-title":[],"issued":{"date-parts":[[2008]]},"references-count":0,"alternative-id":["1471-2105-9-398"],"URL":"http:\/\/dx.doi.org\/10.1186\/1471-2105-9-398","relation":{},"ISSN":["1471-2105"],"issn-type":[{"value":"1471-2105","type":"print"}],"subject":["Biochemistry","Applied Mathematics","Molecular Biology","Structural Biology","Computer Science Applications"]}}
     */

}
