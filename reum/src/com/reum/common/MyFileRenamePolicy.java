package com.reum.common;


import java.io.*;
import java.util.Date;

import javax.swing.plaf.synth.SynthScrollBarUI;

import com.oreilly.servlet.multipart.FileRenamePolicy;

import java.text.SimpleDateFormat;

public class MyFileRenamePolicy  implements FileRenamePolicy {
	
	
	public File rename(File f) {
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNumber = (int)(Math.random()*100000);
		

		String name = f.getName();
		String body = null;
		String ext = null;

		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			body = name.substring(0, dot);
			ext = name.substring(dot);  // includes "."
		}
		else {
			body = name;
			ext = "";
		}
		
		//변경될 파일명 :  5자리 랜덤수,현재날짜시간_name.jpg
		String uniqueFileName = "" +  simDf.format(new Date(currentTime)) + randomNumber;
		String renameFileName = uniqueFileName +"_"+name;  // ext includes "."
		System.out.println("renameFileName" + renameFileName);
		
		f = new File(f.getParent(), renameFileName);
		if (createNewFile(f)) {
			return f;
		}

//		int count = 0;
//		while (!createNewFile(f) && count < 9999) {
//			count++;
//			String newName = uniqueFileName + "_" + count + ext;
//			f = new File(f.getParent(), newName);
//		}

		return f;
	}

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		}
		catch (IOException ignored) {
			return false;
		}
	}
}
