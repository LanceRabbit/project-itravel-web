package model.util;

import java.io.File;
import java.io.IOException;


public class ImageIOUtil {
	public final static String DIR_PATH = "C:/Travel/workspace/images/";
	
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
		File dest = new File(ImageIOUtil.DIR_PATH + destFilename);
		try {
			org.apache.commons.io.FileUtils.writeByteArrayToFile(dest, data) ;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		//ImageIOUtil.copyImage("src.jpg");
		ImageIOUtil.saveImage("dest.jpg", ImageIOUtil.getImageByFilename("src.jpg"));
	}
}
