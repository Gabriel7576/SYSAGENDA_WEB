package br.com.gabriel.sysagenda.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gabriel.sysagenda.business.ContatoBss;
import br.com.gabriel.sysagenda.business.LigacaoBss;
import br.com.gabriel.sysagenda.domain.Ligacao;
import br.com.gabriel.sysagenda.domain.LigacaoId;

@WebServlet("/ligacao/verifica")
public class LigacaoVerificaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		LigacaoId id = new LigacaoId();
		id.setCodContato(Integer.parseInt(request.getParameter("codContato")));
		id.setCodLigacao(Integer.parseInt(request.getParameter("codLigacao")));

		Ligacao ligacao = new LigacaoBss().getLigacao(id);
		
		String dataFormatada = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(ligacao.getDataHora());
		
		request.setAttribute("contato", new ContatoBss().getContato(id.getCodContato()));
		request.setAttribute("codLigacao", id.getCodLigacao());
		request.setAttribute("data", dataFormatada.replace(" ", "T"));
		request.setAttribute("observacao", ligacao.getObs());

		request.getRequestDispatcher("/ligacao/formAltera.jsp").forward(request, response);
	}

}
