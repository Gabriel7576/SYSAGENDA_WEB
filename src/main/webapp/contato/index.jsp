<%@page import="br.com.gabriel.sysagenda.servlet.ContatoRemoveServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- InstanceBegin template="/Templates/template01.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>SYSAGENDA</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script type="text/javascript" language="javascript">
function informa() {
	return confirm("Essa ação vai apagar todos as ligações desse contato!!");
}
</script>
<body>
	<table width="768" border="1" align="center">
		<tr align="center">
			<td>SysAgenda</td>
		</tr>
		<tr>
			<td><table width="100%" border="0">
					<tr align="center" valign="top">
						<td width="20%"><table width="100%" border="1">
								<tr align="center">
									<td><a href="../index.jsp">Home</a></td>
								</tr>
								<tr align="center">
									<td><a href="index.jsp">Contatos</a></td>
								</tr>
								<tr align="center">
									<td><a href="../ligacao/index.jsp">Ligações</a></td>
								</tr>
							</table></td>
						<td width="80%">
							<!-- InstanceBeginEditable name="Conteudo" -->
							<table width="100%" border="0">
								<tr align="center" valign="middle">
									<td width="79%">Contatos</td>
									<td width="21%"><a href="form.jsp"><img
											src="../img/adicionar-usuario.png" /></a></td>
								</tr>
								<tr>
									<td colspan="2"><table width="100%" border="1">
											<tr>
												<td width="9%" align="left">Codigo</td>
												<td width="37%" align="left">Nome</td>
												<td width="32%" align="left">Telefone</td>
												<td width="13%" align="center">Apagar</td>
												<td width="9%" align="center">Editar</td>
											</tr>

											<jsp:useBean id="contatoBss"
												class="br.com.gabriel.sysagenda.business.ContatoBss" />
											<c:forEach var="contato" items="${contatoBss.getLista()}">
												<tr>
													<td>${contato.getCodContato()}</td>
													<td>${contato.getNome()}</td>
													<td>${contato.getTelefone()}</td>
													<td align="center"><a
														href="remove?codContato=${contato.getCodContato()}" onclick="return informa()"><img
															src="../img/lixeira.png" /></a></td>
													<td align="center"><a
														href="verifica?codContato=${contato.getCodContato()}"><img
															src="../img/botao-editar.png" /> </a></td>
												</tr>

											</c:forEach>
										</table></td>
								</tr>
							</table> <!-- InstanceEndEditable -->
						</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td>Feito por gabriel</td>
		</tr>
	</table>
</body>
<!-- InstanceEnd -->
</html>
