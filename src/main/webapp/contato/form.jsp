<%@page import="br.com.gabriel.sysagenda.business.ContatoBss"%>
<%@page import="br.com.gabriel.sysagenda.domain.Contato"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	function valida_form() {
		var nome = document.getElementById("Nome");
		var telefone = document.getElementById("Telefone");
		
		if(nome.value === ""){
			alert("Nome não preenchido!!");
			nome.focus();
			return false;
		}
		if(telefone.value === ""){
			alert("Telefone Não preenchido!!");
			telefone.focus();
			return false;
		}
	}
	
	function verificaTelefone() {
		var telefone = document.getElementById("Telefone");
		
		if(telefone.value.length > 11){
			alert("Telefone Não deve ter mais de 11 caracteres");
			return false;
		}
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
								<tr>
									<td>Contatos</td>
								</tr>
								<tr>
									<td><form id="form1" name="form1" method="post"
											action="add">
											<table width="100%" border="0">
												<tr>
													<td>Codigo do Contato:</td>
													<td><label for="codContato"></label> <input
														type="text" name="codContato" id="codContato"
														readonly="readonly" value="${contato.getCodContato()}" /></td>
												</tr>
												<tr>
													<td>Nome:</td>
													<td><label for="nome"></label> <input type="text"
														name="Nome" id="Nome" value="${contato.getNome()}" /></td>
												</tr>
												<tr>
													<td>Telefone:</td>
													<td><label for="telefone"></label> <input
														type="number" name="Telefone" id="Telefone"
														value="${contato.getTelefone()}"
														onkeypress="return verificaTelefone()"/></td>
												</tr>

												<tr align="right">
													<td align="right">&nbsp;</td>
													<td align="left"><input type="submit" name="btnEnviar"
														id="btnEnviar" value="Salvar"
														onclick="return valida_form()" /></td>
												</tr>
											</table>
										</form></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
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
