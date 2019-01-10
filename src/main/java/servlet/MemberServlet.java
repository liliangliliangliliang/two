package servlet;

import dao.MemMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import pojo.Member;
import pojo.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "MemberServlet",urlPatterns = "/doMem")
public class MemberServlet extends HttpServlet {
    int pageNumber;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        String action=request.getParameter("action");
        String path=request.getContextPath()+"/";

        InputStream inputStream= Resources.getResourceAsStream("MyBatisConfig.xml");
        SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession=sqlSessionFactory.openSession();

        if(action!=null && action.equals("queryAll")){
            int a=0;
            if(request.getParameter("a")!=null){
                a=Integer.valueOf(request.getParameter("a"));
                if(a==1){
                    request.setAttribute("err","删除成功");
                }else if (a==2){
                    request.setAttribute("err","删除失败");
                }
            }
         /*   int pageSize=5;
            if(request.getParameter("pageNumber")!=null){
                pageNumber=Integer.valueOf(request.getParameter("pageNumber"));
            }*/
            List<Member> page=sqlSession.getMapper(MemMapper.class).menQuery();
            session.setAttribute("Page",page);
          /*  request.setAttribute("servletURL",path+"doMem?action=queryAll");*/
            request.getRequestDispatcher(path+"query.jsp").forward(request,response);
        }

        if(action!=null && action.equals("QueryById")){
            String id=request.getParameter("id");
           Member men=sqlSession.getMapper(MemMapper.class).menqueryById(id);
           session.setAttribute("Member",men);
           response.sendRedirect(path+"update.jsp");

        }
        if(action!=null && action.equals("queryOne")){
            String mname=request.getParameter("mname");
            Member men=null;
            if(mname!=""){
                men=sqlSession.getMapper(MemMapper.class).menqueryOne(mname);
            }
            session.setAttribute("mber",men);
            response.sendRedirect(path+"queryOne.jsp");
        }
        if(action!=null && action.equals("update")){
            Member men=new Member();
            men.setId(Integer.valueOf(request.getParameter("id")));
            men.setMname(request.getParameter("mname"));
            men.setMgender(request.getParameter("mgender"));
            men.setMage(Integer.valueOf(request.getParameter("mage")));
            men.setMaddress(request.getParameter("maddress"));
            men.setMemail(request.getParameter("memail"));
            int i=sqlSession.getMapper(MemMapper.class).menUpdata(men);
            if(i>0){
                sqlSession.commit();
                request.setAttribute("err","修改成功");
                request.getRequestDispatcher(path+"doMem?action=queryAll&pageNumber=1").forward(request,response);
            }else {
                request.setAttribute("err","修改失败");
                request.getRequestDispatcher(path+"doMem?action=queryAll&pageNumber=1").forward(request,response);
            }
        }
        if(action!=null && action.equals("DelById")){
            String id=request.getParameter("id");
            System.out.println(id);
            int i=sqlSession.getMapper(MemMapper.class).menDel(id);
            if(i>0){
                sqlSession.commit();
                request.setAttribute("err","删除成功");
                out.print(1);
            }else {
                request.setAttribute("err","删除失败");
                out.print(2);

            }
        }
    }
}
