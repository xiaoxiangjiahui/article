package com.csu.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.pdf.PDFParser;
import org.apache.tika.sax.BodyContentHandler;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import static org.elasticsearch.common.xcontent.XContentFactory.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.service.ElasticsearchService;

@Service
public class ElasticsearchServiceImpl implements ElasticsearchService{
	@Autowired
	private Client client;
	public List<Integer> searchForArticleId(String keywords){
		QueryBuilder queryBuilder = QueryBuilders.matchQuery("originaltext",keywords);
		SearchResponse response = client.prepareSearch("article")
				.setTypes("articleinformation")
				.setQuery(queryBuilder)
				.setSize(25)
				.execute()
				.actionGet();
		SearchHits hits = response.getHits();
		List<Integer> mysqlArticleIds = new ArrayList<Integer>();
		if(hits.totalHits()>0)
			for(SearchHit hit:hits)
				mysqlArticleIds.add(Integer.parseInt(hit.getId()));
				//mysqlArticleIds.add(Integer.parseInt(hit.getSource().get("mysqlid").toString()));
		return mysqlArticleIds;
		
	}
	
	public String addArticleToES(String FilePath,int mysqlId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("start tika");
		BodyContentHandler handler = new BodyContentHandler();
	    Metadata metadata = new Metadata();
	    FileInputStream inputstream = new FileInputStream(new File(FilePath));
	    ParseContext pcontext = new ParseContext();      
	    PDFParser pdfparser = new PDFParser(); 
	    pdfparser.parse(inputstream, handler, metadata,pcontext);
	    String originalText = handler.toString();
	    System.out.println("tika is end");
	    //System.out.println("Contents of the PDF :" + handler.toString());
	    System.out.println("start insert to es");
	    Map<String, Object> json = new HashMap<>();
	    json.put("originaltext", originalText);
	    client.prepareIndex().setIndex("article").setType("articleinformation").setId(mysqlId+"").setSource(json).get();
	    System.out.println("es is end");
		return null;
	}
	
	public boolean deleteArticleFromES(int articleId) {
		DeleteResponse response = client.prepareDelete().setIndex("article").setType("articleinformation")
				.setId(""+articleId).execute().actionGet();
		return response.isFound();
	}

}
