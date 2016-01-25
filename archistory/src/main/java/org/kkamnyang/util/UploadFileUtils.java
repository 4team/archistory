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
                              byte[] fileData)throws Exception{
    
    UUID uid = UUID.randomUUID();
    
    String savedName = uid.toString() +"_"+originalName;
    
    String savedPath = calcPath(uploadPath);
    
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
          byte[] fileData)throws Exception{

UUID uid = UUID.randomUUID();

String savedName = uid.toString() +"_"+originalName;

String savedPath = calcMoviePath(uploadPath);

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
  
  
  private static String calcPath(String uploadPath){
	  
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
//    
 int srcLenght = uploadPath.length();
	  
	  String meanPath = uploadPath.substring(14, srcLenght);
	  System.out.println("의미있는 경로 : " + meanPath);
	  
	  String category = uploadPath.substring(14,19);
	  
	  int meanLength = meanPath.length();
	  
	  String removeCate = meanPath.substring(6, meanLength);
	  
	  int endIndex = removeCate.lastIndexOf("\\");
	  
	  String route = removeCate.substring(0, endIndex);
	  System.out.println("루트 No : "+route);
	  int first = removeCate.indexOf("\\");
	  endIndex = removeCate.length();
	  
	  
	  String filetype = removeCate.substring(first+1, endIndex);
	  System.out.println("FileTyep : "+ filetype);
	  
	  System.out.println("remove Category Path : " + removeCate);
	  
	  System.out.println(uploadPath);
	  System.out.println(category);

	  makeDir(uploadPath,category,route,filetype);
    return "\\picture";
  }
  
  private static String calcMoviePath(String uploadPath){
	  int srcLenght = uploadPath.length();
	  
	  String meanPath = uploadPath.substring(14, srcLenght);
	  System.out.println("의미있는 경로 : " + meanPath);
	  
	  String category = uploadPath.substring(14,19);
	  
	  int meanLength = meanPath.length();
	  
	  String removeCate = meanPath.substring(6, meanLength);
	  
	  int endIndex = removeCate.lastIndexOf("\\");
	  
	  String route = removeCate.substring(0, endIndex);
	  System.out.println("루트 No : "+route);
	  int first = removeCate.indexOf("\\");
	  endIndex = removeCate.length();
	  
	  
	  String filetype = removeCate.substring(first+1, endIndex);
	  System.out.println("FileTyep : "+ filetype);
	  
	  System.out.println("remove Category Path : " + removeCate);
	  
	  System.out.println(uploadPath);
	  System.out.println(category);

	  makeDir(uploadPath,category,route,filetype);
	  return "\\movie";
	  
  }
  
  
  private static void makeDir(String uploadPath, String... paths){
    
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
