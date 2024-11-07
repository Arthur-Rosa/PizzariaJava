package br.com.pizzaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.pizzaria.model.Pizza;

public class PizzaDao {
	private Connection conexao;
	
	// PizzaDao = new PizzaDao();
	public PizzaDao() {
		conexao = ConnectionFactory.conectar();
	}
	
	public void inserir(Pizza pizza) {
		String sql = "INSERT INTO pizzas (nome, preco, descricao)"
				+ "VALUES (?, ?, ?)";
		// java.sql
		PreparedStatement smtp; // Executar a consulta sql
		try {
			// preparar a consulta
			smtp = conexao.prepareStatement(sql);
			// Preencher a posicao 1 com o nome da pizza
			smtp.setString(1, pizza.getNome());
			smtp.setDouble(2, pizza.getPreco());
			smtp.setString(3, pizza.getDescricao());
			
			smtp.execute(); // executar
			smtp.close();
			conexao.close();
		} catch (Exception e) {
			System.out.println("Deu erro: " + e.getMessage());
		}
	}
	
	// java.util
	public List<Pizza> listar() {
		String sql = "SELECT * FROM pizzas"; // motos, donuts, filmes, racao...
		
		PreparedStatement smtp;
		List<Pizza> pizzas = new ArrayList<Pizza>();
		try {
			smtp = conexao.prepareStatement(sql);
			// resultado = Lista de Pizzas [], [ {}, {} ]
			// java.sql
			ResultSet resultado = smtp.executeQuery();
			// resultado ( Lista de Pizzas <ResultSet> )
			while (resultado.next()) {
				Pizza pi = new Pizza();
				// pegando o nome da coluna
				pi.setId(resultado.getLong("id"));
				pi.setNome(resultado.getString("nome"));
				pi.setPreco(resultado.getDouble("preco"));
				pi.setDescricao(resultado.getString("descricao"));
				pizzas.add(pi);
			}
			resultado.close();
			smtp.close();
			conexao.close();
			return pizzas;
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public Pizza buscar(Long id) {
		String sql = "SELECT * FROM pizzas WHERE id = ?";
		
		PreparedStatement smtp;
		
		try {
			smtp = conexao.prepareStatement(sql);
			smtp.setLong(1, id);
			ResultSet resultado = smtp.executeQuery();
			Pizza p = null; // não instanciando 
			
			while (resultado.next()) {
				p = new Pizza();
				p.setId(resultado.getLong("id"));
				p.setNome(resultado.getString("nome"));
				p.setPreco(resultado.getDouble("preco"));
				p.setDescricao(resultado.getString("descricao"));
			}
			
			smtp.close();
			resultado.close();
			conexao.close();
			return p;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public void excluir(Long id) {
		String sql = "DELETE FROM pizzas WHERE id = ?";
		
		PreparedStatement smtp;
		
		try {
			smtp = conexao.prepareStatement(sql);
			smtp.setLong(1, id); // id = ?
			
			smtp.execute();
			smtp.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	
	public void atualizar(Pizza pizza, Long id) {
		String sql = "UPDATE pizzas SET nome = ?, "
				+ "preco = ?, descricao = ? WHERE id = ?";
		
		PreparedStatement smtp;
		
		try {
			// 1 => nome, 2 => preco, 3 => descricao, 4 => id
			smtp = conexao.prepareStatement(sql);
			smtp.setString(1, pizza.getNome());
			smtp.setDouble(2, pizza.getPreco());
			smtp.setString(3, pizza.getDescricao());
			smtp.setLong(4, id);
			
			smtp.execute();
			smtp.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	
}
