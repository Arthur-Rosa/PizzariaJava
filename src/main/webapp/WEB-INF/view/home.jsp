<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pizza - Restaurante</title>

    <link rel="stylesheet" href="css/home.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="css/central.css" />

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

    <section class="content-one">
      <div class="container-content">
        <div class="content-item">
          <img alt="Pizza" src="images/pizza.png" />
        </div>
        <div class="content-item">
          <h2>Sabores inigualÃ¡veis</h2>
          <p>Sinta o cuidado do preparo com ingredientes selecionados</p>
        </div>
      </div>
    </section>

    <section class="conteudo-pizzas">
      <div class="titulo-pizza">
        <h1>Refeições</h1>
      </div>
      <div class="items-pizzas">
        <!-- For {  -->
        <!-- ${pizzas} => ArrayList<Pizza> pizzas  -->
        <c:forEach items="${pizzas}" var="pizza" >
	        <a href="pizza?idPizza=${pizza.id}"
	          >
	          <!-- /pizza ? idPizza=2  -->
	          <div class="pizza">
	            <img src="images/item-pizza.png" alt="Pizza" />
	            <h2>${pizza.nome}</h2> <!-- pizza.getNome();  -->
	            <p>${pizza.descricao}</p>
	            <h1>R$ ${pizza.preco}</h1>
	          </div>
	          </a
	        >
        </c:forEach>
        
		<!-- }  -->
      </div>
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