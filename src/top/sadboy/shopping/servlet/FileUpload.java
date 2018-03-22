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

//	private String uploadPath = "D:\\upload\\"; // �ϴ��ļ���Ŀ¼
	
	private String uploadPath = "E:\\eclipse-workspace\\Shopping\\WebContent\\image\\product\\"; // �ϴ��ļ���Ŀ¼

	private File tempPath = new File("D:\\upload\\temp\\"); // ���ڴ����ʱ�ļ���Ŀ¼

	public void destroy() {
		config = null;
		super.destroy();
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = -1;

		// String uploadPath = config.getInitParameter("uploadPath"); // ���ڴ���ϴ��ļ���Ŀ¼

		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		System.out.println(req.getContentLength());
		System.out.println(req.getContentType());
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(4096); // ���ϴ��ļ�����ֵ��Ϊ4K���������4k�ģ��Ҿʹ浽tempĿ¼��
		// the location for saving data that is larger than getSizeThreshold()
		factory.setRepository(tempPath);

		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum size before a FileUploadException will be thrown
		upload.setSizeMax(100000000);

		try {
			List<FileItem> fileItems = upload.parseRequest(req);
			Iterator<FileItem> iter = fileItems.iterator();
			String regExp = ".+\\\\(.+)$";
			// ����\\\\��ʾ����һ��"\"����".+"��˼��\ǰ�����ƥ������ĸ
			// ����(.+)��һ��group��$�����ֵĽ�β��������βһ����.ĳĳ��ĸ��β��

			String[] errorType = { ".exe", ".com", ".cgi", ".jsp" };
			Pattern p = Pattern.compile(regExp);
			// ����������ʽ��һ��pattern

			while (iter.hasNext()) {
				// �������item��ֹ��������input�����ϴ����ļ���Ҳ�п���������ҳ�洫�����Ĳ���
				FileItem item = (FileItem) iter.next();
				// ��Ϊ���ļ����Ǹ�input���Բ�ֹ��file������Ҳ���Դ�txt֮��Ķ���������Ҫ�ж�
				
				// �����ж��ǲ����ļ�����������ID, ��productimageupҳ���form�У���3��input��
				// ��һ������hidden��id���ڶ������Ǵ���file������������submit���͵�input
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
