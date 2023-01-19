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

<jsp:useBean id="contatoBss"
	class="br.com.gabriel.sysagenda.business.ContatoBss" />

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
									<td><a href="../contato/index.jsp">Contatos</a></td>
								</tr>
								<tr align="center">
									<td><a href="index.jsp">Ligações</a></td>
								</tr>
							</table></td>
						<td width="80%">
							<!-- InstanceBeginEditable name="Conteudo" -->
							<form id="formulario" name="formulario" method="post"
								action="add">
								<table width="100%">
									<tr>
										<td>Ligaçâo</td>
									</tr>
								</table>
								<table width="100%">
									<tr>
										<td width="34%">Nome do Contato:</td>
										<td width="66%"><label for="nome2"></label> <select
											name="menuContato" id="menuContato">
												<c:forEach var="contatos" items="${contatoBss.getLista()}">
													<option value="${contatos.getCodContato()}">${contatos}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td>Data e Hora:</td>
										<td><label for="Data"></label> <input
											type="datetime-local" name="dataHora" id="dataHora"
											max="2100-12-31T00:00" /></td>
									</tr>
									<tr>
										<td valign="top">Observação:</td>
										<td><label for="Obs"></label> <textarea name="observ"
												id="observ" cols="45" rows="3" style="resize: none"></textarea></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td><input type="submit" name="button" id="button"
											value="Salvar" onclick="return validaHora()" /></td>
										<script type="text/javascript" language="javascript">
											function validaHora() {
												var dataHora = document.getElementById("dataHora");
												
												if (dataHora.value === "") {
													alert("data é obrigatorio!");
													return false;
												}
											}
										</script>
									</tr>
								</table>
								<table width="100%" border="0">
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
							</form> <!-- InstanceEndEditable -->
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
