<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<jsp:useBean id="ligacaoBss" class="br.com.gabriel.sysagenda.business.LigacaoBss" />
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
								<tr align="center"><td><a href="../contato/index.jsp">Contatos</a></td>
								</tr>
								<tr align="center">
									<td><a href="index.jsp">Ligações</a></td>
								</tr>
							</table></td>
						<td width="80%">
							<!-- InstanceBeginEditable name="Conteudo" -->
							<table width="100%" border="0">
								<tr align="center" valign="middle">
									<td width="79%">Ligações</td>
									<td width="21%"><a href="form.jsp"><img src="../img/adicionar-usuario.png" /></a></td>
								</tr>
								<tr>
									<td colspan="2"><table width="100%" border="1">
											<tr>
												<td width="11%" align="left">Nome</td>
												<td width="24%" align="left">Data e Hora</td>
												<td width="27%" align="left">Observação</td>
												<td width="9%" align="center">Apagar</td>
												<td width="7%" align="center">Editar</td>
											</tr>

											<jsp:useBean id="contatoBss" class="br.com.gabriel.sysagenda.business.ContatoBss" />

											<c:forEach var="ligacao" items="${ligacaoBss.getlista()}">
												<tr>

													<td height="27">${contatoBss.getContato(ligacao.getId().getCodContato()).getNome()}</td>
													<td><fmt:formatDate pattern="dd/MM/yyyy HH:MM" value="${ligacao.getDataHora()}" /></td>
													<td>${ligacao.getObs()}</td>
													<td align="center"><a href="remove?codLigacao=${ligacao.getId().getCodLigacao()}&codContato=${ligacao.getId().getCodContato()}"><img src="../img/lixeira.png" /></a></td>
													<td align="center"><a href="verifica?codLigacao=${ligacao.getId().getCodLigacao()}&codContato=${ligacao.getId().getCodContato()}"><img src="../img/botao-editar.png" /></a></td>
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
