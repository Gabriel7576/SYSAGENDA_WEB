package br.com.gabriel.sysagenda.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gabriel.sysagenda.business.ContatoBss;
import br.com.gabriel.sysagenda.domain.Contato;

@WebServlet("/contato/add")
public class ContatoAddServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ContatoBss contatoBss = new ContatoBss();
		Contato contato = new Contato();

		String codContato = request.getParameter("codContato");

		// para adicionar
		if (codContato == null || codContato.equals("")) {

			contato.setCodContato(contatoBss.getCodContato());
			contato.setNome(request.getParameter("Nome"));
			contato.setTelefone(Long.parseLong(request.getParameter("Telefone")));

			contatoBss.adiciona(contato);

			// para alterar
		} else {

			contato.setCodContato(Integer.parseInt(request.getParameter("codContato")));
			contato.setNome(request.getParameter("Nome"));
			contato.setTelefone(Long.parseLong(request.getParameter("Telefone")));

			contatoBss.alteraContato(contato);
		}

		response.sendRedirect("index.jsp");
	}

}
