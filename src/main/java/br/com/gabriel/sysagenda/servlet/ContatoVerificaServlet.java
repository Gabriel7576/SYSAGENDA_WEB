package br.com.gabriel.sysagenda.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gabriel.sysagenda.business.ContatoBss;

@WebServlet("/contato/verifica")
public class ContatoVerificaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String codContato = request.getParameter("codContato");

		if (codContato != null) {

			ContatoBss bss = new ContatoBss();

			request.setAttribute("contato", bss.getContato(Integer.parseInt(codContato)));

			request.getRequestDispatcher("/contato/form.jsp").forward(request, response);

		}
	}

}
