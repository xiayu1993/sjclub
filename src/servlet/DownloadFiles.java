package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadFilesServlet
 */
@WebServlet("/DownloadFiles")
public class DownloadFiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFiles() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取文件相对路径
		String name = request.getParameter("name");
		
		/* 此处暂时使用指定路径，之后应该改为相对路径
		 * 指定到WEB-INF/download文件夹下
		 */
		//指定服务器中下载文件夹路径
		String down = "D:\\sjclubDownload\\";
		//获取文件绝对路径
		String path = down + name;
		//根据路径创建文件对象
		File file = new File(path);
		//判断文件是否存在
		if(!file.exists()){
			response.getWriter().print("指定文件不存在！");
		}
		//创建文件字节输入流
		InputStream in = new FileInputStream(file);
		//创建输出流对象
		OutputStream os = response.getOutputStream();
		//设置应答头信息
		response.addHeader("Content-Disposition", "attachment;filename=" + new String(file.getName().getBytes("utf-8"),"ISO-8859-1"));
		response.addHeader("Content-Length", file.length()+"");
		response.setContentType("application/octet-stream");
		int data = 0;
		byte[] b = new byte[1024];
		while((data = in.read(b,0,b.length)) != -1){
			os.write(b, 0, data);
		}
		os.close();
		in.close();
	}

}