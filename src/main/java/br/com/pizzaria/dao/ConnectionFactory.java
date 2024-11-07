package br.com.pizzaria.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	private static final String USER = "root";
	private static final String SENHA = "root";
	// biblioteca -> java.sql
	public static Connection conectar() {
		// java database connection
		try {
			// invocar a biblioteca de conexao ao banco de dados
			Class.forName("com.mysql.jdbc.Driver");
			// CREATE DATABASE pizzaria;
			Connection conexao = 
				DriverManager
					.getConnection("jdbc:mysql://localhost:3306/pizzaria", USER, SENHA);
			return conexao;
		} catch (Exception e) {
			// throw -> jogar para cima
			// RuntimeException -> Erro que aconteceu enquanto o codigo rodava
			throw new RuntimeException();
		}
	}
}
