package web;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
import entities.Convention;
import entities.Participant;
import entities.ParticipantConvention;
import entities.TypeConvention;

@WebServlet("/ConventionServlet")
public class ConventionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IConvention convention;
	ITypeConvention type;
	IParticipant participant;
	IParticipantConvention iParticipantConvention;

	public ConventionServlet() {
		super();
	}

	public void init() throws ServletException {
		convention = new ConventionImp();
		type = new TypeConventionImp();
		participant = new ParticipantImp();
		iParticipantConvention = new ParticipantConventionImp();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login");
		String password = (String) session.getAttribute("passwrod");


		if(null	 ==login && null == password) {
			response.sendRedirect("views/User.jsp"); 
		}else {

		doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null) {
			if ("modifierConvention".equals(action)) {
				int idModif = Integer.parseInt(request.getParameter("id"));
				request.setAttribute("conventionInfo", convention.getConvention(idModif));
				request.setAttribute("conventionParticipant",
						iParticipantConvention.getAllConvntionParticipantParParticipant(idModif + ""));
				request.setAttribute("NotconventionParticipant",
						iParticipantConvention.getPariticpantNotInConvention(idModif + ""));
			} else if ("supprimer".equals(action)) {
				int idSup = Integer.parseInt(request.getParameter("id"));
				iParticipantConvention.deleteParticipantConventionParConvention(idSup);
				convention.deleteConvention(idSup);

			}

			else if ("Modif".equals(action)) {
				// lors click button
				int idPar = Integer.parseInt(request.getParameter("idC"));

				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.FRANCE);
				String datent = request.getParameter("dateen");
				String dateexp = request.getParameter("dateexp");
				String dateedit = request.getParameter("dateedit");

				Date dateEntre = null;
				Date dateExp = null;
				Date dateEdit = null;

				try {
					dateEntre = df.parse(datent);
					dateExp = df.parse(dateexp);
					dateEdit = df.parse(dateedit);
					System.out.println("----------------------------" + dateEntre);

				} catch (ParseException e) {
					e.printStackTrace();
				}
				List<TypeConvention> lType = type.getAllType();
				TypeConvention type = null;
				for (TypeConvention typeConvention : lType) {
					if (request.getParameter("listetype").equals(typeConvention.getLibelle())) {
						type = typeConvention;
					}
				}
				System.out.println("TYPEEEEE" + type);
				Convention c = new Convention(dateEdit, request.getParameter("objet"), dateEntre, dateExp, type);
				c.setId(Integer.parseInt(request.getParameter("idC")));
				convention.editConvention(c);

				/* LL PARTICAPANTTTTTTTTTTTTTttt */

				for (ParticipantConvention lpc : iParticipantConvention
						.getAllConvntionParticipantParParticipant(idPar + "")) {
					SimpleDateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
					String dateSign = request.getParameter(lpc.getParticipant().getId() + "");
					System.out.println(dateSign + " IDDDDDDDDDDDDDDDD" + lpc.getParticipant().getId());
					Date date = null;
					try {
						date = dateF.parse(dateSign);

					} catch (ParseException e) {
						e.printStackTrace();
					}
					ParticipantConvention pc = new ParticipantConvention(date, c, lpc.getParticipant());
					pc.setId(lpc.getId());
					System.out.println("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");

					iParticipantConvention.editParticipantConvention(pc);

				}

				ParticipantConvention pc = new ParticipantConvention();
				List<Participant> lPar = participant.getAllParticipant();
				iParticipantConvention
						.deleteParticipantConventionParConvention(Integer.parseInt(request.getParameter("idC")));

				for (Participant participant : lPar) {
					if (!(request.getParameter(participant.getId() + "").equals(""))) {
						int idP = participant.getId();
						SimpleDateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
						String dateSign = request.getParameter(participant.getId() + "");
						Date date = null;
						try {
							date = dateF.parse(dateSign);

						} catch (ParseException e) {
							e.printStackTrace();
						}
						pc.setConvention(c);
						pc.setDatesignature(date);
						Participant p = this.participant.getParticipant(idP);
						pc.setParticipant(p);
						iParticipantConvention.addParticipantConvention(pc);

					}
				}

			} else if ("Ajouter".equals(action)) {
				Convention c = new Convention();
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String datent = request.getParameter("dateen");
				String dateexp = request.getParameter("dateexp");
				String dateedit = request.getParameter("dateedit");

				Date dateEntre = null;
				Date dateExp = null;
				Date dateEdit = null;

				try {
					dateEntre = df.parse(datent);
					dateExp = df.parse(dateexp);
					dateEdit = df.parse(dateedit);
					System.out.println("111111111111"+dateEntre);
					System.out.println("222222222222"+dateExp);
					System.out.println("333333333333"+dateEdit);

				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				c.setDateEntre(dateEntre);
				c.setDateExpiration(dateExp);
				c.setDateEdition(dateEdit);
				c.setObjet(request.getParameter("objet"));
				List<TypeConvention> lType = type.getAllType();
				TypeConvention type = null;
				for (TypeConvention typeConvention : lType) {
					if (request.getParameter("listetype").equals(typeConvention.getLibelle())) {
						type = typeConvention;
					}
				}
				c.setTypeConvention(type);
				convention.addConvention(c);
				ParticipantConvention pc = new ParticipantConvention();
				List<Participant> lPar = participant.getAllParticipant();
				for (Participant participant : lPar) {
					if (!("".equals(request.getParameter(participant.getId() + "")))) {
						int idP = participant.getId();
						SimpleDateFormat dateF = new SimpleDateFormat("yyyy-mm-dd");
						String dateSign = request.getParameter(participant.getId() + "");
						Date date = null;
						try {
							date = dateF.parse(dateSign);

						} catch (ParseException e) {
							e.printStackTrace();
						}
						pc.setConvention(c);
						pc.setDatesignature(date);
						Participant p = this.participant.getParticipant(idP);
						pc.setParticipant(p);

						iParticipantConvention.addParticipantConvention(pc);

					}
				}

			}
		}
		request.setAttribute("participants", participant.getAllParticipant());
		request.setAttribute("types", type.getAllType());
		request.getRequestDispatcher("views/AjouterConvention.jsp").forward(request, response);
	}
}
