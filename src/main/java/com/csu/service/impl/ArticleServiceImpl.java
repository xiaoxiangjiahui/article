package com.csu.service.impl;

import java.io.BufferedInputStream;
import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.csu.entity.Article;
import com.csu.entity.ArticlePath;
import com.csu.entity.ArticleUserGroup;
import com.csu.entity.CommentArticle;
import com.csu.entity.CommentUserContent;
import com.csu.mapper.ArticleMapper;
import com.csu.mapper.ArticlePathMapper;
import com.csu.mapper.ArticleUserGroupMapper;
import com.csu.mapper.CommentArticleMapper;
import com.csu.mapper.CommentUserContentMapper;
import com.csu.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	ArticleUserGroupMapper articleUserGroupMapper;
	@Autowired
	ArticleMapper articleMapper;
	@Autowired
	ArticlePathMapper articlePathMapper;
	@Autowired
	CommentArticleMapper commentArticleMapper;
	@Autowired
	CommentUserContentMapper commentUserContentMapper;
	
	public List<Article> listArticle(int groupId){
		/*List<ArticleUserGroup> articleUserGroups = articleUserGroupMapper.listArticle(groupId);
		List<Article> articles = new ArrayList<Article>();//鏈�缁堣繑鍥�
		List<Integer> lIntegers = new ArrayList<Integer>();//鏂囩尞鐨処D
		while(!articleUserGroups.isEmpty()){
			lIntegers.add(articleUserGroups.get(0).getArticleId());
			articleUserGroups.remove(0);
		}
		articles = articleMapper.list(lIntegers);*/
		return articleMapper.getByGroup(groupId);
	}
	
	public Article getArticle(int articleId){
		return articleMapper.get(articleId);
	}


	public ResponseEntity<byte[]> download(String fileName, File file) throws IOException{
		// TODO Auto-generated method stub
		String dfileName = new String(fileName.getBytes("gb2312"),"iso8859-1");
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		httpHeaders.setContentDispositionFormData("attachment", dfileName);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders,HttpStatus.CREATED);
	}
	
	/*public ResponseEntity<byte[]> downloadBatch(int[] articleIds) throws IOException, ServletException{
		String articlePath = null;
		List<File> files = new ArrayList<>();
		for(int articleId : articleIds) {
			System.out.println("articleId::"+articleId);
			articlePath = articleMapper.get(articleId).getPath();
			files.add(new File("D:\\uploadfile\\"+articlePath));
		}	
    	String fileName = UUID.randomUUID().toString() + ".zip";  
	    // 鍦ㄦ湇鍔″櫒绔垱寤烘墦鍖呬笅杞界殑涓存椂鏂囦欢  
	    String outFilePath = "D:\\temp\\";  	  
	    File zip = new File(outFilePath + fileName);  
	    // 鏂囦欢杈撳嚭娴�  
	    FileOutputStream outStream = new FileOutputStream(zip);  
	    // 鍘嬬缉娴�  
	    ZipOutputStream zipOutStream = new ZipOutputStream(outStream);  	  
	    zipFiles(files, zipOutStream); 
	    zipOutStream.close();  
	    outStream.close();
	    //寮�濮嬩笅杞�
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		httpHeaders.setContentDispositionFormData("attachment", fileName);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(zip),httpHeaders,HttpStatus.CREATED);
	}*/
	public String downloadBatch(int[] articleIds) throws IOException, ServletException{
		String articlePath = null;
		String artiPath = "";
		List<File> files = new ArrayList<>();
		for(int articleId : articleIds) {
			System.out.println("articleId::"+articleId);
			articlePath = articleMapper.get(articleId).getPath();
			files.add(new File("C:\\uploadfile\\"+articlePath));
		}	
    	String fileName = UUID.randomUUID().toString() + ".zip";  
	    // 鍦ㄦ湇鍔″櫒绔垱寤烘墦鍖呬笅杞界殑涓存椂鏂囦欢  
	    String outFilePath = "C:\\temp\\";  	  
	    File zip = new File(outFilePath + fileName);  
	    // 鏂囦欢杈撳嚭娴�  
	    FileOutputStream outStream = new FileOutputStream(zip);  
	    // 鍘嬬缉娴�  
	    ZipOutputStream zipOutStream = new ZipOutputStream(outStream);  	  
	    zipFiles(files, zipOutStream); 
	    zipOutStream.close();  
	    outStream.close();
	    //寮�濮嬩笅杞�
//		HttpHeaders httpHeaders = new HttpHeaders();
//		httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//		httpHeaders.setContentDispositionFormData("attachment", fileName);
	    artiPath = fileName;
	    System.out.println("artiPath::"+artiPath);
		return artiPath;
	}
	
	//寰幆鍘嬬缉澶氫釜鏂囦欢  
	public void zipFiles(List<File> files, ZipOutputStream outputStream) throws IOException, ServletException {  
		try {  
			int size = files.size();  
			// 鍘嬬缉鍒楄〃涓殑鏂囦欢  
			for (int i = 0; i < size; i++) {  
				File file = (File) files.get(i);  
				zipFile(file, outputStream);  
			}  
		} catch (IOException e) {  
			throw e;  
		}  
	} 
		
	public void zipFile(File inputFile, ZipOutputStream outputstream) throws IOException, ServletException {  
		try {  
			if (inputFile.exists()) {  
				if (inputFile.isFile()) {  
					FileInputStream inStream = new FileInputStream(inputFile);  
					BufferedInputStream bInStream = new BufferedInputStream(inStream);  
					ZipEntry entry = new ZipEntry(inputFile.getName());  
					outputstream.putNextEntry(entry);  
					final int MAX_BYTE = 10 * 1024 * 1024; // 鏈�澶х殑娴佷负10M  
					long streamTotal = 0; // 鎺ュ彈娴佺殑瀹归噺  
					int streamNum = 0; // 娴侀渶瑕佸垎寮�鐨勬暟閲�  
					int leaveByte = 0; // 鏂囦欢鍓╀笅鐨勫瓧绗︽暟  
					byte[] inOutbyte; // byte鏁扮粍鎺ュ彈鏂囦欢鐨勬暟鎹�  
		    
					streamTotal = bInStream.available(); // 閫氳繃available鏂规硶鍙栧緱娴佺殑鏈�澶у瓧绗︽暟  
					streamNum = (int) Math.floor(streamTotal / MAX_BYTE); // 鍙栧緱娴佹枃浠堕渶瑕佸垎寮�鐨勬暟閲�  
					leaveByte = (int) streamTotal % MAX_BYTE; // 鍒嗗紑鏂囦欢涔嬪悗,鍓╀綑鐨勬暟閲�  
		    
					if (streamNum > 0) {  
						for (int j = 0; j < streamNum; ++j) {  
							inOutbyte = new byte[MAX_BYTE];  
							// 璇诲叆娴�,淇濆瓨鍦╞yte鏁扮粍  
							bInStream.read(inOutbyte, 0, MAX_BYTE);  
							outputstream.write(inOutbyte, 0, MAX_BYTE); // 鍐欏嚭娴�  
						}  
					}  
					// 鍐欏嚭鍓╀笅鐨勬祦鏁版嵁  
					inOutbyte = new byte[leaveByte];  
					bInStream.read(inOutbyte, 0, leaveByte);  
					outputstream.write(inOutbyte);  
					outputstream.closeEntry(); // Closes the current ZIP entry  
		  
					bInStream.close(); // 鍏抽棴  
					inStream.close();  
				}  
			} else {  
				throw new ServletException("鏂囦欢涓嶅瓨鍦紒");  
			}  
		} catch (IOException e) {  
			throw e;  
		}  
	}  
	
	public void downloadZip(File zipFile) throws IOException {
		BufferedInputStream fInputStream = new BufferedInputStream(new FileInputStream(zipFile));
		byte[] buffer = new byte[fInputStream.available()];
		fInputStream.read(buffer);
		fInputStream.close();
	}
	
	public ArticlePath getArticlePath(int articleId){
		return articlePathMapper.get(articleId);
	}
	
	public void saveArticlePath(ArticlePath articlePath){
		articlePathMapper.add(articlePath);
	}
	
	public void deleteBatchArticles(List<Integer> articleIds){
		while(!articleIds.isEmpty()){
			articleMapper.delete(articleIds.get(0));
			articleUserGroupMapper.delete(articleIds.get(0));
			articlePathMapper.delete(articleIds.get(0));
			commentArticleMapper.delete(articleIds.get(0));
			articleIds.remove(0);
		}
	}
	
	public void deleteArticle(int articleId) {
		articleMapper.delete(articleId);

	}
	
	public void addArticle(Article article) {
		articleMapper.add(article);
	}

	@Override
	public void addArticleUserGroup(ArticleUserGroup articleUserGroup) {
		// TODO Auto-generated method stub
		articleUserGroupMapper.add(articleUserGroup);
	}

	@Override
	public void updateArticle(Article article) {
		// TODO Auto-generated method stub
		articleMapper.update(article);
	}

	@Override
	public int countArticle(int groupId) {
		// TODO Auto-generated method stub
		int articleCounts = articleUserGroupMapper.count(groupId);
		return articleCounts;
	}

	@Override
	public void addArticlePath(ArticlePath articlePath) {
		// TODO Auto-generated method stub
		articlePathMapper.add(articlePath);
	}

	@Override
	public List<Integer> filterArticleFromgroup(List<Integer> articleIds, int groupId) {
		// TODO Auto-generated method stub		
		List<ArticleUserGroup> articleUserGroups = articleUserGroupMapper.listArticle(groupId);
		List<Integer> groupArticles = new ArrayList<>();
		for(ArticleUserGroup articleUserGroup : articleUserGroups)
			groupArticles.add(articleUserGroup.getPid());
		articleIds.retainAll(groupArticles);
		return articleIds;
	}

	@Override
	public List<Article> getArticleByuser(String account) {
		// TODO Auto-generated method stub
		return articleMapper.getArticleByuser(account);
	}

	@Override
	public void updateGroup(int groupid, int pid) {
		// TODO Auto-generated method stub
		articleMapper.updateGroup(groupid, pid);
	}

	@Override
	public List<Article> getByUnique(String unique_title) {
		// TODO Auto-generated method stub
		return articleMapper.getByUnique(unique_title);
	}

	@Override
	public List<Article> searchByTitle(String keyw) {
		// TODO Auto-generated method stub
		return articleMapper.searchByTitle(keyw);
	}

	@Override
	public List<Article> searchByAttach(String title, String authors, String pabstract, int cid) {
		// TODO Auto-generated method stub
		return articleMapper.searchByAttach(title, authors, pabstract, cid);
	}

	@Override
	public List<Article> searchByAttachNoCid(String title, String authors, String pabstract) {
		// TODO Auto-generated method stub
		return articleMapper.searchByAttachNoCid(title, authors, pabstract);
	}

	@Override
	public void addToGroup(int groupid, int pid, String account) {
		// TODO Auto-generated method stub
		articleMapper.addToGroup(groupid, pid, account);
	}

	@Override
	public void deleteFromGroup(int groupid,int pid) {
		// TODO Auto-generated method stub
		articleMapper.deleteFromGroup(groupid, pid);
	}

	@Override
	public ArticleUserGroup getArticleGroup(int groupid, int pid) {
		// TODO Auto-generated method stub
		return articleUserGroupMapper.getArticleGroup(groupid, pid);
	}

}
