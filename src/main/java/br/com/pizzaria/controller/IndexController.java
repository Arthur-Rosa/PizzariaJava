package br.com.pizzaria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.pizzaria.dao.ConnectionFactory;
import br.com.pizzaria.dao.PizzaDao;
import br.com.pizzaria.model.Pizza;

// Anotação
@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String inicio() {
		// Conectar ao banco de dados
		ConnectionFactory.conectar();
		// Redirecionar para rota /home
		return "redirect:home";
	}
	
	@RequestMapping("/home") // http://localhost:8080 /
	// String -> Retorno de uma pagina
	public String index(Model model) { // org.springframework
		PizzaDao dao = new PizzaDao();
		
		// items="${pizzas}"
		model.addAttribute("pizzas", dao.listar());
		return "home"; // home.html
	}
	
	@RequestMapping("/form")
	public String form(Long idPizza, Model model) {
		PizzaDao dao = new PizzaDao();
		
		Pizza p = new Pizza();
		
		if (idPizza != null) {
			p = dao.buscar(idPizza);
		}
		
		model.addAttribute("pizza", p);
		
		return "form"; // form.html
	}
	
	@RequestMapping("/pizza")
	public String pizza(Long idPizza, Model model) {
		// /pizza?idPizza=543
		PizzaDao dao = new PizzaDao();
		
		model.addAttribute("pizza", dao.buscar(idPizza));
		
		return "pizza";
	}
	
	@RequestMapping(value = "adicionarPizza", method = RequestMethod.POST)
	public String adicionarPizza(Pizza pizza) {
		PizzaDao dao = new PizzaDao();
		dao.inserir(pizza);
		return "redirect:home";
	}
	
	// /atualizarPizza || GET | POST | PUT | DELETE
	/**
	 * GET - Buscar informações
	 * POST - Criar informações
	 * PUT - Atualizar informações
	 * DELETE - Deletar informações
	 */
	@RequestMapping(value = "atualizarPizza", method = RequestMethod.POST)
	public String atualizarPizza(Long idPizza, Pizza p) {
		PizzaDao dao = new PizzaDao();
		
		dao.atualizar(p, idPizza);
		
		return "redirect:home";
	}
	
	@RequestMapping("deletarPizza")
	public String deletarPizza(Long idPizza) {
		
		PizzaDao dao = new PizzaDao();
		dao.excluir(idPizza);
		
		return "home";
	}
	
	
}
