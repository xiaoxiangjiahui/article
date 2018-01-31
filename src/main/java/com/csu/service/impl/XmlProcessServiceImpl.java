package com.csu.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.csu.entity.Author;
import com.csu.entity.AuthorsAdress;
import com.csu.entity.HeaderInfo;
import com.csu.service.XmlProcessService;


public class XmlProcessServiceImpl extends XmlProcessService {

    public List<Author> authors = new ArrayList<Author>();
    public HeaderInfo headerInfo = new HeaderInfo();

    public HeaderInfo getHeaderInfo() {
        return headerInfo;
    }

    public List<Author> getAuthors() {
        return authors;
    }

    public void process(String xmlString) {
        System.out.println(">>>>>>>>>>>>>解析grobid文档");
        SAXReader saxReader = new SAXReader();
        try {
            Document document = DocumentHelper.parseText(xmlString);
            Element barcodeInfo = document.getRootElement();   //获取文档根节点;
            listNodes(barcodeInfo);
            System.out.println(">>>>>>>>>>>>>解析grobid文档完成");
        } catch (Exception e) {
            System.err.println(">>>>>>>>>>>>>文档解析错误");
            e.printStackTrace();
        }
    }

    //递归遍历所有节点
    public void listNodes(Element node) throws Exception {
        //System.out.println("当前节点的名称：" + node.getName());
        if (node.getName().equals("author")) {
            authorNodes(node);
        }
        if (node.getName().equals("titleStmt")) {
            titleNodes(node);
        }
        if (node.getName().equals("monogr")) {
            publishNodes(node);
        }
        if (node.getName().equals("abstract")) {
            abstractsNodes(node);
        }
        if (!(node.getTextTrim().equals(""))) {
            //System.out.println("文本内容：" + node.getText());
        }
        // 当前节点下面子节点迭代器
        Iterator<Element> it = node.elementIterator();
        // 遍历
        while (it.hasNext()) {
            // 获取某个子节点对象
            Element e = it.next();
            // 对子节点进行遍历
            listNodes(e);
        }
    }

    public void titleNodes(Element node) {
        try {
            Element titleNode = node.element("title");
            headerInfo.setTitle(titleNode.getText());
            //System.out.println("getTitle:" + headerInfo.getTitle());
        } catch (NullPointerException e) {
            headerInfo.setTitle("");
        }
    }

    public void abstractsNodes(Element node) {
        //System.out.println("start abstracts node");
        try {
            Element abstractsNode = node.element("p");
            headerInfo.setAbstracts(abstractsNode.getText());
        } catch (NullPointerException e) {
            headerInfo.setAbstracts("");
        }
    }

    public void publishNodes(Element node) {
        //System.out.println("start publish node");
        try {
            Element dateNode = node.element("imprint").element("date");
            if (dateNode != null) {
                headerInfo.setPublishdate(dateNode.getText());
            } else {
                headerInfo.setPublishdate("");
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
            headerInfo.setPublishdate("");
        }
        try {
            Element PublisherNode = node.element("title");
            if (PublisherNode != null) {
                headerInfo.setPublisher(PublisherNode.getText());
            } else {
                headerInfo.setPublisher("");
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
            headerInfo.setPublisher("");
        }
    }

    public void authorNodes(Element node) {
        //System.out.println("处理author节点..");
        Author author = new Author();
        try {
            Element persNameNode = node.element("persName");
            Element forenameNode = persNameNode.element("forename");
            Element surnameNode = persNameNode.element("surname");
            author.setName(forenameNode.getText() + " " + surnameNode.getText());
            System.out.println("author name: " + author.getName());
            try {
                //affiliation可能不止一个节点，作者不止一个单位
                List<Element> affiliations = node.elements("affiliation");
                List<AuthorsAdress> authorsAdresseslist = new ArrayList<>();
                for (Element affiliation : affiliations) {
                    //一个affiliation一个adress
                    AuthorsAdress authorsAdress = new AuthorsAdress();
                    Iterator<Element> it = affiliation.elementIterator();
                    //遍历affiliation子节点
                    while (it.hasNext()) {
                        // 获取子节点对象
                        Element e = it.next();
                        List<Attribute> list = e.attributes();
                        // 遍历属性节点
                        for (Attribute attr : list) {
                            if (attr.getName().equals("type") && attr.getText().equals("department")) {
                                authorsAdress.setDepartment(e.getTextTrim());
                            } else if (attr.getName().equals("type") && attr.getText().equals("laboratory")) {
                                authorsAdress.setDepartment(e.getTextTrim());
                            } else if (attr.getName().equals("type") && attr.getText().equals("institution")) {
                                authorsAdress.setInstitution(e.getTextTrim());
                            }
                        }

                    }
                    authorsAdresseslist.add(authorsAdress);
                }
                author.setAuthorsAdresses(authorsAdresseslist);
                System.out.println("author adresses: " + author.getAuthorsAdressesString());

            } catch (NullPointerException e) {
                author.setAuthorsAdresses(null);
            }
        } catch (NullPointerException e) {
            author.setName("");
        }
        authors.add(author);
    }

    
}
