package com.trungtamjava.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Function {
	public static String generateUniqueFileName() {
	    String filename = "";
	    long millis = System.currentTimeMillis();
	    String datetime = new Date().toGMTString();
	    datetime = datetime.replace(" ", "");
	    datetime = datetime.replace(":", "");
	    filename = datetime + "_" + millis;
	    return filename;
	}
	public static Date StringtoDate(String date, String format) {
		try {
			return new SimpleDateFormat(format).parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
	public static java.sql.Date convertDate(java.util.Date date) {
	    return new java.sql.Date(date.getTime());
	}
	public String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
              sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
            
        }
        return null;
    }
}
