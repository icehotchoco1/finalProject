package kr.or.gw.util;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class GetUploadPath {
	
	private static Properties properties = new Properties();
	
	static {
		String resource = "com/jsp/properties/uploadPath.properties";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getUploadPath(String key) { //꺼낼려면 key값을 알아야한다 그래서 properties를 사용함
		String uploadPath=null;
		uploadPath=properties.getProperty(key);
		uploadPath=uploadPath.replace("/", File.separator); //다른 os에서 사용할 수 있게 seperate 윈도우 : \ 리눅스 : .
		return uploadPath;
	}
	
}
