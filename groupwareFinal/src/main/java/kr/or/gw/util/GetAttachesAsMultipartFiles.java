package kr.or.gw.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.AtchMnflVO;

public class GetAttachesAsMultipartFiles {
	public static List<AtchMnflVO> save(List<MultipartFile> multiFiles,String savePath)throws Exception{
		List<AtchMnflVO> atchList = new ArrayList<AtchMnflVO>();
		
		//저장 -> attachVO -> list.add
		if(multiFiles != null) {
			for(MultipartFile multi : multiFiles) {
				if(!multi.getOriginalFilename().equals("")) {
					String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
					File target = new File(savePath, fileName);
					
					target.mkdirs();
					
					multi.transferTo(target);
					
					AtchMnflVO atch = new AtchMnflVO();
					atch.setUploadpath(savePath);
					atch.setFile_nm(fileName);
					atch.setFile_type(fileName.substring(fileName.lastIndexOf('.')+1).toUpperCase());
					atchList.add(atch);
				}
			}
		}
		
		return atchList;
	}
}
