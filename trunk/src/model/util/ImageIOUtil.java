package model.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class ImageIOUtil {
	public final static String DIR_PATH = "C:/Travel/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TravelWeb/images/";
	
	public static byte[] getImageByFilename(String path, String filename) {
		File imgFile = new File((path!=null?(path+"/"):ImageIOUtil.DIR_PATH) + filename);
				
		byte[] buffer = null;
		try {
			buffer = org.apache.commons.io.FileUtils.readFileToByteArray(imgFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return buffer;
	}
	
	public static byte[] getImageByFilename(String filename) {
		File imgFile = new File(ImageIOUtil.DIR_PATH + filename);
				
		byte[] buffer = null;
		try {
			buffer = org.apache.commons.io.FileUtils.readFileToByteArray(imgFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return buffer;
	}
	
	public static void copyImage(String source) {
		File src = new File(ImageIOUtil.DIR_PATH + source);
		File dest = new File(ImageIOUtil.DIR_PATH + "copy." + source);
		
		try {
			org.apache.commons.io.FileUtils.copyFile(src, dest);
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	public static void saveImage(String destFilename, byte[] data) {
		if(!((data != null) && (data.length != 0))) {
			System.out.println("ERROR!! No data input!!");
			return;
		}
			
		System.out.println("save image at : " + (ImageIOUtil.DIR_PATH + destFilename));
		File dest = new File(ImageIOUtil.DIR_PATH + destFilename);
		try {
			org.apache.commons.io.FileUtils.writeByteArrayToFile(dest, data) ;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void saveImage(String path, String destFilename, byte[] data) {
		if(!((data != null) && (data.length != 0))) {
			System.out.println("ERROR!! No data input!!");
			return;
		}
			
		File dest = new File((path!=null?(path+"/"):ImageIOUtil.DIR_PATH) + destFilename);
		try {
			org.apache.commons.io.FileUtils.writeByteArrayToFile(dest, data) ;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String generateImageDirPath(String accountId, String spotId) {
		String imgPath = null;
		
		String dateDir = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date());
		if(accountId != null)
			imgPath = "images" + "/" + dateDir + "/" + accountId + "/" + spotId;
		else 
			imgPath = "images" + "/" + dateDir + "/" + "temp"    + "/" + spotId;
		
		return imgPath;
	}
	public static void main(String[] args) {
		//ImageIOUtil.copyImage("src.jpg");
		//ImageIOUtil.saveImage("slide1.jpg", ImageIOUtil.getImageByFilename("src.jpg"));
		Date dt = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(format.format(dt));
	}
}
