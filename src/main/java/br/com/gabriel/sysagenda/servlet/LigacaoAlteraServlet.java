package br.com.gabriel.sysagenda.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gabriel.sysagenda.business.LigacaoBss;
import br.com.gabriel.sysagenda.domain.Ligacao;
import br.com.gabriel.sysagenda.domain.LigacaoId;
import br.com.gabriel.sysagenda.util.Funcoes;

@WebServlet("/ligacao/altera")
public class LigacaoAlteraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Ligacao ligacao = new Ligacao();
		LigacaoId id = new LigacaoId();
		LigacaoBss ligacaoBss = new LigacaoBss();

		try {
			ligacao.setId(id);
			id.setCodContato(Integer.parseInt(request.getParameter("codContato")));
			id.setCodLigacao(Integer.parseInt(request.getParameter("codLigacao")));

			Date date = new SimpleDateFormat("yyyy-MM-dd HH:MM")
					.parse(request.getParameter("dataHora").replace("T", " "));
			ligacao.setDataHora(Funcoes.strToDate(Funcoes.dateToStr(date)));

			ligacao.setObs(request.getParameter("observ"));

			ligacaoBss.alteraLigacao(ligacao);

			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
