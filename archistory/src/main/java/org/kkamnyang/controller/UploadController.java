package org.kkamnyang.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.kkamnyang.util.MediaUtils;
import org.kkamnyang.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	private static final String uploadPath = "C:\\archistory";

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);

		return "uploadResult";
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		 UUID uid = UUID.randomUUID();
		 String savedName = uid.toString() + "_"+ originalName;
		 
		  File target = new File(uploadPath,savedName);
		 
		  FileCopyUtils.copy(fileData, target);
		 return savedName;
	}
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax(){
	
	
	}
	
	@ResponseBody
	  @RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, 
	                  produces = "text/plain;charset=UTF-8")
	  public ResponseEntity<String> uploadAjax(@RequestParam("routeno") String routeno, MultipartFile file)throws Exception{
	    
	    logger.info("originalName: " + file.getOriginalFilename());
	    
	    System.out.println("업로드포스트 호출됨");
	   
	    return 
	      new ResponseEntity<>(
	          UploadFileUtils.uploadFile(uploadPath, 
	                file.getOriginalFilename(), 
	                file.getBytes(),routeno), 
	          HttpStatus.CREATED);
	  }
	
	
	@ResponseBody
	  @RequestMapping("/displayFile")
	  public ResponseEntity<byte[]>  displayFile(@RequestParam("routeno")String routeno, String fileName)throws Exception{
	    //byte는 파일데이터가져오기위함
	    InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    logger.info("FILE NAME: " + fileName);
	    
	    try{
	      
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      in = new FileInputStream(uploadPath+fileName);
	      
	      if(mType != null){
	        headers.setContentType(mType);
	      }else{
	        
	        fileName = fileName.substring(fileName.indexOf("_")+1);       
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition", "attachment; filename=\""+ 
	          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	      }

	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
	          headers, 
	          HttpStatus.CREATED);
	    }catch(Exception e){
	      e.printStackTrace();
	      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally{
	      in.close();
	    }
	      return entity;    
	  }

	  	  
	  @ResponseBody
	  @RequestMapping(value="/sboard/deleteFile", method=RequestMethod.POST)
	  public ResponseEntity<String> deleteFile(String fileName){
	    
	    logger.info("delete file: "+ fileName);
	    
	    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	    
	    MediaType mType = MediaUtils.getMediaType(formatName);
	    
	    if(mType != null){      
	      
	      String front = fileName.substring(0,12);
	      String end = fileName.substring(14);
	      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
	    }
	    
	    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
	    
	    
	    return new ResponseEntity<String>("deleted", HttpStatus.OK);
	  }  
	  
	  
	  @ResponseBody
	  @RequestMapping(value="/sboard/deleteFiles", method=RequestMethod.POST)
	  public ResponseEntity<String> deleteFiles(@RequestParam("files[]") String[] files){
	    
	    logger.info("delete all files: "+ files);
	    
	    if(files==null || files.length==0){
	    	return new ResponseEntity<String>("deleted", HttpStatus.OK);
	    }
	    
	    for(String fileName : files){
	    	String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	    
	    MediaType mType = MediaUtils.getMediaType(formatName);
	    
	    if(mType != null){      
	      
	      String front = fileName.substring(0,12);
	      String end = fileName.substring(14);
	      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
	    }
	      new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
	  
	    
	  }  

	    return new ResponseEntity<String>("deleted", HttpStatus.OK);
	  }
	
	  @ResponseBody
	  @RequestMapping(value="evenMovieUpload", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	  public ResponseEntity<String> movieUpload(@RequestParam("routeno") String routeno, MultipartFile file,HttpServletRequest request) throws Exception{
		  System.out.println(request.toString());
		  System.out.println("[동영상 업로드 호출] File Name : "+file.getOriginalFilename());
		  
		    return 
		  	      new ResponseEntity<>(
		  	          UploadFileUtils.uploadMovie(uploadPath, 
		  	                file.getOriginalFilename(), file.getBytes(),routeno), HttpStatus.CREATED);
	  }
	  
	  @ResponseBody
	  @RequestMapping("/movieDisplayFile")
	  public ResponseEntity<byte[]>  movieDisplayFile(@RequestParam("routeno")String routeno, String fileName)throws Exception{
	    //byte는 파일데이터가져오기위함
	    InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    logger.info("FILE NAME: " + fileName);
	    
	    try{
	      
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      in = new FileInputStream(uploadPath+File.separator+"event"+File.separator+routeno+File.separator+"movie"+File.separator+fileName);
	      // 여기까지 코딩함......................1/27 2:26PM
	      if(mType != null){
	        headers.setContentType(mType);
	      }else{
	        
	        fileName = fileName.substring(fileName.indexOf("_")+1);       
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition", "attachment; filename=\""+ 
	          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	      }

	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
	          headers, 
	          HttpStatus.CREATED);
	    }catch(Exception e){
	      e.printStackTrace();
	      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally{
	      in.close();
	    }
	      return entity;    
	  }

	  
	  
	  
}