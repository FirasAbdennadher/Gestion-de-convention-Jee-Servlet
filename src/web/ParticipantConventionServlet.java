package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConventionImp;
import dao.ParticipantConventionImp;
import dao.ParticipantImp;
import dao.TypeConventionImp;
import dao.Metier.IConvention;
import dao.Metier.IParticipant;
import dao.Metier.IParticipantConvention;
import dao.Metier.ITypeConvention;

/**
 * Servlet implementation class ParticipantConventionServlet
 */
@WebServlet("/ParticipantConventionServlet")
public class ParticipantConventionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IConvention convention;
	ITypeConvention type;
	IParticipant participant;
	IParticipantConvention iParticipantConvention;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ParticipantConventionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {
		convention = new ConventionImp();
		type = new TypeConventionImp();
		participant = new ParticipantImp();
		iParticipantConvention = new ParticipantConventionImp();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login");
		String password = (String) session.getAttribute("passwrod");


		if(null	 ==login && null == password) {
			response.sendRedirect("views/User.jsp"); 
		}else {

		doPost(request, response);
		}	}

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// request.setAttribute("listesConventions",
		// convention.getAllConvention());
		request.getRequestDispatcher("views/ListeConvention.jsp").forward(
				request, response);
		String action = request.getParameter("action");
		if (action != null) {
			if ("modif".equals(action)) {
				//int idPar = Integer.parseInt(request.getParameter("id"));
				//response.sendRedirect("ConventionServlet?id="+5);
			}
		} else if ("supprimer".equals(action)) {
			int idPar = Integer.parseInt(request.getParameter("id"));
			participant.deleteParticipant(idPar);
		}

	}

}