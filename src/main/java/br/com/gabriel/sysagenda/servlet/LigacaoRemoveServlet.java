package br.com.gabriel.sysagenda.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gabriel.sysagenda.business.LigacaoBss;
import br.com.gabriel.sysagenda.domain.LigacaoId;

@WebServlet("/ligacao/remove")
public class LigacaoRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LigacaoId id = new LigacaoId();
		id.setCodContato(Integer.parseInt(request.getParameter("codContato")));
		id.setCodLigacao(Integer.parseInt(request.getParameter("codLigacao")));
		
		LigacaoBss ligacaoBss = new LigacaoBss();
		ligacaoBss.deletaLigacao(id);
		
		response.sendRedirect("index.jsp");
	}

}
