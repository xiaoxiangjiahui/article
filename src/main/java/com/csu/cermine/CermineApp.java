package com.csu.cermine;

import com.alibaba.fastjson.JSON;
import com.csu.entity.Article;

import java.io.*;
import java.util.List;

public class CermineApp {
    private ExtractionResult result;
    private Article article;

    public ExtractionResult getResult() {
        return result;
    }

    public void setResult(ExtractionResult result) {
        this.result = result;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Article getArticle(String filepath) {
        article = new Article();
        try {
            System.out.println(">>>>>>>>>>>Start Cermine");
            InputStream inputStream = new FileInputStream(filepath);
            CermineExtractorServiceImpl extractorService = new CermineExtractorServiceImpl();
            result = extractorService.extractNLM(inputStream);
            inputStream.close();
            transtoArticle(result);

            System.out.println(JSON.toJSON(article));
        } catch (Exception e) {
            System.out.println("CermineApp failed..");
            e.printStackTrace();
        }
        return article;
    }

    public void transtoArticle(ExtractionResult result) throws Exception {
        ArticleMeta articleMeta = result.getMeta();
        article.setPtitle(articleMeta.getTitle());
        article.setPabstract(articleMeta.getAbstractText());
        article.setPublish(articleMeta.getJournalTitle());
        article.setDoi(articleMeta.getDoi());

        article.setPublishdate(articleMeta.getPubDate());
        List<ArticleMeta.ContributorMeta> aothorlist = articleMeta.getAuthors();
        StringBuffer authors = new StringBuffer();
        for (ArticleMeta.ContributorMeta author : aothorlist) {
            authors.append(author.getName()).append(", ");
        }
        if (authors.length() > 2) {
            authors.deleteCharAt(authors.length() - 2);
        }
        StringBuffer adresses = new StringBuffer();
        for (ArticleMeta.ContributorMeta author : aothorlist) {
            List<String> adress = author.getAffiliations();
            for (String addressStr : adress) {
                adresses.append(addressStr).append(", ");
            }
        }
        if (adresses.length() > 2) {
            adresses.deleteCharAt(adresses.length() - 2);
        }

        article.setAddr(adresses.toString());
        article.setAuthors(authors.toString());
    }

    public static void main(String[] args) {
        CermineApp cermineApp = new CermineApp();
        cermineApp.getArticle("E:\\Grobid.pdf");
    }


    public byte[] getContent(File file) throws IOException {
        //File file = new File(filePath);
        long fileSize = file.length();
        if (fileSize > Integer.MAX_VALUE) {
            System.out.println("file too big...");
            return null;
        }
        FileInputStream fi = new FileInputStream(file);
        byte[] buffer = new byte[(int) fileSize];
        int offset = 0;
        int numRead = 0;
        while (offset < buffer.length
                && (numRead = fi.read(buffer, offset, buffer.length - offset)) >= 0) {
            offset += numRead;
        }
        // 确保所有数据均被读取
        if (offset != buffer.length) {
            throw new IOException("Could not completely read file "
                    + file.getName());
        }
        fi.close();
        return buffer;
    }
}
