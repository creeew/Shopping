package top.sadboy.shopping.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import java.util.*;
import java.util.regex.*;
import java.io.*;
import java.io.ObjectInputStream.GetField;

import org.apache.commons.fileupload.servlet.*;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.Match;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;

public class FileUpload extends HttpServlet {
	// BLOB

	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config = config;
//		uploadPath = config.getInitParameter("uploadpath");
	}

	private ServletConfig config = null;

//	private String uploadPath = "D:\\upload\\"; // 上传文件的目录
	
	private String uploadPath = "E:\\eclipse-workspace\\Shopping\\WebContent\\image\\product\\"; // 上传文件的目录

	private File tempPath = new File("D:\\upload\\temp\\"); // 用于存放临时文件的目录

	public void destroy() {
		config = null;
		super.destroy();
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = -1;

		// String uploadPath = config.getInitParameter("uploadPath"); // 用于存放上传文件的目录

		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		System.out.println(req.getContentLength());
		System.out.println(req.getContentType());
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(4096); // 把上传文件的阈值设为4K，如果大于4k的，我就存到temp目录下
		// the location for saving data that is larger than getSizeThreshold()
		factory.setRepository(tempPath);

		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum size before a FileUploadException will be thrown
		upload.setSizeMax(100000000);

		try {
			List<FileItem> fileItems = upload.parseRequest(req);
			Iterator<FileItem> iter = fileItems.iterator();
			String regExp = ".+\\\\(.+)$";
			// 这里\\\\表示的是一个"\"，而".+"意思是\前面可以匹配多个字母
			// 其中(.+)是一个group，$是名字的结尾，即最后结尾一定是.某某字母结尾的

			String[] errorType = { ".exe", ".com", ".cgi", ".jsp" };
			Pattern p = Pattern.compile(regExp);
			// 这是正则表达式的一个pattern

			while (iter.hasNext()) {
				// 咱这里的item不止可以是在input里面上传的文件，也有可能是其他页面传过来的参数
				FileItem item = (FileItem) iter.next();
				// 因为传文件的那个input可以不止传file进来，也可以传txt之类的东西，所以要判断
				
				// 这里判断是不是文件，用来接收ID, 在productimageup页面的form中，有3个input，
				// 第一个就是hidden的id，第二个就是传的file，第三个就是submit类型的input
				if (item.isFormField()) {
					if (item.getFieldName().equals("id")) {
						id = Integer.parseInt(item.getString());
					}
				}
				
				if (!item.isFormField()) {
					String name = item.getName();
					System.out.println(name);
					long size = item.getSize();
					
//					item.write(new File(uploadPath + id + ".jpg"));
//					out.println(name + "&nbsp&nbsp;" + size + "<br>");
					
					File f = new File(uploadPath + id + ".jpg");
					item.write(f);
					out.println(f.getName() + "&nbsp&nbsp;" + size);

					Matcher m = p.matcher(name);
					out.println(m.find());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String downloadPath = null;
		String aFileName = request.getParameter("fileName");
		FileInputStream fin = null;
		ServletOutputStream sos = null;
		try {
//			response.setContentType("application/x-msdownload");
			response.setContentType(request.getContentType() + "; charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + aFileName);
			
//			fin = new FileInputStream("D://upload//" + aFileName);
			fin = new FileInputStream("E:\\eclipse-workspace\\Shopping\\WebContent\\image\\product\\" + aFileName);
			sos = response.getOutputStream();
			sos.flush();
			int aRead = 0;
			while ((aRead = fin.read()) != -1 & fin != null) {
				sos.write(aRead);
			}
			sos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			fin.close();
			sos.close();
		}
	}
}
