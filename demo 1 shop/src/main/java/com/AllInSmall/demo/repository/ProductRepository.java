package com.AllInSmall.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.AllInSmall.demo.model.Product;


public interface ProductRepository extends JpaRepository<Product,Long> {
	
}
	