<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Visualizar Pizza</title>

    <link rel="stylesheet" href="css/pizza.css" />
    <link rel="stylesheet" href="css/central.css" />
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

      <div class="container-conteudo-pizza">
        <div class="item-conteudo-pizza">
            <img alt="Imagem Pizza" src="images/item-pizza.png" />
          </div>


          <div class="item-conteudo-pizza">
            <div class="titulo-conteudo">
              <h1>${pizza.nome}</h1>
            </div>
    
            <div class="item-descricao-pizza">
              <p>
				${pizza.descricao}
              </p>
            </div>
    
            <div class="item-pizza-preco">
                <h1>R$ ${pizza.preco}</h1>
            </div>

            <div class="item-editar-pizza">
            
              <a href="form?idPizza=${pizza.id}">
              	<button type="button">Editar prato</button>
              </a>
              
              <a href="deletarPizza?idPizza=${pizza.id}">
              	<button type="button">Deletar prato</button>
              </a> 

            </div>
          </div>
      </div>
    </section>

    <footer class="rodape">
      <div class="item-rodape">
        <img alt="Logo" src="images/logo.png" />
      </div>
      <div class="item-rodape">
        <p>© 2024 - Todos os direitos reservados.</p>
      </div>
    </footer>
  </body>
</html>