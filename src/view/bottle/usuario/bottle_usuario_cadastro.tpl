<%
    if observador_tipo is '0':
%>
    <input type="radio" name="tipo_usuario" value="1">Gestor
    <input type="radio" name="tipo_usuario" value="2">Diretor
    <input type="radio" name="tipo_usuario" value="3">Professor
    <input type="radio" name="tipo_usuario" value="6" checked=true>Aluno


<%
    elif observador_tipo is '1':
%>
    <input type="radio" name="tipo_usuario" value="2">Diretor
    <input type="radio" name="tipo_usuario" value="3">Professor
    <input type="radio" name="tipo_usuario" value="6">Aluno
<%
    elif observador_tipo is '2':
%>
    <input type="radio" name="tipo_usuario" value="3">Professor
    <input type="radio" name="tipo_usuario" value="6">Aluno

<%
    elif observador_tipo is '3':
%>
    <input type="radio" name="tipo_usuario" value="6">Aluno
<%
    end
%>