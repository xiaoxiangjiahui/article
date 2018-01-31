package com.csu.elasticsearch;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

public class EsClientBuilder {
	private String clusterName;
	private String nodeIpInfo;
	private TransportClient client;
	
	public Client init() throws UnknownHostException{
		//��Ƽ�Ⱥ������
		Settings settings = Settings.settingsBuilder().put("cluster.name",clusterName).build();
		//������Ⱥ������Ӽ�Ⱥ��ַ
		client = TransportClient.builder().settings(settings).build();
//		Map<String,Integer> nodeMap = parseNodeIpInfo();
//		for(Map.Entry<String,Integer> entry : nodeMap.entrySet()){
//			client.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(entry.getKey()),entry.getValue()));
//		}
		client.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("localhost"),9300));
		return client;
	}
	
	//�����ڵ��IP��Ϣ������ڵ��ö��ø�����IP�Ͷ˿ں���ð�Ÿ���
	private Map<String, Integer> parseNodeIpInfo(){
		String[] nodeIpInfoArr = nodeIpInfo.split(",");
		Map<String, Integer> map = new HashMap<String,Integer>(nodeIpInfoArr.length);
		for (String ipInfo : nodeIpInfoArr) {
			String[] ipInfoArr = ipInfo.split(":");
			map.put(ipInfoArr[0], Integer.parseInt(ipInfoArr[1]));
		}
		return map;
	}
	
	public String getClusterName(){
		return clusterName;
	}
	
	public void setClusterName(String clusterName){
		this.clusterName=clusterName;
	}
	
	public String getNodeIpInfo(){
		return nodeIpInfo;
	}
	
	public void setNodeIpInfo(String nodeIpInfo){
		this.nodeIpInfo=nodeIpInfo;
	}
	
	public void setClientClose(){
		client.close();
	}
}
