<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Form - Pizza</title>
    <link rel="stylesheet" href="css/central.css" />
    <link rel="stylesheet" href="css/formulario.css" />

    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
  </head>
  <body>
    <header class="navbar">
      <div class="container-navbar">
        <div class="item-nav">
          <div class="logo">
            <img alt="Logo" src="images/logo.png" />
            <span>admin</span>
          </div>
        </div>
        <div class="item-nav">
          <input type="text" placeholder="Busque por prato ou ingredientes" />
        </div>
        <div class="item-nav">
          <a href="form">
            <button type="button">Novo prato</button></a
          >
        </div>
      </div>
    </header>

    <section class="conteudo-pizza">
      <div class="container-titulo">
        <h1><a href="home">< Voltar</a></h1>
      </div>

      <div class="conteudo-form">
        <h1>Adicionar Pizza</h1>
		
        <br />
		<form method="POST" action="${pizza.id != null ? 'atualizarPizza' : 'adicionarPizza' }?idPizza=${pizza.id}">         
        <div class="form-pizza">
          <div class="campo-imagem">
            <p>Imagem da Pizza</p>
            <input class="custom-file-input" type="file" placeholder="Selecione a Imagem" />
          </div>

          <div class="campo-nome">
            <p>Nome</p>
            <input value="${pizza.nome}" name="nome" type="text" placeholder="Ex: Pizza Marguerita" />
          </div>

          <div class="campo-preco">
            <p>Preço</p>
            <input value="${pizza.preco}" name="preco" type="text" placeholder="R$ 00,00" />
          </div>
        </div>

        <div class="campo-descricao">
          <p>Descrição</p>
          <textarea
          	value="${pizza.descricao}"
          	name="descricao"
            placeholder="Fale brevemente sobre o prato, seus ingredientes e composiÃ§Ã£o"
          >
          </textarea>
        </div>

        <div class="botao-enviar">
          <button>Salvar alterações</button>
        </div>
      </div>
      </form>
    </section>

    <footer class="rodape">
      <div class="item-rodape">
        <img alt="Logo" src="images/logo.png" />
      </div>
      <div class="item-rodape">
        <p>Â© 2024 - Todos os direitos reservados.</p>
      </div>
    </footer>
  </body>
</html>