package com.AllInSmall.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.AllInSmall.demo.model.Product;
import com.AllInSmall.demo.repository.ProductRepository;

@RestController
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@GetMapping()
	public Iterable<Product>getAllProduct(){
		Iterable<Product>products = productRepository.findAll();
		return products;
	}
		
}
