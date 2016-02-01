package org.kkamnyang.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

  private static final Logger logger = 
      LoggerFactory.getLogger(UploadFileUtils.class);

//  public static String uploadFile(String uploadPath, 
//      String originalName, 
//      byte[] fileData)throws Exception{
//    
//    return null;
//  }
//  
  
  public static String uploadFile(String uploadPath, 
                              String originalName, 
                              byte[] fileData,String routeno)throws Exception{
    
    UUID uid = UUID.randomUUID();
    
    String savedName = uid.toString() +"_"+originalName;
    
    String savedPath = calcPath(uploadPath,routeno);
    
    File target = new File(uploadPath +savedPath,savedName);
    
    FileCopyUtils.copy(fileData, target);
    
    String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
    
    String uploadedFileName = null;
    
    if(MediaUtils.getMediaType(formatName) != null){
      uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
    }else{
      uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
    }
    
    return uploadedFileName;
    
  }
  
 
  
  public static String uploadMovie(String uploadPath, 
          String originalName, 
          byte[] fileData,String routeno)throws Exception{

		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() +"_"+originalName;
		
		String savedPath = calcMoviePath(uploadPath,routeno);
		
		File target = new File(uploadPath +savedPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null){
		uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else{
		uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;

}
  
  
  
  private static  String makeIcon(String uploadPath, 
      String path, 
      String fileName)throws Exception{

    String iconName = 
        uploadPath + path + File.separator+ fileName;
    
    return iconName.substring(
        uploadPath.length()).replace(File.separatorChar, '/');
  }
  
  
  private static  String makeThumbnail(
              String uploadPath, 
              String path, 
              String fileName)throws Exception{
            
    BufferedImage sourceImg = 
        ImageIO.read(new File(uploadPath + path, fileName));
    
    BufferedImage destImg = 
        Scalr.resize(sourceImg, 
            Scalr.Method.AUTOMATIC, 
            Scalr.Mode.FIT_TO_HEIGHT,100);
    
    String thumbnailName = 
        uploadPath + path + File.separator +"s_"+ fileName;
    
    File newFile = new File(thumbnailName);
    String formatName = 
        fileName.substring(fileName.lastIndexOf(".")+1);
    
    
    ImageIO.write(destImg, formatName.toUpperCase(), newFile);
    return thumbnailName.substring(
        uploadPath.length()).replace(File.separatorChar, '/');
  } 
  
  
  private static String calcPath(String uploadpath,String routeno){
	  
//    Calendar cal = Calendar.getInstance();
//    
//    String yearPath = File.separator+cal.get(Calendar.YEAR);
//    
//    String monthPath = yearPath + 
//        File.separator + 
//        new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
//
//    String datePath = monthPath + 
//        File.separator + 
//        new DecimalFormat("00").format(cal.get(Calendar.DATE));
//    
//    makeDir(uploadPath, "picture");
//    
//    logger.info(datePath);
//    ㅏ
	  
	  String category = "event";
	  String route = routeno;
	  String filetype = "picture";
	  
	  System.out.println(uploadpath);
	  System.out.println(category);
	  System.out.println("루트 No : "+route);
	  System.out.println("FileTyep : "+ filetype);
	  makeDir(uploadpath,File.separator+category,File.separator+category+File.separator+route,File.separator+category+File.separator+route+File.separator+filetype);

	  return File.separator+category+File.separator+route+File.separator+filetype;
    
  }
  

  
  private static String calcMoviePath(String uploadPath,String routeno){
	
	  String category = "event";
	  String filetype = "movie";
	  
	  System.out.println(uploadPath);
	  System.out.println(category);
	  System.out.println("루트 No : "+routeno);
	  System.out.println("FileTyep : "+ filetype);
	  

	  makeDir("C:\\archistory",File.separator+category,File.separator+category+File.separator+routeno,File.separator+category+File.separator+routeno+File.separator+filetype);
	  return File.separator+category+File.separator+routeno+File.separator+filetype;
	  
  }
  
  
  private static void makeDir(String uploadPath, String... paths){
    
	  System.out.println("폴더 만드는 곳에 들어왔다."+paths);
    if(new File(paths[paths.length-1]).exists()){
      return;
    }
    
    for (String path : paths) {
      
      File dirPath = new File(uploadPath + path);
      
      if(! dirPath.exists() ){
        dirPath.mkdir();
      } 
    }
  }
  
  
}
