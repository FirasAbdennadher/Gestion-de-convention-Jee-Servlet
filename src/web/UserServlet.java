package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TypeConventionImp;
import dao.UserImp;
import dao.Metier.ITypeConvention;
import dao.Metier.IUser;
import entities.TypeConvention;
import entities.User;

/**
 * Servlet implementation class userControl
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ITypeConvention type;

	public UserServlet() {
		super();
	}

	
	@Override
	public void init() throws ServletException {
		type = new TypeConventionImp();
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			IUser u = new UserImp();
			// request.getRequestDispatcher("views/User.jsp").forward(request,
			// response);
			response.sendRedirect("views/User.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {

			IUser u = new UserImp();
String name="";
			List<User> lUser = u.getAllUsers();
	boolean trouve=false;
			for (User user : lUser) {
				if (user.getLogin().equals(request.getParameter("login"))
						&& user.getPassword().equals(
								request.getParameter("password"))) {
					name=user.getNom();
					trouve=true;
				}
			}
			if(trouve==false){
				System.out.println("false");
				request.setAttribute("erreur", "inexistant");
				response.sendRedirect("views/User.jsp?erreur=inexistant"); 

			}else{
				System.out.println("true");
				HttpSession session= request.getSession();
				session.setAttribute("name",name);
				session.setAttribute("login",request.getParameter("login") );
				session.setAttribute("password",request.getParameter("password"));
				request.setAttribute("typess", type.getAllType());
				response.sendRedirect("views/index.jsp?name="+name); 
				//request.getRequestDispatcher("views/index.jsp").forward(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}