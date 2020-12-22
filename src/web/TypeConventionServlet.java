package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TypeConventionImp;
import dao.Metier.ITypeConvention;
import entities.TypeConvention;

/**
 * Servlet implementation class TypeConventionServlet
 */
@WebServlet("/TypeConventionServlet")
public class TypeConventionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ITypeConvention type;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TypeConventionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	public void init() throws ServletException {
		type = new TypeConventionImp();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null) {
			System.out.println("action ="+action);

			if ("Ajouter".equals(action)) {
System.out.println("ajouter");
				TypeConvention typeconv = new TypeConvention();
				typeconv.setLibelle(request.getParameter("designation"));
				type.addType(typeconv);

			} else if ("supprimer".equals(action)) {
				int idType = Integer.parseInt(request.getParameter("id"));
				type.deleteType(idType);

			} else if ("modif".equals(action)) {
				int idType = Integer.parseInt(request.getParameter("id"));
				TypeConvention getType = type.getType(idType);
				request.setAttribute("type", type.getType(idType));
			} else if ("Modifier".equals(action)) {
				int idType = Integer.parseInt(request.getParameter("id"));
				String lib = request.getParameter("designation");
				TypeConvention tc = new TypeConvention(lib);
				tc.setId(idType);
				type.editType(tc);

			}

		}
		// for (TypeConvention a : type.getAllType()) {
		// System.out.println(a.getLibelle()); }
		request.setAttribute("types", type.getAllType());

		// response.sendRedirect("views/AjouterTypeConvention.jsp");
		request.getRequestDispatcher("views/AjouterTypeConvention.jsp")
				.forward(request, response);

	}
}