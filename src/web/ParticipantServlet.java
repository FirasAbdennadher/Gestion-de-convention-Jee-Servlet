package web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Level;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import dao.ParticipantConventionImp;
import dao.ParticipantImp;
import dao.Metier.IParticipant;
import dao.Metier.IParticipantConvention;
import entities.Participant;
import entities.ParticipantConvention;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Source : www.exelib.net

//Source : www.exelib.net

@WebServlet("/ParticipantServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IParticipant participant;
	private IParticipantConvention participantConvention; 
	private final String UPLOAD_DIRECTORY = "C:/";

	public ParticipantServlet() {
		super();
	}

	@Override
	public void init() throws ServletException {
		participant = new ParticipantImp();
		participantConvention = new ParticipantConventionImp();
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
		}	}

	String path = "C:\\Users\\Firas\\Desktop";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("image/png");

		String action = request.getParameter("action");
		if (action != null) {

			if ("Ajouter".equals(action)) {
			/*	String UPLOAD_DIRECTORY = null;
				UPLOAD_DIRECTORY = getServletContext().getRealPath("/").replace("build\\", "") + "ressource"
						+ File.separator + "images";
				
				System.out.println(UPLOAD_DIRECTORY+"\\code.png");
		        File file = new File(request.getParameter("file"));
		        byte[] bFile = new byte[(int) file.length()];
		 
		        try {
		            FileInputStream fileInputStream = new FileInputStream(file);
		            fileInputStream.read(bFile);
		            fileInputStream.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

				System.out.println(bFile);*/

			    final Part filePart = request.getPart("file");
			    final String fileName = getFileName(filePart);
			    OutputStream out = null;
			    InputStream filecontent = null;

			      byte[] bytes =null;
			    try {
			        out = new FileOutputStream(new File(path + File.separator
			                + fileName));
			        filecontent = filePart.getInputStream();

			        int read = 0;
			         bytes = new byte[4096];

			        while ((read = filecontent.read(bytes)) != -1) {
			            out.write(bytes, 0, read);
			            System.out.println(bytes +"REAAAAD "+read);

			            break;
			        }
			    } catch (FileNotFoundException fne) {
			    	

			    }
			    
				
				Participant p = new Participant();
				p.setLibelle(request.getParameter("designation"));
				String ecoder=Base64.encode(bytes);
				System.out.println(ecoder);
				p.setLogo(ecoder);
				participant.addParticipant(p);

			} else if ("supprimer".equals(action)) {
				int idPar = Integer.parseInt(request.getParameter("id"));
				String error=null;
			Boolean trouve=false;
			for (ParticipantConvention pcs : participantConvention.getAllParticipantConvention()) {
					System.out.println(pcs.getParticipant().getId());
					if(pcs.getParticipant().getId()==idPar)
						trouve=true;
			}
			if(trouve==false)
			participant.deleteParticipant(idPar);
			else {
				error="exite";
				request.setAttribute("error", error);

			}

				

			} else if ("modif".equals(action)) {
				int idPar = Integer.parseInt(request.getParameter("id"));
				request.setAttribute("participant", participant.getParticipant(idPar));
			} else if ("Modifier".equals(action)) {
				int idPar = Integer.parseInt(request.getParameter("id"));
				String lib = request.getParameter("designation");

			    final Part filePart = request.getPart("file");
			    final String fileName = getFileName(filePart);
			    OutputStream out = null;
			    InputStream filecontent = null;

			      byte[] bytes =null;
			    try {
			        out = new FileOutputStream(new File(path + File.separator
			                + fileName));
			        filecontent = filePart.getInputStream();

			        int read = 0;
			         bytes = new byte[20480];

			        while ((read = filecontent.read(bytes)) != -1) {
			            out.write(bytes, 0, read);
			            System.out.println(bytes +"REAAAAD "+read);

			            break;
			        }
			    } catch (FileNotFoundException fne) {
			    	

			    }
			    
				
				String ecoder=Base64.encode(bytes);

				Participant tc = new Participant(lib, ecoder);
				tc.setId(idPar);
				participant.editParticipant(tc);

			}

		}
		request.setAttribute("participants", participant.getAllParticipant());

		request.getRequestDispatcher("views/AjouterParticipant.jsp").forward(request, response);

	}
	private String getFileName(final Part part) {
	    final String partHeader = part.getHeader("content-disposition");
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}

	private String extractFileName(Part logos) {
		// TODO Auto-generated method stub
		String contendips = logos.getHeader("content-disposition");
		String[] items = contendips.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}