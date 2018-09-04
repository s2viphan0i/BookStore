package com.trungtamjava.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trungtamjava.util.CommonConstant;

@WebServlet(urlPatterns = { "/image"})
public class ImageDownloadController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fileName = request.getParameter("fileName");
		File file = new File(CommonConstant.IMAGE_LOCATION+fileName);
		response.setContentType("image/*");
		response.setContentLength((int) file.length());
		response.setHeader( "Content-Disposition",
		         String.format("attachment; filename=\"%s\"", file.getName()));

		OutputStream out = response.getOutputStream();
		try (FileInputStream in = new FileInputStream(file)) {
		    byte[] buffer = new byte[4096];
		    int length;
		    while ((length = in.read(buffer)) > 0) {
		        out.write(buffer, 0, length);
		    }
		}
		out.flush();
	}
}
