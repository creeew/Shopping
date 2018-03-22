package top.sadboy.shopping.reports;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import top.sadboy.shopping.util.DB;

/**
 * Servlet implementation class ShowProductSalesServlet
 */
@WebServlet("/ShowProductSalesServlet")
public class ShowProductSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String pname = "";
	int pcount = 0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProductSalesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    private DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
    private DefaultPieDataset pieDataset = new DefaultPieDataset();
    
    private void getDataSet() { 
         
        
        Connection conn = null;
        ResultSet rs = null;
        String sql = "select product.name, salesitem.pcount from product, salesitem where product.id = salesitem.productid group by product.id";
        
        int count = 0;
        String name = "";
        try {
        	conn = DB.getConn();
        	rs = DB.executeQuery(conn, sql);
        	while (rs.next()) {
        		count = rs.getInt("pcount");
        		name = rs.getString("name");
        		categoryDataset.addValue(count, "", name);
        		pieDataset.setValue(rs.getString(1), rs.getInt(2));
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        } finally {
        	DB.closeRs(rs);
        	DB.closeConn(conn);
        }
    } 
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDataSet();
        JFreeChart chartCategory = ChartFactory.createBarChart3D( 
                           "Product sales report", // 图表标题
                           "Product's name", // 目录轴的显示标签
                           "Sales", // 数值轴的显示标签
                            categoryDataset, // 数据集
                            PlotOrientation.VERTICAL, // 图表方向：水平、垂直
                            true,  // 是否显示图例(对于简单的柱状图必须是 false)
                            false, // 是否生成工具
                            false  // 是否生成 URL 链接
                            ); 
                            
        JFreeChart chartPiped = ChartFactory.createPieChart3D("Product sales report", pieDataset, true, false, false);
        
        FileOutputStream fos_jpg = null; 
        try { 
            fos_jpg = new FileOutputStream("E:\\eclipse-workspace\\Shopping\\WebContent\\image\\reports\\sales.jpg"); 
//            ChartUtilities.writeChartAsJPEG(fos_jpg, 1.0, chart, width, height);
            ChartUtilities.writeChartAsJPEG(fos_jpg,1,chart,1000,800,null); 
            getServletContext().getRequestDispatcher("/admin/showproductsaleschar.jsp").forward(request, response);
        } finally { 
            try { 
                fos_jpg.close(); 
            } catch (Exception e) {} 
        } 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
